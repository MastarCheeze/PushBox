package;

class Wall extends BaseObject {
	override public function new(x:Float, y:Float) {
		super(x, y);
		loadGraphic("assets/images/wall.png", false, Const.BLOCKSIZE, Const.BLOCKSIZE);
	}
}
