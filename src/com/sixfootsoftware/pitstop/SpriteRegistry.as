package com.sixfootsoftware.pitstop {
    public class SpriteRegistry {

        public static var grid:CarGrid;
        private static var activeGrid:ActiveGrid;

        public function SpriteRegistry() {
            grid = new CarGrid();
            activeGrid = new ActiveGrid();
        }
    }
}
