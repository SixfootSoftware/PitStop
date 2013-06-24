package com.sixfootsoftware.pitstop {
import com.sixfootsoftware.engine.DoubleLinkedList;

    public class FadedCar extends Car implements DoubleLinkedList {
        public function FadedCar() {
            super();
            this.alpha = 0.1;
        }
    }
}
