package com.sixfootsoftware.pitstop {
import com.sixfootsoftware.engine.SplashScreenLogo;

import org.flixel.FlxSprite;
    public class RacingLeaguesSplashScreenLogo extends SplashScreenLogo {

        public function RacingLeaguesSplashScreenLogo() {
            var RacingLeaguesLogo:FlxSprite = new FlxSprite(PitStop.GAME_X_MIDDLE - ( 451 / 2 ), PitStop.GAME_Y_MIDDLE - ( 162 / 2 ));
            RacingLeaguesLogo.loadGraphic( AssetRegistry.RacingLeaguesLogo, true, false, 451, 162 );
            RacingLeaguesLogo.addAnimation( "animate", [1, 0], 8, false );
            RacingLeaguesLogo.blend = "multiply";
            super( RacingLeaguesLogo, 6 );
        }
    }
}
