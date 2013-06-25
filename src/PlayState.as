package {

import com.sixfootsoftware.pitstop.Border;
import com.sixfootsoftware.pitstop.ComponentRegistry;
import com.sixfootsoftware.pitstop.ComponentRegistry;
import com.sixfootsoftware.pitstop.GeneratedBackground;

import flash.system.System;

import org.flixel.*;

    public class PlayState extends FlxState {

        public function PlayState() {
        }

        override public function create():void {
            var backdrop:GeneratedBackground = new GeneratedBackground( 1, 1 );
            add( backdrop.getFlxSprite() );
            add( ComponentRegistry.splashScreen );
            //game stuff
            ComponentRegistry.gameOver.setStopWatch( ComponentRegistry.stopWatch );
            add( ComponentRegistry.gameOver );
            add( new Border() );
            FlxG.log( "create" );
        }

        override public function update():void {
            if( !ComponentRegistry.gameOver.alive && !ComponentRegistry.splashScreen.alive ) {
                ComponentRegistry.gameOver.startGame();
            }
            if ( ComponentRegistry.gameOver.isGameRunning() ) {
                ComponentRegistry.stopWatch.updateElapsed();
            }
            super.update();
        }

    }
}