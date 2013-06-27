package com.sixfootsoftware.pitstop {

    import com.sixfootsoftware.engine.RefreshTimer;

    import org.flixel.FlxGroup;

    public class CarGrid extends FlxGroup {

        private var carList:Vector.<Car> = new Vector.<Car>(8);
        private var refreshTimer:RefreshTimer = new RefreshTimer(750, 150);

        public function CarGrid() {
            buildGrid();
            refreshTimer.refreshDecay(50, 10);
            kill();
        }

        private function buildGrid():void {
            var x:int;
            var car:Car;
            for (x = 0; x < 8; x++) {
                car = createCarClass();
                carList[x] = car;
                carList[x].play((x + 1).toString());
                this.add(car);
            }
            carList[0].addSuccessor(carList[1]);
            carList[0].addSuccessor(carList[4]);
            carList[1].addSuccessor(carList[2]);
            carList[2].addSuccessor(carList[3]);
            carList[3].addSuccessor(carList[7]);
            carList[4].addSuccessor(carList[5]);
            carList[5].addSuccessor(carList[6]);
            carList[6].addSuccessor(carList[7]);
        }

        //noinspection JSMethodCanBeStatic
        private function createCarClass():Car {
            return new Car();
        }

        private function spawnCar():void {
            if (!carList[0].isOccupied()) {
                carList[0].setOccupied(int(Math.random() * 60) > 40);
            }
        }

        private function rotateGrid():void {
            var car:Car;
            var i:int = 7;
            while (i >= 0) {
                car = carList[i];
                if (car.isOccupied()) {
                    if (car.hasNoSuccessors()) {
                        car.setOccupied(false);
                    } else {
                        if (car.canMove()) {
                            car.move();
                        }
                    }
                }
                i--;
            }
        }

        override public function preUpdate():void {
            super.preUpdate();
            if (alive && refreshTimer.isReadyForUpdate()) {
                rotateGrid();
                spawnCar();
            }
        }

    }
}
