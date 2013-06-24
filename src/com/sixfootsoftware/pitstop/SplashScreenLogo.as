package com.sixfootsoftware.pitstop {
    import org.flixel.FlxSprite;

    public class SplashScreenLogo implements DoubleLinkedList {

        private var duration:Number = 0;
        private var sprite:FlxSprite;
        private var previous:SplashScreenLogo;
        private var next:SplashScreenLogo;

        public function SplashScreenLogo( sprite:FlxSprite, duration:Number ) {
            this.duration = duration * 1000;
            this.sprite = sprite;
            this.sprite.alpha = 0;
        }

        public function getDuration():Number {
            return duration;
        }

        public function getSprite():FlxSprite {
            return sprite;
        }

        public function setNext( logo:DoubleLinkedList ):void {
            next = logo as SplashScreenLogo;
        }

        public function getNext():DoubleLinkedList {
            return next;
        }

        public function setPrev( logo:DoubleLinkedList ):void {
            previous = logo as SplashScreenLogo;
        }

        public function getPrev():DoubleLinkedList {
            return previous;
        }

        public function hideLogo():void {
            this.sprite.kill();
        }

        public function showLogo():void {
            this.sprite.alpha = 1;
            this.sprite.play( "animate" );
        }
    }
}
