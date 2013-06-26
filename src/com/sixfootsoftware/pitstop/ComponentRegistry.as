package com.sixfootsoftware.pitstop {
import com.sixfootsoftware.engine.SixfootSoftwareSplashScreenLogo;
import com.sixfootsoftware.engine.SplashScreen;

    public class ComponentRegistry {
        public static var scoreGenerator:ScoreTextGenerator = new ScoreTextGenerator();
        public static var stopWatch:StopWatchTimer = new StopWatchTimer();
        public static var gameOver:GameOver = new GameOver();
        public static var pitstopText:PitstopText = new PitstopText();
        public static var scoreText:ScoreText = new ScoreText();
        public static var stopWatchDisplay:StopWatchDisplay = new StopWatchDisplay();

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
