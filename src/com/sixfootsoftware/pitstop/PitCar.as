/**
 * User: Dave Long
 * Date: 29/06/13
 * Time: 09:41
 */
package com.sixfootsoftware.pitstop {
    public class PitCar extends Car {

        private const MAX_WHEEL_TORQUE:uint = 12;
        private const MIN_WHEEL_TORQUE:uint = 6;

        private var needsTightening:int;
        private var needsLoosening:int;
        private var released:Boolean = false;

        public function PitCar() {
            super();
            resetPitStop();
        }

        public function resetPitStop():void {
            setupWheelLoosening().setupWheelTightening();
            released = false;
        }

        private function setupWheelTightening():PitCar {
            needsTightening = getWheelTorque();
            return this;
        }

        private function setupWheelLoosening():PitCar {
            needsLoosening = getWheelTorque();
            return this;
        }

        private function getWheelTorque():int {
            var torque:int = int(Math.random() * MAX_WHEEL_TORQUE);
            if ( torque < MIN_WHEEL_TORQUE ) {
                torque = MIN_WHEEL_TORQUE;
            }
            return torque;
        }

        public function loosenWheel():PitCar {
            needsLoosening--;
            return this;
        }

        public function tightenWheel():PitCar {
            needsTightening--;
            return this;
        }

       public function isWheelOff():Boolean {
           return needsLoosening == 0;
       }

        public function isWheelOn():Boolean {
            return needsTightening == 0;
        }

        public function isWheelDone():Boolean {
            return isWheelOff() && isWheelOn();
        }


        public function release():void {
            released = true;
        }

        override public function move():void {
            if ( !released ) {
                return;
            }
            resetPitStop();
            super.move();
        }
    }
}
