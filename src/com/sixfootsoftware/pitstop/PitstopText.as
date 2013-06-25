/**
 * User: Dave Long
 * Date: 25/06/13
 * Time: 21:49
 */
package com.sixfootsoftware.pitstop {
    import org.flixel.FlxSprite;

    public class PitstopText extends FlxSprite {
        public function PitstopText() {
            super( PitStop.GAME_X_MIDDLE - ( 107 / 2 ), 56 );
            this.loadGraphic( AssetRegistry.PitstopText );
            this.kill();
        }
    }
}
