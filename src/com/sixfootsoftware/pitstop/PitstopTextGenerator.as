
package com.sixfootsoftware.pitstop {
    import com.sixfootsoftware.engine.BitmapFont;

    import org.flixel.FlxGroup;
    import org.flixel.FlxSprite;

    public class PitstopTextGenerator extends FlxGroup {

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
            font.setText( time, 619, 91 );
        }

        override public function revive():void {
            callAll( "revive" );
            super.revive();
        }
    }
}
