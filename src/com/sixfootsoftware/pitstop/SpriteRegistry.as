package com.sixfootsoftware.pitstop {
    public class SpriteRegistry {

        public static var grid:CarGrid;
        public static var backgroundCarGrid:BackgroundCar;

        public static function reset():void {
            grid = new CarGrid();
            backgroundCarGrid = new BackgroundCar();
        }

    }
}
