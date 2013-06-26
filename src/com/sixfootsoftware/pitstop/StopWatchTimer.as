package com.sixfootsoftware.pitstop {

    import flash.utils.getTimer;

    import org.flixel.FlxG;

    public class StopWatchTimer {

        private var step:Number = 10;
        //noinspection JSFieldCanBeLocal
        private var stepInMilliseconds:Number = step * 1000;
        public static const STEPS:Number = 6;
        private var remainingSteps:Number = STEPS;
        private var stopTime:Number = 0;
        private var lastUpdated:Number = -1;

        public function StopWatchTimer() {
            resetTimer();
        }

        public function resetTimer():void {
            remainingSteps = STEPS;
            stopTime = 0;
            lastUpdated = getTimer();
        }

        public function addStopTime(time:Number):void {
            if (step - time > 0) {
                stopTime += Math.floor(step - time);
            }
        }

        public function updateElapsed():void {
            if (hasTimedOut()) {
                return;
            }
            var elapsedTime:Number = ( getTimer() - lastUpdated );
            if (elapsedTime < stepInMilliseconds) {
                return;
            }
            remainingSteps -= Math.floor(elapsedTime / stepInMilliseconds);
            FlxG.log(remainingSteps);
            lastUpdated += elapsedTime - Math.floor(elapsedTime % stepInMilliseconds);
            adjustSteps();
        }

        private function adjustSteps():void {
            if (stopTime >= step && remainingSteps < STEPS) {
                var time:Number = Math.floor(stopTime / step);
                remainingSteps += time;
                stopTime -= time * step;
            }
        }

        public function hasTimedOut():Boolean {
            return remainingSteps <= 0;
        }

        public function getRemainingSteps():uint {
            return remainingSteps;
        }
    }
}
