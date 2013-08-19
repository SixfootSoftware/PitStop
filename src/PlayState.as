package {

    import com.sixfootsoftware.hiScore.HiScoreGenerator;
    import com.sixfootsoftware.pitstop.Border;
    import com.sixfootsoftware.pitstop.ComponentRegistry;
    import com.sixfootsoftware.pitstop.GeneratedBackground;
    import com.sixfootsoftware.pitstop.PitCar;
    import com.sixfootsoftware.pitstop.SpriteRegistry;

    import org.flixel.*;

    public class PlayState extends FlxState {

        public function PlayState() {
        }

        override public function create():void {
            var backdrop:GeneratedBackground = new GeneratedBackground(1, 1);

            configureComponents();

            add(backdrop.getFlxSprite());
            add(ComponentRegistry.splashScreen);
            add(ComponentRegistry.gameOver);
            add(ComponentRegistry.pitstopText);
            add(ComponentRegistry.scoreText);
            add(ComponentRegistry.scoreTextGenerator);
            add(ComponentRegistry.pitstopTextGenerator);
            add(ComponentRegistry.stopWatchDisplay);
            add(ComponentRegistry.playerControl);
            add(SpriteRegistry.backgroundCarGrid);
            add(SpriteRegistry.grid);

            add(new Border());
        }

        private function configureComponents():void {
            ComponentRegistry.gameOver.setStopWatch(ComponentRegistry.stopWatch);
            ComponentRegistry.stopWatchDisplay.setStopWatch(ComponentRegistry.stopWatch);
            ComponentRegistry.playerControl.setPitGridCar(SpriteRegistry.grid.getPitPlacement() as PitCar );
            ComponentRegistry.pitstopTextGenerator.setPitstopCalculator( ComponentRegistry.pitstopCalculator );
            ComponentRegistry.scoreTextGenerator.setScoreCalculator( ComponentRegistry.scoreCalculator );
        }

        override public function update():void {
            if (!ComponentRegistry.gameOver.alive && !ComponentRegistry.splashScreen.alive) {
                prepareStartOfGame();
            }
            if (ComponentRegistry.gameOver.isGameRunning()) {
                ComponentRegistry.stopWatch.updateElapsed();
                ComponentRegistry.playerControl.displayAppropriateAnimation();
                ComponentRegistry.playerControl.checkPlayerPressed();
                if ( ComponentRegistry.stopWatch.hasTimedOut() ) {
                    stopGame();
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
            ComponentRegistry.playerControl.revive();
            SpriteRegistry.backgroundCarGrid.revive();
            SpriteRegistry.grid.revive();
            //var hiscore:HiScoreGenerator = new HiScoreGenerator( HiScoreGenerator.SECRET );
            //var score:int =  123;
            //hiscore.setScore( score.toString() ).setUser( "123" );
        }

        private function stopGame():void {
            SpriteRegistry.grid.kill();
            ComponentRegistry.playerControl.stop();
        }

    }
}