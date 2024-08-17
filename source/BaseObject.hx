package;

import flixel.FlxSprite;

class BaseObject extends FlxSprite {
	public var xGrid:Int;
	public var yGrid:Int;

	public var canCollide:Bool;

	override public function new(x:Float, y:Float, canCollide:Bool = true) {
		super(x, y);
		var gridPos = calcGridPos(x, y);
		setGridPos(gridPos.x, gridPos.y);

		this.canCollide = canCollide;

		scale.set(Const.SCALE, Const.SCALE);
	}

	// move to destination without tweening
	public function teleport(xGrid:Int, yGrid:Int, ?overrideKey) {
		setGridPos(xGrid, yGrid);

		var pos = calcPos(xGrid, yGrid);
		setPosition(pos.x, pos.y);
	}

	// set xGrid and yGrid
	public function setGridPos(xGrid:Int, yGrid:Int) {
		this.xGrid = xGrid;
		this.yGrid = yGrid;
	}

	// get xy position from grid position
	public static function calcPos(xGrid:Int, yGrid:Int):{x:Float, y:Float} {
		return {
			x: xGrid * Const.BLOCKSIZE * Const.SCALE,
			y: yGrid * Const.BLOCKSIZE * Const.SCALE
		};
	}

	// get grid position from xy position
	public static function calcGridPos(xPos:Float, yPos:Float):{x:Int, y:Int} {
		return {
			x: Math.floor(xPos / (Const.BLOCKSIZE * Const.SCALE)),
			y: Math.floor(yPos / (Const.BLOCKSIZE * Const.SCALE))
		};
	}
}
