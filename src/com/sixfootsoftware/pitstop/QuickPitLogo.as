package com.sixfootsoftware.pitstop {
    import com.sixfootsoftware.engine.SplashScreenLogo;

    import org.flixel.FlxSprite;
    public class QuickPitLogo extends SplashScreenLogo {

        public function QuickPitLogo() {
            var QuickPitLogo:FlxSprite = new FlxSprite(PitStop.GAME_X_MIDDLE - ( 379 / 2 ), PitStop.GAME_Y_MIDDLE - ( 256 / 2 ));
            QuickPitLogo.loadGraphic( AssetRegistry.QuickPit, true, false, 379, 256 );
            QuickPitLogo.addAnimation( "animate", [0], 1, false );
            super( QuickPitLogo, 6 );
        }
    }
}
