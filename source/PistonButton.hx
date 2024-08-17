package;

class PistonButton extends BaseObject {
	public static var allSprites = new Array<PistonButton>();

	public var groupId:Int;
	public var base:PistonBase;

	override public function new(x:Float, y:Float, groupId:Int) {
		super(x, y, false);

		this.groupId = groupId;
		allSprites.push(this);

		loadGraphic("assets/images/piston_button.png", false, Const.BLOCKSIZE, Const.BLOCKSIZE);
	}
}
