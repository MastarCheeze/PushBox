package;

import haxe.Constraints.Function;

class PistonPusher extends MovableObject {
	public var base:PistonBase;

	public var xDir:Int;
	public var yDir:Int;

	public var extended:Bool;
	public var justExtended:Bool;

	override public function new(x:Float, y:Float, rotation:Float, xDir:Int, yDir:Int, base:PistonBase) {
		super(x, y, false);

		angle = rotation;
		this.base = base;
		this.xDir = xDir;
		this.yDir = yDir;
		extended = false;

		if (base.inverted) {
			teleport(xGrid + xDir, yGrid + yDir, true);
			extended = true;
		}

		loadGraphic("assets/images/piston_pusher.png", false, Const.BLOCKSIZE, Const.BLOCKSIZE);
	}

	public function moveOut(?onComplete:Function) {
		if (!extended) {
			move(xGrid + xDir, yGrid + yDir, onComplete);
			extended = true;
		}
	}

	public function moveIn(?onComplete:Function) {
		if (extended) {
			move(xGrid - xDir, yGrid - yDir, onComplete);
			extended = false;
		}
	}
}
