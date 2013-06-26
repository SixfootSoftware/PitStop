package com.sixfootsoftware.pitstop {
    import com.sixfootsoftware.engine.DoubleLinkedList;

    import org.flixel.FlxSprite;

    public class Car extends FlxSprite implements DoubleLinkedList {

        private var prev:Car;
        private var next:Car;
        private var position:int = 1;

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

        public function setNext(item:DoubleLinkedList):void {
            next = item as Car;
        }

        public function getNext():DoubleLinkedList {
            return next;
        }

        public function setPrev(item:DoubleLinkedList):void {
            prev = item as Car;
        }

        public function getPrev():DoubleLinkedList {
            return prev;
        }

        public function setPosition(position:int):Car {
            this.position = position;
            return this;
        }

        override public function preUpdate():void {
            if (position == 0) {
                kill();
            } else if (!this.alive) {
                revive();
            }
            super.preUpdate();
        }
    }
}
