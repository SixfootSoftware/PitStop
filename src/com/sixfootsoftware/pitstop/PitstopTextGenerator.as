
package com.sixfootsoftware.pitstop {
    import com.sixfootsoftware.engine.BitmapFont;

    import org.flixel.FlxGroup;
    import org.flixel.FlxSprite;

    public class PitstopTextGenerator extends FlxGroup implements Generator {

        private var font:BitmapFont = new BitmapFont( AssetRegistry.font, 32, 66, BitmapFont.TEXT_SET1, 6 );
        private var bgFont:BitmapFont = new BitmapFont( AssetRegistry.font, 32, 66, BitmapFont.TEXT_SET1, 6 );
        private var dot:FlxSprite = new FlxSprite( 531, 152, AssetRegistry.dot );
        private var calculator:PlayerPitstopCalculator;

        public function PitstopTextGenerator() {
            font.align = bgFont.align = BitmapFont.ALIGN_RIGHT;
            font.customSpacingX = bgFont.customSpacingX = 8;
            font.setText( "000", 619, 91 );
            bgFont.setText( "------", 619, 93 );
            add( bgFont );
            add( font );
            add( dot );
            kill();
        }

        public function setPitstopCalculator( pitstopCalculator:PlayerPitstopCalculator ):void {
            calculator = pitstopCalculator;
        }

        public function updatePitTime( time:String ):void {
            if ( time.length < 3 ) {
                time = zeroPad( time, 3 );
            }
            font.setText( time, 619, 91 );
        }

        override public function revive():void {
            callAll( "revive" );
            super.revive();
        }

        override public function preUpdate():void {
            super.preUpdate();
            updateGenerator();
        }

        public function updateGenerator():void {
            if ( calculator.updated() ) {
                updatePitTime( calculator.getCalculatorResult().toString() );
            }
        }

        private function zeroPad(str:String, width:int):String {
            while( str.length < width )
                str="0" + str;
            return str;
        }
    }
}
