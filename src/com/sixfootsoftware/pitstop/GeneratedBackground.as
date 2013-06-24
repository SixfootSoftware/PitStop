package com.sixfootsoftware.pitstop {

import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.BitmapDataChannel;
import flash.display.BlendMode;

import org.flixel.FlxSprite;

public class GeneratedBackground {

        private var backdrop:BitmapData;

        public function GeneratedBackground( xScale:Number, yScale:Number ) {
            var seed:int = int( Math.random() * int.MAX_VALUE );
            var width:int = PitStop.GAME_WIDTH / xScale;
            var height:int = PitStop.GAME_HEIGHT / yScale;
            backdrop = new BitmapData( width, height, false, 0x9E9F8D );
            var colouriser:BitmapData = new BitmapData( width, height, false, 0x9E9F8D );
            backdrop.noise( seed, 0x87, 0x91, BitmapDataChannel.RED, true );
            backdrop.draw( colouriser, null, null, BlendMode.OVERLAY, backdrop.rect, false );
        }

        public function getBitmap():Bitmap {
            return new Bitmap( backdrop );
        }

        public function getFlxSprite():FlxSprite {
            var sprite:FlxSprite = new FlxSprite();
            sprite.pixels = backdrop;
            return sprite;
        }
    }
}
