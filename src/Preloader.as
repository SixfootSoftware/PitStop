package {

import flash.display.BitmapDataChannel;
import flash.display.BlendMode;
import flash.geom.ColorTransform;

import org.flixel.FlxG;
import org.flixel.FlxU;

    import flash.text.TextFormat;
    import flash.text.TextField;
    import flash.display.BitmapData;
    import flash.display.Bitmap;
    import flash.display.Sprite;

    import org.flixel.system.FlxPreloader;

    public class Preloader extends FlxPreloader {
        public function Preloader() {
            className = "PitStop";
            super();
            minDisplayTime = 5;
        }

        override protected function create(): void {
            _min = 0;
            if(!FlxG.debug)
                _min = minDisplayTime*1000;
            setupBuffer();
            setupProgressBar();

            // This displays the percentage that has been loaded.
            _text = new TextField();
            _text.defaultTextFormat = new TextFormat("system",8,0x000000);
            _text.embedFonts = true;
            _text.selectable = false;
            _text.multiline = false;
            _text.x = 2;
            _text.y = _bmpBar.y - 11;
            _text.width = 80;
            _buffer.addChild(_text);
        }

        private function setupBuffer(): void {
            // The buffer, add every graphics on it.
            _buffer = new Sprite();
            _buffer.width = PitStop.GAME_WIDTH;
            _buffer.height = PitStop.GAME_HEIGHT;
            _buffer.scaleX = 2;
            _buffer.scaleY = 2;
            addChild(_buffer);
            // Background
            _width = PitStop.GAME_WIDTH/_buffer.scaleX;
            _height = PitStop.GAME_HEIGHT/_buffer.scaleY;
            var seed:int = int( Math.random() * int.MAX_VALUE );
            var backdrop:BitmapData = new BitmapData( _width, _height, false, 0x9E9F8D );

            var colouriser:BitmapData = new BitmapData( _width, _height, false, 0x9E9F8D );
            backdrop.noise( seed, 0x92, 0x9B, BitmapDataChannel.RED, true );
            backdrop.draw( colouriser, null, null, BlendMode.OVERLAY, backdrop.rect, false );
            _buffer.addChild(new Bitmap( backdrop ));

        }

        private function setupProgressBar(): void {
            // This shows the bar.
            var progressBar:BitmapData = new BitmapData( 1, 7, false, 0x8F9080 );
            var shadowBar:BitmapData = new BitmapData( 1, 6, false, 0x000000 );
            progressBar.draw( shadowBar, null, null, BlendMode.NORMAL, shadowBar.rect, false );
            _bmpBar = new Bitmap( progressBar );
            _bmpBar.x = 4;
            _bmpBar.y = _height-11;
            _buffer.addChild(_bmpBar);
        }

        override protected function update(Percent: Number): void {
            _bmpBar.scaleX = Percent*(_width-8);
            if(Percent >= 1)
            {
                _text.text = "Completed";
                _text.setTextFormat(_text.defaultTextFormat);
                return;
            }
            _text.text = "Loading " + className + " : " + FlxU.floor(Percent*100)+"%";
            _text.setTextFormat(_text.defaultTextFormat);
        }
    }
}