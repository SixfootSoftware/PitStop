package {

import org.flixel.*;

[SWF(width="980", height="550", backgroundColor="#000000")]

[Frame(factoryClass="Preloader")]

    public class PitStop extends FlxGame {

        public static const GAME_WIDTH:int = 980;
        public static const GAME_X_MIDDLE:int = GAME_WIDTH / 2;
        public static const GAME_HEIGHT:int = 550;
        public static const GAME_Y_MIDDLE:int = GAME_HEIGHT / 2;

        public function PitStop() {
            super( GAME_WIDTH, GAME_HEIGHT, PlayState, 1, 60, 60, true );
        }

    }

}
