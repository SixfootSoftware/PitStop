
package com.sixfootsoftware.pitstop {
    public class ScoreTimerText {
        private var scoreTimer:Number;

        public function updateTimer( timer:Number ) {
            scoreTimer = timer;
        }

        public function getTimerText():String {
            return zeroPad( scoreTimer.toFixed(2).toString(), 7 );
        }

        private static function zeroPad ( number:String, width:int ):String {
            if (number.length < width)
                return "0" + zeroPad( number, width-1 );
            return number;
        }
    }
}
