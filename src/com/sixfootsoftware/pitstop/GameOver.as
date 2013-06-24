/**
 * User: Dave Long
 * Date: 24/06/13
 * Time: 22:26
 */
package com.sixfootsoftware.pitstop {

import org.flixel.FlxG;
import org.flixel.FlxSprite;

public class GameOver extends FlxSprite {
        public function GameOver() {
            super( PitStop.GAME_X_MIDDLE - ( 156 / 2 ), 211 );
            this.loadGraphic( AssetRegistry.GameOver, true, false, 156, 22 );
            this.addAnimation( "gameplaying", [0], 1, false );
            this.addAnimation( "gameover", [1], 1, false );
            this.kill();
        }

        public function startGame(): void {
            FlxG.log( "GameOver->startGame" );
            this.revive();
            this.play( "gameplaying" );
        }

        public function stopGame(): void {
            this.play( "gameover" );
        }
    }
}
