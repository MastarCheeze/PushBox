package;

import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import haxe.Constraints.Function;

class MovableObject extends BaseObject {    
    public var pushable:Bool;
    public var lastPosXGrid:Int;
    public var lastPosYGrid:Int;

	override public function new(x:Float, y:Float, pushable = false) {
		super(x, y);

		this.pushable = pushable;
	}

	public function move(xGrid:Int, yGrid:Int, ?onComplete:Function) {
        // save previous position
        lastPosXGrid = this.xGrid;
        lastPosYGrid = this.yGrid;

        // set current position
		setGridPos(xGrid, yGrid);
        var pos = BaseObject.calcPos(xGrid, yGrid);

        // tween
		FlxTween.tween(this, {x: pos.x, y: pos.y}, 0.075, {
			ease: FlxEase.quadOut,
            onComplete: function(_) {
                if (onComplete != null)
                    onComplete();
            }
		});
    }
    
    /*public function moveDir(xDir:Int, yDir:Int, ?onComplete:Function) {
        var xGrid = this.xGrid + xDir;
        var yGrid = this.yGrid + yDir;

        move(xGrid, yGrid);
    }*/
}
