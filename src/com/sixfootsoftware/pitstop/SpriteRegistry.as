package com.sixfootsoftware.pitstop {
    public class SpriteRegistry {

        public static var grid:CarGrid;
        public static var backgroundCarGrid:BackgroundCar = new BackgroundCar();

        public function SpriteRegistry() {
            grid = new CarGrid();
        }
    }
}
