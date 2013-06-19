package {
    import org.flixel.*;

    public class PlayState extends FlxState {

        [Embed(source = './assets/main_background.png')] private var background:Class;

        public function PlayState() {
        }

        override public function create():void {
            var bg:FlxSprite = new FlxSprite( 0, 0 );
            bg.loadGraphic( background, false, false, 980, 550 );
            add( bg );
        }
    }
}