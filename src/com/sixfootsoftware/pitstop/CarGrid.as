package com.sixfootsoftware.pitstop {
    import com.sixfootsoftware.engine.LinkedListBuilder;

    import org.flixel.FlxGroup;

    public class CarGrid extends FlxGroup {

        private var CarTypes:Array = [0, 0, 0, 0, 0, -1, 1, 0, 2, -1];

        private var carList:Car;

        public function CarGrid() {
            buildGrid();
        }

        private function buildGrid():void {
            var x:int, y:int, z:int = 0;
            var car:Car;
            //build faded grid
            for (y = 0; y < 2; y++) {
                for (x = 0; x < 5; x++) {
                    if (CarTypes[z] != -1) {
                        car = createCarClass(CarTypes[z]);
                        carList = LinkedListBuilder.addToLinkedList(carList, car) as Car;
                        this.add(car);
                    }
                    z++;
                }
            }
        }

        protected function createCarClass(carType:int):Car {
            return new Car( carType );
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
