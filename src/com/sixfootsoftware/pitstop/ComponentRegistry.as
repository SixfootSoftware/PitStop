package com.sixfootsoftware.pitstop {
import com.sixfootsoftware.engine.SixfootSoftwareSplashScreenLogo;
import com.sixfootsoftware.engine.SplashScreen;

    public class ComponentRegistry {
        public static var stopWatch:StopWatchTimer;
        public static var gameOver:GameOver;
        public static var pitstopText:PitstopText;
        public static var pitstopTextGenerator:PitstopTextGenerator;
        public static var scoreText:ScoreText;
        public static var scoreTextGenerator:ScoreTextGenerator;
        public static var stopWatchDisplay:StopWatchDisplay;
        public static var playerControl:PlayerControl;
        public static var pitstopCalculator:PlayerPitstopCalculator;
        public static var scoreCalculator:PlayerScoreCalculator;
        public static var demoControl:DemoControl;

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

        public static function reset():void {
            stopWatch = new StopWatchTimer();
            gameOver = new GameOver();
            pitstopText = new PitstopText();
            pitstopTextGenerator = new PitstopTextGenerator();
            scoreText = new ScoreText();
            scoreTextGenerator = new ScoreTextGenerator();
            stopWatchDisplay = new StopWatchDisplay();
            playerControl = new PlayerControl();
            pitstopCalculator = new PlayerPitstopCalculator();
            scoreCalculator = new PlayerScoreCalculator();
            demoControl = new DemoControl() ;
        }
    }
}
