package com.sixfootsoftware.pitstop {

    import org.flixel.FlxSprite;

    public class Car extends FlxSprite {

        private var succeeds:Vector.<Car> = new Vector.<Car>();
        private var precedes:Vector.<Car> = new Vector.<Car>();
        private var occupied:Boolean = false;

        public function Car() {
            super(0, 289);
            this.loadGraphic(AssetRegistry.PitStop, true, false, 959, 216);
            this.addAnimation("1", [12], 1, false);
            this.addAnimation("2", [10], 1, false);
            this.addAnimation("3", [8], 1, false);
            this.addAnimation("4", [1], 1, false);
            this.addAnimation("5", [7], 1, false);
            this.addAnimation("6", [5], 1, false);
            this.addAnimation("7", [3], 1, false);
            this.addAnimation("8", [0], 1, false);
            this.kill();
        }

        public function addSuccessor(car:Car):Car {
            precedes.push(car);
            return this;
        }

        public function addPredecessor(car:Car):Car {
            succeeds.push(car);
            return this;
        }

        public function setOccupied(occupied:Boolean):Car {
            this.occupied = occupied;
            return this;
        }

        public function isOccupied():Boolean {
            return occupied;
        }

        public function canMove():Boolean {
            if (!occupied) {
                return false;
            }
            return !successorOccupied();
        }

        private function successorOccupied():Boolean {
            for each(var car:Car in precedes) {
                if (car.isOccupied()) {
                    return true;
                }
            }
            return false;
        }

        public function getPredecessors():Vector.<Car> {
            return succeeds;
        }

        override public function preUpdate():void {
            if (this.alive && !occupied) {
                kill();
            } else if (!this.alive && occupied) {
                revive();
            }
            super.preUpdate();
        }
    }
}
