package com.sixfootsoftware.pitstop {
import com.sixfootsoftware.engine.SixfootSoftwareSplashScreenLogo;
import com.sixfootsoftware.engine.SplashScreen;

public class ComponentRegistry {
        public static var scoreGenerator:ScoreTextGenerator = new ScoreTextGenerator();
        public static var stopWatch:StopWatchTimer = new StopWatchTimer();
        public static var gameOver:GameOver = new GameOver();

        private static var splash:SplashScreen;

        public static function get splashScreen():SplashScreen {
            if ( splash ) {
                return splash;
            }
            splash = new SplashScreen( 12 )
            splash.addLogo( new SixfootSoftwareSplashScreenLogo() );
            splash.addLogo( new RacingLeaguesSplashScreenLogo() );
            return splash;
        }

    }
}
