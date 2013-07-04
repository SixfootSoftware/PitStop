package com.sixfootsoftware.pitstop {
import com.sixfootsoftware.engine.SixfootSoftwareSplashScreenLogo;
import com.sixfootsoftware.engine.SplashScreen;

    public class ComponentRegistry {
        public static var stopWatch:StopWatchTimer = new StopWatchTimer();
        public static var gameOver:GameOver = new GameOver();
        public static var pitstopText:PitstopText = new PitstopText();
        public static var pitstopTextGenerator:PitstopTextGenerator = new PitstopTextGenerator();
        public static var scoreText:ScoreText = new ScoreText();
        public static var scoreTextGenerator:ScoreTextGenerator = new ScoreTextGenerator();
        public static var stopWatchDisplay:StopWatchDisplay = new StopWatchDisplay();
        public static var playerControl:PlayerControl = new PlayerControl();
        public static var pitstopCalculator:PlayerPitstopCalculator = new PlayerPitstopCalculator();
        public static var scoreCalculator:PlayerScoreCalculator = new PlayerScoreCalculator();

        private static var splash:SplashScreen;

        public static function get splashScreen():SplashScreen {
            if ( splash ) {
                return splash;
            }
            splash = new SplashScreen( 15 );
            splash.addLogo( new SixfootSoftwareSplashScreenLogo() );
            splash.addLogo( new RacingLeaguesSplashScreenLogo() );
            splash.addLogo( new QuickPitLogo() );
            return splash;
        }

    }
}
