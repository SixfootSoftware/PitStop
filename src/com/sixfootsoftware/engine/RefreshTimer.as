package com.sixfootsoftware.engine {
    import flash.utils.getTimer;

    import org.flixel.FlxG;

    public class RefreshTimer {

        private var refresh:Number;
        private var minRefresh:Number;
        private var decay:Number;
        private var decayDelay:Number;
        private var timer:Number;
        private var lastUpdate:Number;

        public function RefreshTimer(startingRefresh:Number, minRefresh:Number) {
            refresh = startingRefresh;
            this.minRefresh = minRefresh;
            timer = lastUpdate = getTimer();
        }

        public function refreshDecay(decay:Number, secondsBetweenDecay:Number):void {
            this.decay = decay;
            decayDelay = secondsBetweenDecay * 1000;
        }

        public function isReadyForUpdate():Boolean {
            if (( lastUpdate + refresh ) < getTimer()) {
                lastUpdate = getTimer();
                performDecay();
                return true;
            }
            return false;
        }

        private function performDecay():void {
            if (refresh > minRefresh && ( timer + decayDelay ) < getTimer()) {
                refresh -= decay;
                timer = getTimer();
            }
        }
    }
}
