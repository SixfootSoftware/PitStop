package com.sixfootsoftware.pitstop {
import com.sixfootsoftware.engine.LinkedListBuilder;
import org.flixel.FlxGroup;

    public class CarGrid extends FlxGroup {

        private var backgroundCar:FadedCar;

        public function CarGrid() {
            buildGrid();
        }

        private function buildGrid():void {
            var x:int, y:int;
            var car:FadedCar;
            //build faded grid
            for( y = 0; y < 2; y++ ) {
                for( x = 0; x < 7; x++ ) {
                    car = new FadedCar();
                    backgroundCar = LinkedListBuilder.addToLinkedList( backgroundCar, car ) as FadedCar;
                    this.add( car );
                }
            }
        }

        public function reviveGrid():void {
            var car:FadedCar = LinkedListBuilder.retrieveFirstItem( backgroundCar ) as FadedCar;
            while( car.getNext() ) {
                car.revive();
            }
        }

        /**
         * When going back to the menu we no longer need to show the grid
         */
        public function discardGrid():void {
            var car:FadedCar = LinkedListBuilder.retrieveFirstItem( backgroundCar ) as FadedCar;
            while( car.getNext() ) {
                car.kill();
            }
        }


    }
}
