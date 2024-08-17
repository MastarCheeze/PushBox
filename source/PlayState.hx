package;

import flixel.FlxBasic;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.addons.editors.ogmo.FlxOgmo3Loader;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.system.FlxSound;
import flixel.text.FlxText;
import flixel.tweens.FlxTween;
import flixel.tweens.misc.ColorTween;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;

using flixel.util.FlxSpriteUtil;

class PlayState extends FlxState {
	var levelNo:Int;
	var gameOver:Bool;
	var levelText:FlxText;
	var resetButton:FlxButton;
	var exitButton:FlxButton;

	var player:Player;
	var playerMoving:Bool;
	var actionsRunning = 0;

	var allCollidables:Array<BaseObject>;
	var allMovables:Array<MovableObject>;
	var allBoxes:Array<Box>;
	var allBoxSlots:Array<BoxSlot>;
	var allTeleporters:Array<Teleporter>;
	var allPistonButtons:Array<PistonButton>;

	var topmostLayer:FlxTypedGroup<BaseObject>;
	var aboveWireLayer:FlxTypedGroup<BaseObject>;
	var wireLayer:FlxTypedGroup<FlxBasic>;
	var belowWireLayer:FlxTypedGroup<BaseObject>;

	var toReverse:Array<Array<{obj:BaseObject, x:Int, y:Int}>>;

	override public function new(levelNo:Int = 0) {
		super();

		this.levelNo = levelNo;
	}

	override public function create() {
		super.create();

		// initialise these things
		gameOver = false;
		playerMoving = false;

		levelText = new FlxText(0, 10 * Const.SCALE, 0, "LEVEL " + (levelNo + 1));
		levelText.setFormat("assets/fonts/PixelFont.ttf", Math.floor(8 * Const.SCALE));
		levelText.screenCenter(X);
		add(levelText);

		exitButton = new FlxButton(FlxG.width - 30 * Const.SCALE, 10 * Const.SCALE, null);
		exitButton.loadGraphic("assets/images/exit_button.png", true, 16, 16);
		exitButton.setGraphicSize(Math.floor(20 * Const.SCALE));
		exitButton.updateHitbox();
		exitButton.onDown.callback = function() {
			FlxG.sound.play("assets/sounds/click_start.wav", 0.2);
		};
		exitButton.onUp.callback = function() {
			FlxG.sound.play("assets/sounds/click_end.wav", 0.2);
			exit();
		};
		add(exitButton);

		resetButton = new FlxButton(FlxG.width - 60 * Const.SCALE, 10 * Const.SCALE, null);
		resetButton.loadGraphic("assets/images/reset_button.png", true, 16, 16);
		resetButton.setGraphicSize(Math.floor(20 * Const.SCALE));
		resetButton.updateHitbox();
		resetButton.onDown.callback = function() {
			FlxG.sound.play("assets/sounds/click_start.wav", 0.2);
		};
		resetButton.onUp.callback = function() {
			FlxG.sound.play("assets/sounds/click_end.wav", 0.2);
			reset();
		};
		add(resetButton);

		// initialise target groups
		allCollidables = new Array<BaseObject>();
		allMovables = new Array<MovableObject>();
		allBoxes = new Array<Box>();
		allBoxSlots = new Array<BoxSlot>();
		allTeleporters = new Array<Teleporter>();
		allPistonButtons = new Array<PistonButton>();

		// initialise sprite layers
		topmostLayer = new FlxTypedGroup<BaseObject>(); // for blocks above everything (box, player)
		aboveWireLayer = new FlxTypedGroup<BaseObject>(); // for blocks that must cover wire (piston, teleporter)
		wireLayer = new FlxTypedGroup<FlxBasic>(); // for wire paths
		belowWireLayer = new FlxTypedGroup<BaseObject>(); // for blocks below wire (wall)
		add(belowWireLayer);
		add(wireLayer);
		add(aboveWireLayer);
		add(topmostLayer);

		// clear sprites linking cache from previous level
		Teleporter.clearAllSprites();
		PistonBase.clearAllSprites();

		// load level from tilemap
		var levelPath = "assets/data/level" + (levelNo + 1) + ".json";
		var map = new FlxOgmo3Loader("assets/data/push_box.ogmo", levelPath);
		map.loadEntities(createEntities, "entityLayer");

		// set up linked blocks
		Teleporter.linkSprites();
		PistonBase.linkSprites();

		// set up undo
		toReverse = new Array<Array<{obj:BaseObject, x:Int, y:Int}>>();

		// fade into level
		camera.fade(FlxColor.BLACK, 0.33, true);
	}

