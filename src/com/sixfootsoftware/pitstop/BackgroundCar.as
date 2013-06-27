/**
 * User: Dave Long
 * Date: 26/06/13
 * Time: 21:52
 */
package com.sixfootsoftware.pitstop {
    import org.flixel.FlxSprite;

    public class BackgroundCar extends FlxSprite {
        public function BackgroundCar() {
            super(0, 289);
            this.loadGraphic(AssetRegistry.PitStop, true, false, 959, 216);
            this.addAnimation("background", [8], 1, false);
            play("background");
            kill();
        }
    }
}
