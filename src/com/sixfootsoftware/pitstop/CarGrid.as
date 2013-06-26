package com.sixfootsoftware.pitstop {
    import com.sixfootsoftware.engine.LinkedListBuilder;

    import org.flixel.FlxGroup;

    public class CarGrid extends FlxGroup {

        private var carList:Car;

        public function CarGrid() {
            buildGrid();
        }

        private function buildGrid():void {
            var x:int, y:int;
            var car:Car;
            //build faded grid
            for (x = 0; x < 8; x++) {
                car = createCarClass();
                carList = LinkedListBuilder.addToLinkedList(carList, car) as Car;
                this.add(car);
            }
        }

        //noinspection JSMethodCanBeStatic
        private function createCarClass():Car {
            return new Car();
        }

        public function reviveGrid():void {
            var car:Car = LinkedListBuilder.retrieveFirstItem(carList) as Car;
            while (car.getNext()) {
                car.revive();
            }
        }

        /**
         * When going back to the menu we no longer need to show the grid
         */
        public function discardGrid():void {
            var car:Car = LinkedListBuilder.retrieveFirstItem(carList) as Car;
            while (car.getNext()) {
                car.kill();
            }
        }


    }
}