	override public function update(elapsed:Float) {
		super.update(elapsed);

		// player movement
		if (!gameOver && !playerMoving) {
			if (FlxG.keys.justPressed.W || FlxG.keys.justPressed.UP)
				movePlayer(0, -1);
			else if (FlxG.keys.justPressed.S || FlxG.keys.justPressed.DOWN)
				movePlayer(0, 1);
			else if (FlxG.keys.justPressed.A || FlxG.keys.justPressed.LEFT)
				movePlayer(-1, 0);
			else if (FlxG.keys.justPressed.D || FlxG.keys.justPressed.RIGHT)
				movePlayer(1, 0);
		}
	}

	function movePlayer(xDir, yDir) {
		playerMoving = true;
		Teleporter.enableAllTeleporters();
		PistonBase.resetAllJustExtended();
		actionsRunning = 0;

		// direction player is heading
		var xGrid = player.xGrid + xDir;
		var yGrid = player.yGrid + yDir;

		var obstacle = getObjectOnGrid(xGrid, yGrid, allCollidables);
		// if empty
		if (obstacle == null) {
			player.move(xGrid, yGrid, onMoveComplete.bind([player]));
			FlxG.sound.play("assets/sounds/move.wav");

			// if box
		} else if (Std.isOfType(obstacle, Box)) {
			var box = cast(obstacle, Box);
			FlxG.watch.add(box, "pixels");

			// if box front empty
			if (getObjectOnGrid(xGrid + xDir, yGrid + yDir, allCollidables) == null) {
				playerMoving = true;
				player.move(xGrid, yGrid, onMoveComplete.bind([player, box]));

				// check for boxslot click sound effect
				var onComplete = function() {};
				if (getObjectOnGrid(xGrid + xDir, yGrid + yDir, allBoxSlots) != null) {
					onComplete = function() {
						box.color = 0x00ff00;
						FlxG.sound.play("assets/sounds/snap.wav", 1.5);
						trace("done");
					};
				}

				box.move(xGrid + xDir, yGrid + yDir, onComplete);
				// if (onComplete == null)
				FlxG.sound.play("assets/sounds/drag.wav");
			} else {
				playerMoving = false;
			}
		} else {
			playerMoving = false;
		}

		player.setSpriteDirection(xDir, yDir);

		for (box in allBoxes) {
			box.color = 0xffffff;
		}
	}

