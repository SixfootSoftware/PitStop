/**
 * Created with IntelliJ IDEA.
 * User: dvlg
 * Date: 28/06/13
 * Time: 15:34
 * To change this template use File | Settings | File Templates.
 */
package com.sixfootsoftware.pitstop {
    import org.flixel.FlxG;
    import org.flixel.FlxGroup;

    public class PlayerControl extends FlxGroup {

        private var car:PitCar;

        public function PlayerControl() {
            //setup loosenWheelButton
            //setup tightenWheelButton
        }

        public function setPitGridCar(car:PitCar):void {
            this.car = car;
        }

        public function checkPlayerPressed():void {
            if (!this.car.isWheelOff() && isLoosenWheelPressed()) {
                this.car.loosenWheel();
            } else if (this.car.isWheelOff()
                    && !this.car.isWheelOn()
                    && isTightenWheelPressed()) {
                this.car.tightenWheel();
            } else if (this.car.isWheelDone() ) {
                this.car.release();
            }
        }

        private function isLoosenWheelPressed():Boolean {
            return FlxG.keys.justReleased("LEFT");
        }

        private function isTightenWheelPressed():Boolean {
            return FlxG.keys.justReleased("RIGHT");
        }
    }
}
