package com.sixfootsoftware.engine {
import flash.utils.getTimer;

public class RefreshTimer {

        private var refresh:Number;
        private var minRefresh:Number;
        private var decay:Number;
        private var decayDelay:Number;
        private var timer:Number;
        private var lastUpdate:Number;

        public function RefreshTimer( startingRefresh:Number, minRefresh:Number ) {
            refresh = startingRefresh;
            this.minRefresh = minRefresh;
            timer = lastUpdate = getTimer();
        }

        public function refreshDecay( decay:Number, secondsBetweenDecay:Number ):void {
            this.decay = decay;
            decayDelay = secondsBetweenDecay;
        }

        public function performDecay() {
            if ( refresh > minRefresh && ( timer + decayDelay ) < getTimer() ) {
                refresh -= decay;
                timer = getTimer();
            }
        }

        public function isReadyForUpdate() {
            if ( ( lastUpdate + refresh ) < getTimer() ) {
                lastUpdate = getTimer();
                return true;
            }
            return false;
        }
    }
}
