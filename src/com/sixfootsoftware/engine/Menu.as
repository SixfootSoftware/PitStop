/**
 * User: dvlg
 * Date: 04/07/13
 * Time: 14:28
 */
package com.sixfootsoftware.engine {
    import org.flixel.FlxGroup;

    public class Menu extends FlxGroup {

        public function Menu() {
            //add menu background
        }

        public function addItem( item:MenuItem ):void {
            add( item.getSprite() );
        }
    }
}
