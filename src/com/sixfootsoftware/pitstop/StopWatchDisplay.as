/**
 * User: Dave Long
 * Date: 26/06/13
 * Time: 19:02
 */
package com.sixfootsoftware.pitstop {
    import org.flixel.FlxSprite;

    public class StopWatchDisplay extends FlxSprite {

        private var lastDisplay:uint = StopWatchTimer.STEPS;
        private var stopWatchTimer:StopWatchTimer;

        public function StopWatchDisplay() {
            super(145, 56);
            this.loadGraphic(AssetRegistry.StopWatch, true, false, 142, 182);
            this.addAnimation("6", [1], 1, false);
            this.addAnimation("5", [1,7,1,7,1,7,1,7], 4, false);
            this.addAnimation("4", [7,4,7,4,7,4,7,4], 4, false);
            this.addAnimation("3", [4,2,4,2,4,2,4,2], 4, false);
            this.addAnimation("2", [2,6,2,6,2,6,2,6], 4, false);
            this.addAnimation("1", [6,3,6,3,6,3,6,3], 4, false);
            this.addAnimation("0", [3,0,3,0,3,0,3,0], 4, false);
            playLastDisplay();
            this.kill();
        }

        private function playLastDisplay():void {
            this.play(lastDisplay.toString());
        }

        /**
         *
         * @param timer
         * @return
         */
        public function setStopWatch(timer:StopWatchTimer):StopWatchDisplay {
            this.stopWatchTimer = timer;
            return this;
        }

        override public function preUpdate():void {
            if (stopWatchTimer.getDisplaySteps() != lastDisplay) {
                lastDisplay = stopWatchTimer.getDisplaySteps();
                playLastDisplay();
            }
            super.preUpdate();
        }

    }
}
