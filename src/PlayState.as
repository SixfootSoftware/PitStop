package {

import com.sixfootsoftware.pitstop.Border;
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
            var splash:SplashScreen = new SplashScreen( 12 );
            splash.addLogo( new SixfootSoftwareSplashScreenLogo() );
            splash.addLogo( new RacingLeaguesSplashScreenLogo() );
            add( backdrop.getFlxSprite() );
            add( splash );
            //game stuff
            add( new Border() );
        }

    }
}