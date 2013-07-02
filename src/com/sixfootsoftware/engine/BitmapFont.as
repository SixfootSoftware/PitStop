package com.sixfootsoftware.engine {
    import org.flixel.*;

    import flash.display.BitmapData;
    import flash.geom.Point;
    import flash.geom.Rectangle;

    public class BitmapFont extends FlxSprite {

        public var align:uint = ALIGN_LEFT;
        public var autoUpperCase:Boolean = true;
        public var customSpacingX:uint = 0;
        private var _text:String;

        public static const ALIGN_LEFT:uint = 0;
        public static const ALIGN_RIGHT:uint = 1;
        public static const ALIGN_CENTER:uint = 2;

        public static const TEXT_SET1:String = "8642037591-";

        private var fontSet:BitmapData;
        public var characterWidth:uint;
        public var characterHeight:uint;
        private var grabData:Array;
        private var tmpx:int;

        /**
         * Loads 'font' and prepares it for use by future calls to .text
         *
         * @param    font            The font set graphic class (as defined by your embed)
         * @param    characterWidth    The width of each character in the font set.
         * @param    characterHeight    The height of each character in the font set.
         * @param    chars            The characters used in the font set, in display order. You can use the TEXT_SET consts for common font set arrangements.
         * @param    charsPerRow        The number of characters per row in the font set.
         */
        public function BitmapFont(font:Class, characterWidth:uint, characterHeight:uint, chars:String, charsPerRow:uint):void {
            //	Take a copy of the font for internal use
            fontSet = (new font).bitmapData;

            this.characterWidth = characterWidth;
            this.characterHeight = characterHeight;
            grabData = [];

            //	Now generate our rects for faster copyPixels later on
            var currentX:uint = 0;
            var currentY:uint = 0;
            var r:uint = 0;

            for (var c:uint = 0; c < chars.length; c++) {
                //	The rect is hooked to the ASCII value of the character
                grabData[chars.charCodeAt(c)] = new Rectangle(currentX,
                        currentY,
                        characterWidth,
                        characterHeight);
                r++;

                if (r == charsPerRow) {
                    r = 0;
                    currentX = 0;
                    currentY += characterHeight;
                } else {
                    currentX += characterWidth;
                }
            }
        }

        /**
         * Set this value to update the text in this sprite. Carriage returns are automatically stripped out if multiLine is false. Text is converted to upper case if autoUpperCase is true.
         *
         * @return    bitmapFont
         */
        public function setText(content:String, x:int, y:int):BitmapFont {
            var newText:String;

            this.x = this.tmpx = x;
            this.y = y;

            if (autoUpperCase) {
                newText = content.toUpperCase();
            } else {
                newText = content;
            }

            // Smart update: Only change the bitmap data if the string has changed
            if (newText != _text) {
                _text = newText;
                removeUnsupportedCharacters();
                buildBitmapFontText();
            }
            return this;
        }

        public function getText():String {
            return _text;
        }

        /**
         * Updates the BitmapData of the Sprite with the text
         *
         * @return    void
         */
        private function buildBitmapFontText():void {
            var cx:int = 0;
            var temp:BitmapData = new BitmapData(_text.length * ( characterWidth + customSpacingX ), characterHeight, true, 0xf);

            switch (align) {
                case ALIGN_LEFT:
                    cx = 0;
                    break;
                case ALIGN_RIGHT:
                    cx = temp.width - ( _text.length * ( characterWidth + customSpacingX ) );
                    this.x = tmpx - temp.width;
                    break;
                case ALIGN_CENTER:
                    cx = ( temp.width / 2 ) - ( ( _text.length * ( characterWidth + customSpacingX ) ) / 2 );
                    cx += customSpacingX / 2;
                    break;
            }

            pasteLine(temp, _text, cx);
            pixels = temp;
        }

        /**
         * Internal function that takes a single line of text (2nd parameter) and pastes it into the BitmapData at the given coordinates.
         * Used by getLine and getMultiLine
         *
         * @param    output            The BitmapData that the text will be drawn onto
         * @param    line            The single line of text to paste
         * @param    x                The x coordinate
         */
        private function pasteLine(output:BitmapData, line:String, x:uint = 0):void {
            for (var c:uint = 0; c < line.length; c++) {
                if (line.charAt(c) == " ") {
                    x += characterWidth + customSpacingX;
                } else {
                    //	If the character doesn't exist in the font then we don't want a blank space, we just want to skip it
                    if (!grabData[line.charCodeAt(c)] is Rectangle) {
                        continue;
                    }

                    output.copyPixels(fontSet,
                            grabData[line.charCodeAt(c)],
                            new Point(x, 0));
                    x += characterWidth + customSpacingX;
                    if (x > output.width) {
                        break;
                    }
                }
            }
        }

        /**
         * Internal helper function that removes all unsupported characters from the _text String, leaving only characters contained in the font set.
         *
         * @return    A clean version of the string
         */
        private function removeUnsupportedCharacters():String {
            var newString:String = "";

            for (var c:uint = 0; c < _text.length; c++) {
                if (grabData[_text.charCodeAt(c)] is Rectangle || _text.charCodeAt(c) == 32) {
                    newString = newString.concat(_text.charAt(c));
                }
            }

            return newString;
        }

    }
}
