
package com.sixfootsoftware.pitstop {
    public class PlayerScoreCalculator implements Calculator {
	
		private const MAX_TIME:uint = 10;
		private const SCORE_MULTIPLIER:uint = 1000;
        private var score:Number = 0;
        private var lastScore:Number = 0;

        public function addScore( pitTime:Number ):void {
			var time:int = MAX_TIME - pitTime;
			if ( time > 0 ) {  
				this.score += int( time * SCORE_MULTIPLIER ); 
			}				
        }

        public function getCalculatorResult():Number {
            lastScore = score;
			return score;
		}

        public function updated():Boolean {
            return score != lastScore;
        }
    }
}
