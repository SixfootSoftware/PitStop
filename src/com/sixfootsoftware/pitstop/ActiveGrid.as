package com.sixfootsoftware.pitstop {
    public class ActiveGrid extends CarGrid {
        override protected function createCarClass():Car {
            return new Car();
        }
    }
}
