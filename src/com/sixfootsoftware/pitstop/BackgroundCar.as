/**
 * User: Dave Long
 * Date: 26/06/13
 * Time: 21:52
 */
package com.sixfootsoftware.pitstop {
    public class BackgroundCar extends Car {
        public function BackgroundCar() {
            super();
            this.addAnimation("background", [8], 1, false);
            play("background");
        }
    }
}
