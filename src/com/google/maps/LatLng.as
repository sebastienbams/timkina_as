package com.google.maps 
{
    public class LatLng extends Object
    {
        public function LatLng(arg1:Number, arg2:Number, arg3:Boolean=false)
        {
            super();
            if (!arg3)
            {
                arg1 = com.google.maps.MapUtil.bound(arg1, -90, 90);
                arg2 = com.google.maps.MapUtil.wrapHalfOpen(arg2, -180, 180);
            }
            latDegrees_ = arg1;
            lngDegrees_ = arg2;
            return;
        }

        public function latRadians():Number
        {
            return com.google.maps.MapUtil.degreesToRadians(latDegrees_);
        }

        public function toUrlValue(arg1:Number=6):String
        {
            return quantize(lat(), arg1) + "," + quantize(lng(), arg1);
        }

        public function lng():Number
        {
            return lngDegrees_;
        }

        public function lat():Number
        {
            return latDegrees_;
        }

        public function angleFrom(arg1:com.google.maps.LatLng):Number
        {
            var loc1:*;
            loc1 = NaN;
            var loc2:*;
            loc2 = NaN;
            var loc3:*;
            loc3 = NaN;
            var loc4:*;
            loc4 = NaN;
            loc1 = latRadians();
            loc2 = arg1.latRadians();
            loc3 = loc1 - loc2;
            loc4 = lngRadians() - lngRadians();
            return 2 * Math.asin(Math.sqrt(Math.pow(Math.sin(loc3 / 2), 2) + Math.cos(loc1) * Math.cos(loc2) * Math.pow(Math.sin(loc4 / 2), 2)));
        }

        public function toString():String
        {
            return "(" + this.lat() + ", " + this.lng() + ")";
        }

        public function lngRadians():Number
        {
            return com.google.maps.MapUtil.degreesToRadians(lngDegrees_);
        }

        public function distanceFrom(arg1:com.google.maps.LatLng, arg2:Number=6378137):Number
        {
            return angleFrom(arg1) * arg2;
        }

        public function clone():com.google.maps.LatLng
        {
            return new com.google.maps.LatLng(lat(), lng(), true);
        }

        public function equals(arg1:com.google.maps.LatLng):Boolean
        {
            if (!arg1)
            {
                return false;
            }
            return com.google.maps.MapUtil.approxEquals(lat(), arg1.lat()) && com.google.maps.MapUtil.approxEquals(lng(), arg1.lng());
        }

        private static function quantize(arg1:Number, arg2:Number):Number
        {
            var loc1:*;
            loc1 = NaN;
            loc1 = Math.pow(10, arg2);
            return Math.round(arg1 * loc1) / loc1;
        }

        public static function fromRadians(arg1:Number, arg2:Number, arg3:Boolean=false):com.google.maps.LatLng
        {
            return new LatLng(com.google.maps.MapUtil.radiansToDegrees(arg1), com.google.maps.MapUtil.radiansToDegrees(arg2), arg3);
        }

        public static function fromObject(arg1:Object):com.google.maps.LatLng
        {
            return new LatLng(arg1.lat(), arg1.lng());
        }

        public static function fromUrlValue(arg1:String):com.google.maps.LatLng
        {
            var loc1:*;
            loc1 = null;
            loc1 = arg1.split(",");
            return new LatLng(parseFloat(loc1[0]), parseFloat(loc1[1]));
        }

        public static const EARTH_RADIUS:Number=6378137;

        private var lngDegrees_:Number;

        private var latDegrees_:Number;
    }
}