	function onMoveComplete<T:MovableObject>(moved:Array<T>) {
		if (checkWin()) {
			gameOver = true;
			camera.fade(FlxColor.BLACK, 0.33, false, function() {
				if (levelNo >= Const.TOTALLEVELS - 1)
					FlxG.switchState(new MenuState());
				else
					FlxG.switchState(new PlayState(levelNo + 1));
			});
		}

		// for all piston buttons
		for (button in allPistonButtons) {
			var base = button.base;
			var pusher = base.pusher;

			// if contracted
			if (!pusher.extended) {
				// if not inverted
				if (!base.inverted) {
					// if block on button
					if (getObjectOnGrid(button.xGrid, button.yGrid, allCollidables) != null) {
						var xGrid = pusher.xGrid + pusher.xDir;
						var yGrid = pusher.yGrid + pusher.yDir;

						var obstacle = getObjectOnGrid(xGrid, yGrid, allMovables);
						// if empty
						if (obstacle == null) {
							pusher.moveOut(onActionComplete);
							pusher.extended = true;
							FlxG.sound.play("assets/sounds/piston_extend.wav", 0.2);

							// if box or player
						} else if (Std.isOfType(obstacle, Box) || Std.isOfType(obstacle, Player)) {
							// if obstacle front empty
							if (getObjectOnGrid(xGrid + pusher.xDir, yGrid + pusher.yDir, allCollidables) == null) {
								pusher.moveOut(onActionComplete);
								obstacle.move(xGrid + pusher.xDir, yGrid + pusher.yDir, onMoveComplete.bind([obstacle]));
								pusher.extended = true;
								FlxG.sound.play("assets/sounds/piston_extend.wav", 0.2);
							}
						}
					}
					// if inverted
				} else {
					// if no block on button
					if (getObjectOnGrid(button.xGrid, button.yGrid, allMovables) == null) {
						var xGrid = pusher.xGrid + pusher.xDir;
						var yGrid = pusher.yGrid + pusher.yDir;

						var obstacle = getObjectOnGrid(xGrid, yGrid, allMovables);
						// if empty
						if (obstacle == null) {
							pusher.moveOut(onActionComplete);
							pusher.extended = true;
							FlxG.sound.play("assets/sounds/piston_extend.wav", 0.2);

							// if box or player
						} else if (Std.isOfType(obstacle, Box) || Std.isOfType(obstacle, Player)) {
							// if obstacle front empty
							if (getObjectOnGrid(xGrid + pusher.xDir, yGrid + pusher.yDir, allCollidables) == null) {
								pusher.moveOut(onActionComplete);
								obstacle.move(xGrid + pusher.xDir, yGrid + pusher.yDir, onMoveComplete.bind([obstacle]));
								pusher.extended = true;
								FlxG.sound.play("assets/sounds/piston_extend.wav", 0.2);
							}
						}
					}
				}
				// if extended
			} else {
				// if not inverted
				if (!base.inverted) {
					// if no block on button
					if (getObjectOnGrid(button.xGrid, button.yGrid, allMovables) == null) {
						pusher.moveIn(onActionComplete);
						pusher.extended = false;
						FlxG.sound.play("assets/sounds/piston_retract.wav", 0.2);
					}
				} else {
					// if block on button
					if (getObjectOnGrid(button.xGrid, button.yGrid, allMovables) != null) {
						pusher.moveIn(onActionComplete);
						pusher.extended = false;
						FlxG.sound.play("assets/sounds/piston_retract.wav", 0.2);
					}
				}
			}
		}

		// for all teleporters
		for (teleporter in allTeleporters) {
			var counterpart = teleporter.counterpart;
			for (object in moved) {
				if (teleporter.xGrid == object.xGrid && teleporter.yGrid == object.yGrid) {
					if (getObjectOnGrid(counterpart.xGrid, counterpart.yGrid, allCollidables) == null && teleporter.disabled == false) {
						actionsRunning++;

						object.teleport(counterpart.xGrid, counterpart.yGrid);
						teleporter.disabled = true;
						counterpart.disabled = true;

						FlxG.sound.play("assets/sounds/teleport2.wav", 0.5);

						onActionComplete();
					}
				}
			}
		}

		if (actionsRunning <= 0)
			playerMoving = false;
	}

	function onActionComplete() {
		if (actionsRunning > 0) {
			actionsRunning--;
		} else {
			playerMoving = false;
		}
	}

	function checkWin():Bool {
		for (boxSlot in allBoxSlots) {
			var box = getObjectOnGrid(boxSlot.xGrid, boxSlot.yGrid, allBoxes);
			if (box == null)
				return false;
		}

		return true;
	}

