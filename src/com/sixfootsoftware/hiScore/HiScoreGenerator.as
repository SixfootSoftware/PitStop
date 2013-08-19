/**
 * User: Dave Long
 * Date: 06/08/13
 * Time: 19:11
 */
package com.sixfootsoftware.hiScore {
    import com.adobe.crypto.MD5;
    import com.sixfootsoftware.engine.utils.StringOperations;

    import org.flixel.FlxG;

    public class HiScoreGenerator {
        public static const SECRET:String = "__1337455B03__";

        private var secret:String;

        private var userId:String;

        private var score:String;


        /**
         * @param secret
         */
        public function HiScoreGenerator(secret:String) {
            this.secret = padScoreElement(secret);
        }


        /**
         *
         * @param userId
         * @return
         */
        public function setUser(userId:String):HiScoreGenerator {
            this.userId = padScoreElement(userId);
            return this;
        }


        /**
         * @param score
         * @return
         */
        public function setScore(score:String):HiScoreGenerator {
            this.score = padScoreElement(score);
            return this;
        }


        public function calculateChecksum():String {
            return MD5.hash(secret + score + userId);
        }


        /**
         * @param element
         *
         * @return string
         */
        private function padScoreElement(element:String):String {
            return StringOperations.zeroPad(element, 32);
        }
    }
}
