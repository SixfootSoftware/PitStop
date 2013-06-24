
package com.sixfootsoftware.pitstop {

import flash.utils.getTimer;

    public class StopWatchTimer {

        private var step:Number = 10;
        private var stepInMilliseconds:Number = step * 1000;
        private var steps:Number = 6;
        private var remainingSteps:Number = steps;
        private var stopTime:Number = 0;
        private var lastUpdated:Number = -1;

        public function StopWatchTimer() {
            resetTimer();
        }

        public function resetTimer() {
            remainingSteps = steps;
            stopTime = 0;
            lastUpdated = getTimer();
        }

        public function addStopTime( time:Number ):void {
            if ( step - time > 0 ) {
                stopTime += Math.floor( step - time );
            }
        }

        public function updateElapsed():void {
            if ( hasTimedOut() ) {
                return;
            }
            var elapsedTime:Number = ( lastUpdated - getTimer() );
            if ( elapsedTime < stepInMilliseconds ) {
                return;
            }
            remainingSteps -= Math.floor( elapsedTime / 1000 );
            lastUpdated = elapsedTime - Math.floor( elapsedTime % 1000 );
            adjustSteps();
        }

        private function adjustSteps():void {
            if ( stopTime >= step && remainingSteps < steps ) {
                var time:Number = Math.floor( stopTime / step );
                steps += time;
                stopTime -= time * step;
            }
        }

        public function hasTimedOut():Boolean {
            return remainingSteps > 0;
        }
    }
}
