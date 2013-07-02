
package com.sixfootsoftware.pitstop {
    public class PlayerPitstopCalculator {
	
		private const PITSTOP_MULTIPLIER = 100;
        private var pitstop:Number = 0;

        public function calculatePitstop( elapsed:Number ):void {
			pitstop = int( elapsed * PITSTOP_MULTIPLIER ); 			
        }

        public function getPitstop():Number {
			return pitstop;
		}
    }
}
