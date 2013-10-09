/**
 * User: Dave Long
 * Date: 09/10/13
 * Time: 23:05
 */
package {

    import com.sixfootsoftware.pitstop.Border;
    import com.sixfootsoftware.pitstop.ComponentRegistry;
    import com.sixfootsoftware.pitstop.GeneratedBackground;
    import com.sixfootsoftware.pitstop.PitCar;
    import com.sixfootsoftware.pitstop.SpriteRegistry;

    import org.flixel.*;

    public class MenuState extends FlxState {

        public function MenuState() {
        }

        override public function create():void {
            var backdrop:GeneratedBackground = new GeneratedBackground(1, 1);

            configureComponents();

            add(backdrop.getFlxSprite());
            add(ComponentRegistry.gameOver);
            add(ComponentRegistry.pitstopText);
            add(ComponentRegistry.scoreText);
            add(ComponentRegistry.scoreTextGenerator);
            add(ComponentRegistry.pitstopTextGenerator);
            add(ComponentRegistry.stopWatchDisplay);
            add(ComponentRegistry.demoControl);
            add(SpriteRegistry.backgroundCarGrid);
            add(SpriteRegistry.grid);

            add(new Border());
        }

        private function configureComponents():void {
            ComponentRegistry.gameOver.setStopWatch(ComponentRegistry.stopWatch);
            ComponentRegistry.stopWatchDisplay.setStopWatch(ComponentRegistry.stopWatch);
            ComponentRegistry.pitstopTextGenerator.setPitstopCalculator( ComponentRegistry.pitstopCalculator );
            ComponentRegistry.scoreTextGenerator.setScoreCalculator( ComponentRegistry.scoreCalculator );
            ComponentRegistry.demoControl.setPitGridCar( SpriteRegistry.grid.getPitPlacement() as PitCar );
        }

        override public function update():void {
            if (!ComponentRegistry.gameOver.alive) {
                prepareStartOfGame();
            }
            if (ComponentRegistry.gameOver.isGameRunning()) {
                ComponentRegistry.stopWatch.updateElapsed();
                if ( ComponentRegistry.stopWatch.hasTimedOut() ) {
                    prepareStartOfGame();
                }

            }
            super.update();
        }

        private function prepareStartOfGame():void {
            ComponentRegistry.gameOver.startGame();
            ComponentRegistry.pitstopText.revive();
            ComponentRegistry.scoreText.revive();
            ComponentRegistry.scoreTextGenerator.revive();
            ComponentRegistry.pitstopTextGenerator.revive();
            ComponentRegistry.stopWatchDisplay.revive();
            ComponentRegistry.demoControl.revive();
            SpriteRegistry.backgroundCarGrid.revive();
            SpriteRegistry.grid.revive();
        }

    }
}
