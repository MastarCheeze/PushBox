package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.addons.ui.ButtonLabelStyle;
import flixel.addons.ui.FlxUIButton;
import flixel.group.FlxGroup;
import flixel.text.FlxText;
import flixel.util.FlxColor;

class LevelsState extends FlxState {
	var levelsTitle:FlxText;
	var levelsButtons:FlxTypedGroup<FlxUIButton>;

	override public function create() {
		super.create();

		levelsTitle = new FlxText(0, 25 * Const.SCALE, 0, "Levels", Math.floor(22 * Const.SCALE));
		levelsTitle.screenCenter(X);
		add(levelsTitle);

		levelsButtons = new FlxTypedGroup<FlxUIButton>();
		for (i in 0...Const.TOTALLEVELS) {
			var xGrid = i % 5;
			var yGrid = Math.floor(i / 5);

			var buttonWidth = 20 * Const.SCALE;
			var padding = 10 * Const.SCALE;
			var xPos = (FlxG.width / 2 - 70 * Const.SCALE) + (buttonWidth + padding) * xGrid;
			var yPos = 75 * Const.SCALE + (buttonWidth + padding) * yGrid;

			var button = new FlxUIButton(xPos, yPos, Std.string(i + 1), clickLevel.bind(i), false);
			button.loadGraphic("assets/images/level_buttons.png", true, 16, 16);
			button.setGraphicSize(Math.floor(20 * Const.SCALE));
			button.updateHitbox();
			button.label.fieldWidth *= Const.SCALE;
			button.autoCenterLabel();
			button.setCenterLabelOffset(2 * Const.SCALE, 4 * Const.SCALE);
			button.setLabelFormat(null, Math.floor(8 * Const.SCALE), FlxColor.BLACK);

			button.onDown.callback = function() {
				button.setCenterLabelOffset(2 * Const.SCALE, 6 * Const.SCALE);
				FlxG.sound.play("assets/sounds/click_start.wav", 0.2);
			};

			button.onUp.callback = function() {
				button.setCenterLabelOffset(2 * Const.SCALE, 4 * Const.SCALE);
				clickLevel(i);
				FlxG.sound.play("assets/sounds/click_end.wav", 0.2);
			};

			button.onOut.callback = function() {
				button.setCenterLabelOffset(2 * Const.SCALE, 4 * Const.SCALE);
			}

			levelsButtons.add(button);
			add(button);
		}

		if (!Const.GAMESTARTED) {
			FlxG.sound.playMusic("assets/music/push_box.ogg", 1);
			Const.GAMESTARTED = true;
		}

		camera.fade(FlxColor.BLACK, 0.33, true);
	}

	function clickLevel(levelNo) {
		FlxG.camera.fade(FlxColor.BLACK, .33, false, function() {
			FlxG.switchState(new PlayState(levelNo));
		});
	}
}
