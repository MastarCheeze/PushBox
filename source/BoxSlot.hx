package;

class BoxSlot extends BaseObject {
	override public function new(x:Float, y:Float) {
		super(x, y, false);
		loadGraphic("assets/images/box_slot.png", false, Const.BLOCKSIZE, Const.BLOCKSIZE);
	}
}
