
package com.sixfootsoftware.pitstop {
    public class ScoreTextGenerator {
        private var score:Number;
        private var floating:Boolean=true;

        public function updateScore( score:Number, floating:Boolean=true ):void {
            this.score = score;
            this.floating = floating;
        }

        public function getScoreText():String {
            var text:String = score.toFixed().toString();
            if ( floating ) {
                text = score.toFixed(2).toString();
            }
            return zeroPad( text, 7 );
        }

        private static function zeroPad ( number:String, width:int ):String {
            if (number.length < width)
                return "0" + zeroPad( number, width-1 );
            return number;
        }
    }
}
