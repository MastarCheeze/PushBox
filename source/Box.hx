package;

import flixel.FlxG;

class Box extends MovableObject {
	override public function new(x:Float, y:Float) {
		super(x, y, true);
		loadGraphic("assets/images/box.png", false, Const.BLOCKSIZE, Const.BLOCKSIZE);
	}
}
