/**
 * User: Dave Long
 * Date: 29/06/13
 * Time: 14:35
 */
package com.sixfootsoftware.pitstop {
    public class RightArrowDisplay extends ArrowDisplay {
        public function RightArrowDisplay() {
            super(794);
            addAnimation("enabled", [1, 2], 5, true);
            addAnimation("disabled", [1], 1, true);
            play("disabled");
        }

    }
}
