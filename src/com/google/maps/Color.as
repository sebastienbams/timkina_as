package com.google.maps 
{
    public final class Color extends Object
    {
        public function Color(arg1:Number)
        {
            super();
            _r = arg1 >> 16;
            _g = (arg1 & 65280) >> 8;
            _b = arg1 & 255;
            return;
        }

        public function get b():Number
        {
            return Math.round(_b);
        }

        public function set r(arg1:Number):void
        {
            _r = arg1 > 255 ? 255 : arg1 < 0 ? 0 : arg1;
            return;
        }

        public function set b(arg1:Number):void
        {
            _b = arg1 > 255 ? 255 : arg1 < 0 ? 0 : arg1;
            return;
        }

        public function toString():String
        {
            return "R:" + r + "/G:" + g + "/B:" + b;
        }

        public function get g():Number
        {
            return Math.round(_g);
        }

        public function get r():Number
        {
            return Math.round(_r);
        }

        public function get rgb():Number
        {
            return (r << 16) + (g << 8) + b;
        }

        public function set g(arg1:Number):void
        {
            _g = arg1 > 255 ? 255 : arg1 < 0 ? 0 : arg1;
            return;
        }

        public function incRGB(arg1:Number, arg2:Number, arg3:Number):void
        {
            r = _r + arg1;
            g = _g + arg2;
            b = _b + arg3;
            return;
        }

        public function setRGB(arg1:Number, arg2:Number, arg3:Number):void
        {
            r = arg1;
            g = arg2;
            b = arg3;
            return;
        }

        public static function fromObject(arg1:Object):com.google.maps.Color
        {
            return new Color(arg1.rgb);
        }

        public static function toHtml(arg1:Number):String
        {
            var loc1:*;
            loc1 = null;
            var loc2:*;
            loc2 = NaN;
            var loc3:*;
            loc3 = null;
            if (!("number" == "number") || isNaN(arg1))
            {
                arg1 = 0;
            }
            loc1 = "#000000";
            loc2 = Math.floor(com.google.maps.MapUtil.bound(arg1, 0, 16777215));
            loc3 = loc2.toString(16);
            return loc1.substr(0, 7 - loc3.length) + loc3;
        }

        public static const GRAY10:Number=10526880;

        public static const GRAY7:Number=7368816;

        public static const GRAY13:Number=13684944;

        public static const GRAY15:Number=15790320;

        public static const MAGENTA:Number=16711935;

        public static const GRAY11:Number=11579568;

        public static const GRAY12:Number=12632256;

        public static const WHITE:Number=16777215;

        public static const BLUE:Number=255;

        public static const DEFAULTLINK:Number=7829452;

        public static const BLACK:Number=0;

        public static const GREEN:Number=65280;

        public static const CYAN:Number=65535;

        public static const GRAY1:Number=1052688;

        public static const GRAY2:Number=2105376;

        public static const GRAY3:Number=3158064;

        public static const RED:Number=16711680;

        public static const GRAY5:Number=5263440;

        public static const GRAY6:Number=6316128;

        public static const YELLOW:Number=16776960;

        public static const GRAY8:Number=8421504;

        public static const GRAY9:Number=9474192;

        public static const GRAY4:Number=4210752;

        public static const GRAY14:Number=14737632;

        private var _b:Number;

        private var _g:Number;

        private var _r:Number;
    }
}
