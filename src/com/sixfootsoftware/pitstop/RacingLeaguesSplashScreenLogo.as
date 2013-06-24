package com.sixfootsoftware.pitstop {
import org.flixel.FlxSprite;
public class RacingLeaguesSplashScreenLogo extends SplashScreenLogo {

    [Embed(source = '../../../assets/logo_rl.png')] private var logoRl:Class;

    public function RacingLeaguesSplashScreenLogo() {
        var RacingLeaguesLogo:FlxSprite = new FlxSprite(PitStop.GAME_X_MIDDLE - ( 451 / 2 ), PitStop.GAME_Y_MIDDLE - ( 162 / 2 ));
        RacingLeaguesLogo.loadGraphic( logoRl, true, false, 451, 162 );
        RacingLeaguesLogo.addAnimation( "animate", [1, 0], 4, false );
        RacingLeaguesLogo.blend = "multiply";
        super( RacingLeaguesLogo, 6 );
    }
}
}
