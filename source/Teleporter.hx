package;

class Teleporter extends BaseObject {
	private static var allSprites = new Array<Teleporter>();

	public var groupId:Int;
	public var counterpart:Teleporter;
	public var disabled = false;

	override public function new(x:Float, y:Float, groupId:Int) {
		super(x, y, false);

		this.groupId = groupId;
		allSprites.push(this);

		loadGraphic("assets/images/teleporter.png", false, Const.BLOCKSIZE, Const.BLOCKSIZE);
	}

	public static function linkSprites() {
		for (teleporter in allSprites) {
			for (counterpart in allSprites) {
				if (teleporter.counterpart == null) {
					if (teleporter != counterpart && teleporter.groupId == counterpart.groupId) {
						teleporter.counterpart = counterpart;
						counterpart.counterpart = teleporter;
					}
				}
			}
		}
	}

	public static function enableAllTeleporters() {
		for (teleporter in allSprites) {
			teleporter.disabled = false;
		}
	}

	public static function clearAllSprites() {
		allSprites = [];
	}
	/*public function takeAction(object:MovableObject) {            
		object.teleport(counterpart.xGrid, counterpart.yGrid);
	}*/
}
