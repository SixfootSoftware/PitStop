package com.sixfootsoftware.pitstop {

    import org.flixel.FlxGroup;

    public class CarGrid extends FlxGroup {

        private var carList:Vector.<Car> = new Vector.<Car>(8);

        public function CarGrid() {
            buildGrid();
        }

        private function buildGrid():void {
            var x:int;
            var car:Car;
            for (x = 0; x < 8; x++) {
                car = createCarClass();
                carList[x] = car;
                this.add(car);
            }
            carList[0].addSuccessor( carList[1] );
            carList[0].addSuccessor( carList[5] );
            carList[1].addSuccessor( carList[2] );
            carList[2].addSuccessor( carList[3] );
            carList[3].addSuccessor( carList[4] );
            carList[5].addSuccessor( carList[6] );
            carList[6].addSuccessor( carList[7] );
            carList[7].addSuccessor( carList[4] );

            carList[1].addPredecessor( carList[0] );
            carList[2].addPredecessor( carList[1] );
            carList[3].addPredecessor( carList[2] );
            carList[4].addPredecessor( carList[3] );
            carList[4].addPredecessor( carList[7] );
            carList[5].addPredecessor( carList[0] );
            carList[6].addPredecessor( carList[5] );
            carList[7].addPredecessor( carList[6] );
        }

        //noinspection JSMethodCanBeStatic
        private function createCarClass():Car {
            return new Car();
        }

    }
}
