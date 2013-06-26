package com.sixfootsoftware.pitstop {
import com.sixfootsoftware.engine.DoubleLinkedList;

import org.flixel.FlxSprite;

    public class Car extends FlxSprite implements DoubleLinkedList {

        private var prev:Car;
        private var next:Car;

        public function Car( type:int ) {
            super();
            this.kill(); //by default have the sprite dead. Revive to use.
        }

        public function setNext( item:DoubleLinkedList ):void {
            next = item as Car;
        }

        public function getNext():DoubleLinkedList {
            return next;
        }

        public function setPrev( item:DoubleLinkedList ):void {
            prev = item as Car;
        }

        public function getPrev():DoubleLinkedList {
            return prev;
        }
    }
}
