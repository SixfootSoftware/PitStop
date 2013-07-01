
package com.sixfootsoftware.pitstop {
    import com.sixfootsoftware.engine.BitmapFont;

    import org.flixel.FlxGroup;

    public class ScoreTextGenerator extends FlxGroup {

        private var font:BitmapFont = new BitmapFont( AssetRegistry.font, 32, 66, BitmapFont.TEXT_SET1, 6 );
        private var bgFont:BitmapFont = new BitmapFont( AssetRegistry.font, 32, 66, BitmapFont.TEXT_SET1, 6 );

        public function ScoreTextGenerator() {
            font.align = bgFont.align = BitmapFont.ALIGN_RIGHT;
            font.customSpacingX = bgFont.customSpacingX = 8;
            font.setText( "0", 922, 91 );
            bgFont.setText( "------", 922, 93 );
            add( bgFont );
            add( font );
            kill();
        }

        public function updateScore( score:String ):void {
            font.setText( score, 922, 91 );
        }

        override public function revive():void {
            callAll( "revive" );
            super.revive();
        }
    }
}
