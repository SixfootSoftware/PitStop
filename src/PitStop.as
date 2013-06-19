package {

import org.flixel.*;

[SWF(width="980", height="550", backgroundColor="#000000")]

[Frame(factoryClass="Preloader")]

    public class PitStop extends FlxGame {

        public function PitStop() {
            super(980, 550, PlayState, 1, 60, 60, true );
        }

    }

}
