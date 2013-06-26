package com.sixfootsoftware.pitstop {
    import com.sixfootsoftware.engine.LinkedListBuilder;

    import org.flixel.FlxGroup;

    public class CarGrid extends FlxGroup {

        private const HIDDEN_CELL:int = -1;
        private const ENTRY_CELL:int = 1;
        private const EXIT_CELL:int = 2;
        private const NORMAL_CELL:int = 0;
        private var CarTypes:Array = [
            NORMAL_CELL, NORMAL_CELL, NORMAL_CELL, NORMAL_CELL, NORMAL_CELL,
            HIDDEN_CELL, ENTRY_CELL, NORMAL_CELL, EXIT_CELL, HIDDEN_CELL
        ];

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
                    if (!isHiddenCell(z)) {
                        car = createCarClass(CarTypes[z]);
                        carList = LinkedListBuilder.addToLinkedList(carList, car) as Car;
                        this.add(car);
                    }
                    z++;
                }
            }
        }

        private function isHiddenCell(cell:int):Boolean {
            return CarTypes[cell] == HIDDEN_CELL;
        }

        //noinspection JSMethodCanBeStatic
        private function createCarClass(carType:int):Car {
            return new Car(carType);
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