	// create level
	function createEntities(entity:EntityData) {
		var x = entity.x * Const.SCALE;
		var y = entity.y * Const.SCALE;
		var prop = entity.values;

		switch (entity.name) {
			case "player":
				player = new Player(x, y);
				allCollidables.push(player);
				allMovables.push(player);
				topmostLayer.add(player);

			case "wall":
				var wall = new Wall(x, y);
				allCollidables.push(wall);
				belowWireLayer.add(wall);

			case "box":
				var box = new Box(x, y);
				allCollidables.push(box);
				allMovables.push(box);
				allBoxes.push(box);
				topmostLayer.add(box);

			case "teleporter":
				var teleporter = new Teleporter(x, y, prop.groupId);
				allTeleporters.push(teleporter);
				aboveWireLayer.add(teleporter);

			case "piston":
				var piston = new PistonBase(x, y, entity.rotation, prop.groupId, prop.inverted);
				allCollidables.push(piston);
				allCollidables.push(piston.pusher);
				allMovables.push(piston.pusher);
				topmostLayer.add(piston.pusher); // change both to aboveWireLayer if wire
				topmostLayer.add(piston); //

			case "pistonbutton":
				var pistonButton = new PistonButton(x, y, prop.groupId);
				allPistonButtons.push(pistonButton);
				aboveWireLayer.add(pistonButton);

			case "boxslot":
				var boxSlot = new BoxSlot(x, y);
				allBoxSlots.push(boxSlot);
				belowWireLayer.add(boxSlot);

			case "instructions":
				var imagePath:String;
				if (levelNo != 0) {
					imagePath = "assets/images/instructions/instruction" + (levelNo + 1) + ".png";
				} else {
					imagePath = "assets/images/instructions/pc_instruction1.png";
				}

				var instructions = new FlxSprite(x, y, imagePath);
				instructions.scale.set(Const.SCALE, Const.SCALE);
				instructions.updateHitbox();
				add(instructions);
		}
	}

	function reset() {
		camera.fade(FlxColor.BLACK, 0.33, false, function() {
			FlxG.switchState(new PlayState(levelNo));
		});
	}

	function exit() {
		camera.fade(FlxColor.BLACK, 0.33, false, function() {
			FlxG.switchState(new LevelsState());
		});
	}

	// not used
	static function drawWires(nodes:Array<{x:Float, y:Float}>, baseNode:{x:Float, y:Float}):FlxSprite {
		var canvas = new FlxSprite();
		canvas.makeGraphic(FlxG.width, FlxG.height, FlxColor.TRANSPARENT, true);

		for (index in 0...nodes.length) {
			var lastNode = if (index == 0) null else nodes[index - 1];
			var node = nodes[index];

			// calculate node center position
			var startX = (if (lastNode == null) baseNode.x else lastNode.x) + (Const.BLOCKSIZE / 2) - 1;
			var startY = (if (lastNode == null) baseNode.y else lastNode.y) + (Const.BLOCKSIZE / 2) - 1;
			var endX = node.x + (Const.BLOCKSIZE / 2) + 1;
			var endY = node.y + (Const.BLOCKSIZE / 2) + 1;

			// calculate rect bottom left and top right
			var bottomLeftX, bottomLeftY;
			var topRightX, topRightY;
			if (startX <= endX) {
				bottomLeftX = startX;
				topRightX = endX;
			} else {
				bottomLeftX = endX;
				topRightX = startX;
			}
			if (startY <= endY) {
				bottomLeftY = startY;
				topRightY = endY;
			} else {
				bottomLeftY = endY;
				topRightY = startY;
			}

			// calculate width
			var width = topRightX - bottomLeftX;
			var height = topRightY - bottomLeftY;

			// draw
			canvas.drawRect(bottomLeftX, bottomLeftY, width, height, 0xffe0e0e0);
		}

		return canvas;
	}

	static function getObjectOnGrid<T:BaseObject>(xGrid:Int, yGrid:Int, targets:Array<T>) {
		for (object in targets) {
			if (object.xGrid == xGrid && object.yGrid == yGrid) {
				return object;
			}
		}

		return null;
	}
}
/*
	Hello I am Chay ZE Xun. My gege says that he will not delete all this word.
	So see if he really will not delete all this word. Is it really? Pls tell me. 
	Me 2! I don't know why I say me 2. Oh is okay that I says that? I am so sry!
	Pls sry me. Thank You! Do my gege see all this word? I am so sary, right? 
	Oh my god, later my bro se me type like this! What on earth is i saying?
	Oh hello agin. Blabla pupu. hihdhihidhihe yay wuwu pipi! Yep yap! My bro
	not here! Now I can type a lot! He not here, I mean my Bro not here!
	I need ready bye liao. gduguygdu. Butidaysebyeeeee bai! I miss u all so
	I type agin haha agin wrong!! BaiBai bshdjskdjahkdbyeeeeeeeeeeeeeeeeeee!
 */
