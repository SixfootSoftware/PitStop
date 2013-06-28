/**
 * Created with IntelliJ IDEA.
 * User: dvlg
 * Date: 28/06/13
 * Time: 15:34
 * To change this template use File | Settings | File Templates.
 */
package com.sixfootsoftware.pitstop {
    public class PlayerControl {

        private var car:Car;

        public function PlayerControl() {
        }

        public function setPitGridCar( car:Car ):void {
            this.car = car;
        }
    }
}
