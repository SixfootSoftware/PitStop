/**
 * User: Dave Long
 * Date: 24/06/13
 * Time: 22:26
 */
package com.sixfootsoftware.pitstop {

import org.flixel.FlxG;
import org.flixel.FlxSprite;

    public class GameOver extends FlxSprite {

        private var stopWatchTimer:StopWatchTimer;

        public function GameOver() {
            super( PitStop.GAME_X_MIDDLE - ( 156 / 2 ), 211 );
            this.loadGraphic( AssetRegistry.GameOver, true, false, 156, 22 );
            this.addAnimation( "gameplaying", [1], 1, false );
            this.addAnimation( "gameover", [0], 1, false );
            this.kill();
        }

        public function setStopWatch( stopWatch:StopWatchTimer ):GameOver {
            stopWatchTimer = stopWatch;
            return this;
        }

        public function startGame(): void {
            FlxG.log( "GameOver->startGame" );
            this.revive();
            stopWatchTimer.resetTimer();
            this.play( "gameplaying" );
        }

        public function stopGame(): void {
            this.play( "gameover" );
        }

        override public function preUpdate():void {
            super.preUpdate();
            if ( stopWatchTimer.hasTimedOut() ) {
                stopGame();
            }
        }

        public function isGameRunning():Boolean {
            return this.alive;
        }
    }
}
