package {

import com.sixfootsoftware.pitstop.GeneratedBackground;
import com.sixfootsoftware.pitstop.RacingLeaguesSplashScreenLogo;
import com.sixfootsoftware.engine.SixfootSoftwareSplashScreenLogo;
import com.sixfootsoftware.engine.SplashScreen;

import org.flixel.*;

    public class PlayState extends FlxState {

        public function PlayState() {
        }

        override public function create():void {
            var backdrop:GeneratedBackground = new GeneratedBackground( 1, 1 );
            var bg:FlxSprite = new FlxSprite( 0, 0 );
            bg.pixels = backdrop.getBitmapData();
            var splash:SplashScreen = new SplashScreen( 12 );
            splash.addLogo( new SixfootSoftwareSplashScreenLogo() );
            splash.addLogo( new RacingLeaguesSplashScreenLogo() );
            add( bg );
            add( splash );
        }

    }
}