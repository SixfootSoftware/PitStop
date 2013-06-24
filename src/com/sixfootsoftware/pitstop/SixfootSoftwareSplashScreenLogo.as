package com.sixfootsoftware.pitstop {
import org.flixel.FlxSprite;
    public class SixfootSoftwareSplashScreenLogo extends SplashScreenLogo {

        [Embed(source = '../../../assets/logo_sfs.png')] private var logoSfs:Class;

        public function SixfootSoftwareSplashScreenLogo() {
            var SixfootSoftwareLogo:FlxSprite = new FlxSprite(PitStop.GAME_X_MIDDLE - ( 373 / 2 ), PitStop.GAME_Y_MIDDLE - ( 120 / 2 ));
            SixfootSoftwareLogo.loadGraphic( logoSfs, true, false, 373, 120 );
            SixfootSoftwareLogo.addAnimation( "animate", [6, 10, 8, 1, 4, 2, 0], 2, false );
            super( SixfootSoftwareLogo, 6 );
        }
    }
}
