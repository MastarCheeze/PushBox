package;

import haxe.Constraints.Function;

class Player extends MovableObject {
	override public function new(x:Float, y:Float) {
		super(x, y, true);
		loadGraphic("assets/images/player.png", true, Const.BLOCKSIZE, Const.BLOCKSIZE);
	}

	/*override public function moveDir(xDir:Int, yDir:Int, ?onComplete:Function) {
		super.moveDir(xDir, yDir, onComplete);
	}*/
	// set graphicw direction
	public function setSpriteDirection(xDir:Int, yDir:Int) {
		if (yDir == -1)
			frame = frames.frames[0];
		else if (yDir == 1)
			frame = frames.frames[1];
		else if (xDir == -1)
			frame = frames.frames[2];
		else if (xDir == 1)
			frame = frames.frames[3];
	}
}
