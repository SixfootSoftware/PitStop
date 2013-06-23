package {
import flash.utils.getTimer;

import org.flixel.*;

    public class PlayState extends FlxState {

        [Embed(source = './assets/main_background.png')] private var background:Class;
        [Embed(source = './assets/logo_sfs.png')] private var logoSfs:Class;
        [Embed(source = './assets/logo_rl.png')] private var logoRl:Class;

        private var fadeStartTime:Number = -1;
        private var SixfootSoftwareLogo:FlxSprite;
        private var RacingLeaguesLogo:FlxSprite;

        public function PlayState() {
        }

        override public function create():void {
            var bg:FlxSprite = new FlxSprite( 0, 0 );
            SixfootSoftwareLogo = new FlxSprite(PitStop.GAME_X_MIDDLE - ( 373 / 2 ), PitStop.GAME_Y_MIDDLE - ( 120 / 2 ));
            RacingLeaguesLogo = new FlxSprite(PitStop.GAME_X_MIDDLE - ( 451 / 2 ), PitStop.GAME_Y_MIDDLE - ( 162 / 2 ));
            SixfootSoftwareLogo.loadGraphic( logoSfs, true, false, 373, 120 );
            RacingLeaguesLogo.loadGraphic( logoRl, true, false, 451, 162 );
            SixfootSoftwareLogo.addAnimation( "animate", [6, 10, 8, 1, 4, 2, 0], 2, false );
            RacingLeaguesLogo.addAnimation( "animate", [1, 0], 4, false );
            RacingLeaguesLogo.blend = "multiply";
            RacingLeaguesLogo.alpha = 0;
            bg.loadGraphic( background, false, false, 980, 550 );
            fadeStartTime = getTimer();
            add( bg );
            add( SixfootSoftwareLogo );
            add( RacingLeaguesLogo );
            SixfootSoftwareLogo.play( "animate" );
        }

        override public function update():void {
            if ( fadeStartTime > 0 && getTimer() - fadeStartTime > 6000 ) {
                SixfootSoftwareLogo.alpha = 0;
                RacingLeaguesLogo.alpha = 1;
                RacingLeaguesLogo.play( "animate" );
                fadeStartTime = -1;
            }

            super.update();
        }
    }
}