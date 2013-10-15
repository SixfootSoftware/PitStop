package com.sixfootsoftware.pitstop {

    import com.sixfootsoftware.engine.RefreshTimer;

    import org.flixel.FlxG;

    import org.flixel.FlxGroup;
    import org.flixel.FlxSound;

    public class CarGrid extends FlxGroup {

        private var carList:Vector.<Car> = new Vector.<Car>(8);
        private var refreshTimer:RefreshTimer = new RefreshTimer(750, 150);
        private var sound:FlxSound = new FlxSound();
        private var demo:Boolean = false;
        public static const DEMO:Boolean = true;

        public function CarGrid() {
            buildGrid();
            refreshTimer.refreshDecay(50, 10);
            sound.loadEmbedded( AssetRegistry.SoundBleep, false, false );
            kill();
        }

        private function buildGrid():void {
            var x:int;
            var car:Car;
            for (x = 0; x < 8; x++) {
                car = createCarClass( x );
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

        public function getPitPlacement():Car {
            return carList[5];
        }

        //noinspection JSMethodCanBeStatic
        private function createCarClass( placement:int ):Car {
            if ( placement == 5 ) {
                return new PitCar();
            }
            return new Car();
        }

        private function spawnCar():Boolean {
            if (!carList[0].isOccupied()) {
                if ( !gridOccupied() ) {
                    carList[0].setOccupied(true);
                } else {
                    carList[0].setOccupied(int(Math.random() * 60) > 40);
                }
                return carList[0].isOccupied();
            }
            return false;
        }

        private function gridOccupied():Boolean {
            for each( var car:Car in carList ) {
                if ( car.isOccupied() ) {
                    return true;
                }
            }
            return false;
        }

        private function rotateGrid():Boolean {
            var car:Car;
            var i:int = 7;
            var carMoved:Boolean = false;
            while (i >= 0) {
                car = carList[i];
                if (car.isOccupied()) {
                    if (car.hasNoSuccessors()) {
                        car.setOccupied(false);
                        carMoved = true;
                    } else {
                        if (car.canMove() && car.move()) {
                            carMoved = true;
                        }
                    }
                }
                i--;
            }
            if ( carMoved ) {
                    return true;
            }
            return false;
        }

        public function setMode( demo:Boolean ):void {
            this.demo = demo;
        }

        override public function preUpdate():void {
            super.preUpdate();
            if (alive && refreshTimer.isReadyForUpdate()) {
                if ( rotateGrid() || spawnCar() ) {
                    if ( !demo ) {
                        sound.play();
                    }
                }
            }
        }

    }
}
