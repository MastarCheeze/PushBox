package;

import haxe.rtti.CType.Abstractdef;

class PistonBase extends BaseObject {
	public static var allSprites = new Array<PistonBase>();

	var groupId:Int;

	public var pusher:PistonPusher;
	public var button:PistonButton;
	public var inverted:Bool;

	override public function new(x:Float, y:Float, rotation:Float, groupId:Int, ?inverted:Bool) {
		var rotationOffset = switch rotation {
			case 0: {x: 0, y: 0};
			case 90: {x: Math.floor(-16 * Const.SCALE), y: 0};
			case 180: {x: Math.floor(-16 * Const.SCALE), y: Math.floor(-16 * Const.SCALE)};
			case 270: {x: 0, y: Math.floor(-16 * Const.SCALE)};
			default: null;
		}

		super(x + rotationOffset.x, y + rotationOffset.y);

		angle = rotation;
		this.groupId = groupId;
		this.inverted = if (inverted == null || inverted == false) false else true;
		allSprites.push(this);

		var dir = getDir(rotation);
		pusher = new PistonPusher(this.x, this.y, angle, dir.xDir, dir.yDir, this);

		loadGraphic("assets/images/piston_base.png", false, Const.BLOCKSIZE, Const.BLOCKSIZE);
	}

	public static function linkSprites() {
		for (base in allSprites) {
			for (button in PistonButton.allSprites) {
				if (base.groupId == button.groupId) {
					base.button = button;
					button.base = base;
				}
			}
		}
	}

	public static function resetAllJustExtended() {
		for (base in allSprites) {
			base.pusher.justExtended = false;
		}
	}

	public static function clearAllSprites() {
		allSprites = [];
		PistonButton.allSprites = [];
	}

	static public function getRotation(xDir:Int, yDir:Int):Null<Float> {
		if (yDir == -1) {
			return 270;
		} else if (yDir == 1) {
			return 90;
		} else if (xDir == -1) {
			return 180;
		} else if (xDir == 1) {
			return 0;
		}

		return null;
	}

	static public function getDir(rotation:Float):{xDir:Null<Int>, yDir:Null<Int>} {
		return switch rotation {
			case 270: {xDir: 0, yDir: -1}
			case 90: {xDir: 0, yDir: 1}
			case 180: {xDir: -1, yDir: 0}
			case 0: {xDir: 1, yDir: 0}
			default: {xDir: null, yDir: null}
		}
	}
}
