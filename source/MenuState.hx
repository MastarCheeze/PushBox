package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.system.scaleModes.RatioScaleMode;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;

class MenuState extends FlxState {
	var titleText:FlxText;
	var playButton:FlxButton;
	var creatorText:FlxText;

	override public function create() {
		super.create();

		Const.SCALE = FlxG.width / 512;

		FlxG.scaleMode = new RatioScaleMode();

		titleText = new FlxText(0, 25 * Const.SCALE, 0, "PUSH BOX", Math.floor(64 * Const.SCALE));
		titleText.screenCenter(X);
		add(titleText);

		playButton = new FlxButton(0, titleText.x + titleText.height - (10 * Const.SCALE), null);
		playButton.loadGraphic("assets/images/play_button.png", true, 26, 16);
		playButton.setGraphicSize(Math.floor(100 * Const.SCALE));
		playButton.updateHitbox();
		playButton.screenCenter(X);
		playButton.onDown.callback = function() {
			FlxG.sound.play("assets/sounds/click_start.wav", 0.2);
		};
		playButton.onUp.callback = function() {
			FlxG.sound.play("assets/sounds/click_end.wav", 0.2);
			startGame();
		};
		add(playButton);

		creatorText = new FlxText(0, 0, 0, "by mastarcheeze");
		creatorText.setFormat("assets/fonts/PixelFont.ttf", Math.floor(8 * Const.SCALE), 0xff666666);
		creatorText.setPosition(FlxG.width - creatorText.width - (5 * Const.SCALE), FlxG.height - creatorText.height - (5 * Const.SCALE));
		add(creatorText);

		camera.fade(FlxColor.BLACK, 0.33, true);
	}

	function startGame() {
		camera.fade(FlxColor.BLACK, 0.33, false, function() {
			FlxG.switchState(new LevelsState());
		});
	}
}
