/**
 * Created with IntelliJ IDEA.
 * User: dvlg
 * Date: 28/06/13
 * Time: 15:34
 * To change this template use File | Settings | File Templates.
 */
package com.sixfootsoftware.pitstop {
    import flash.utils.getTimer;

    import org.flixel.FlxG;
    import org.flixel.FlxGroup;
    import org.flixel.FlxPoint;
    import org.flixel.FlxSound;

    public class PlayerControl extends FlxGroup {

        private var car:PitCar;
        private var leftArrowDisplay:LeftArrowDisplay = new LeftArrowDisplay();
        private var rightArrowDisplay:RightArrowDisplay = new RightArrowDisplay();
        private var point:FlxPoint = new FlxPoint();
        private var pitStart:Number;
        private var pitStarted:Boolean = false;
        private var elapsed:Number;
        private var timer:Number;
        private var stopped:Boolean = true;
        private var sound:FlxSound = new FlxSound();

        public function PlayerControl() {
            add(leftArrowDisplay);
            add(rightArrowDisplay);
            sound.loadEmbedded( AssetRegistry.SoundBlip, false, false );
            kill();
        }

        public function setPitGridCar(car:PitCar):void {
            this.car = car;
        }

        public function displayAppropriateAnimation():void {
            if (this.car.isOccupied()) {
                if (this.car.isWheelDone() && ( this.leftArrowDisplay.playingAnimation || this.rightArrowDisplay.playingAnimation )) {
                    leftArrowDisplay.playingAnimation = false;
                    rightArrowDisplay.playingAnimation = false;
                } else {
                    if (!this.car.isWheelOff() && !this.leftArrowDisplay.playingAnimation) {
                        this.leftArrowDisplay.playingAnimation = true;
                        this.rightArrowDisplay.playingAnimation = false;
                    }
                    if (!this.car.isWheelOn() && this.car.isWheelOff() && !this.rightArrowDisplay.playingAnimation) {
                        this.leftArrowDisplay.playingAnimation = false;
                        this.rightArrowDisplay.playingAnimation = true;
                    }
                }
            }
        }

        override public function revive():void {
            stopped = false;
            callAll("revive");
            super.revive();
        }

        public function checkPlayerPressed():void {
            if (this.car.isOccupied() && !stopped) {
                timePitEvent();
                if (!car.isWheelOff() && isLoosenWheelPressed()) {
                    car.loosenWheel();
                } else if (car.isWheelOff()
                        && !car.isWheelOn()
                        && isTightenWheelPressed()) {
                    car.tightenWheel();
                } else if (car.isWheelDone()) {
                    release();
                }
                calculatePitstop( elapsed );
            }
        }

        private function timePitEvent():void {
            if( car.isWheelDone() ) {
                return;
            }
            timer = getTimer();
            if (!pitStarted) {
                sound.play();
                pitStarted = true;
                pitStart = timer;
                elapsed = 0;
            } else {
                elapsed = timer - pitStart;
            }
        }

        private function release():void {
            if ( pitStarted ) {
                sound.play();
                pitStarted = false;
                calculateScore(elapsed);
                car.release();
            }
        }

        private function isLoosenWheelPressed():Boolean {
            return FlxG.keys.justReleased("LEFT") || isArrowClicked(leftArrowDisplay);
        }


        private function isArrowClicked(arrow:ArrowDisplay):Boolean {
            return arrow.overlapsPoint(point.make(FlxG.mouse.x, FlxG.mouse.y))
                    && FlxG.mouse.justReleased();
        }

        private function isTightenWheelPressed():Boolean {
            return FlxG.keys.justReleased("RIGHT") || isArrowClicked(rightArrowDisplay);
        }

        public function stop():void {
            leftArrowDisplay.playingAnimation = rightArrowDisplay.playingAnimation = alive = false;
            stopped = true;
        }

        private function calculatePitstop( pitstop:Number ):void {
            ComponentRegistry.pitstopCalculator.calculatePitstop( pitstop );
        }

        private function calculateScore( score:Number ):void {
            ComponentRegistry.scoreCalculator.addScore( score );
        }
    }
}
