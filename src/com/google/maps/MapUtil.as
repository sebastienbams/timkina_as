package com.google.maps 
{
    public class MapUtil extends Object
    {
        public function MapUtil()
        {
            super();
            return;
        }

        public static function radiansToDegrees(arg1:Number):Number
        {
            return arg1 / (Math.PI / 180);
        }

        public static function copyObject(arg1:Object, arg2:Object):void
        {
            var loc1:*;
            loc1 = null;
            var loc2:*;
            loc2 = 0;
            var loc3:*;
            loc3 = arg2;
            for (loc1 in loc3)
            {
                arg1[loc1] = arg2[loc1];
            }
            return;
        }

        public static function wrapHalfOpen(arg1:Number, arg2:Number, arg3:Number):Number
        {
            while (arg1 >= arg3) 
            {
                arg1 = arg1 - (arg3 - arg2);
            }
            while (arg1 < arg2) 
            {
                arg1 = arg1 + arg3 - arg2;
            }
            return arg1;
        }

        public static function approxEquals(arg1:Number, arg2:Number, arg3:Number=1e-009):Boolean
        {
            return Math.abs(arg1 - arg2) <= arg3;
        }

        public static function wrap(arg1:Number, arg2:Number, arg3:Number):Number
        {
            while (arg1 > arg3) 
            {
                arg1 = arg1 - (arg3 - arg2);
            }
            while (arg1 < arg2) 
            {
                arg1 = arg1 + arg3 - arg2;
            }
            return arg1;
        }

        public static function cloneObject(arg1:Object):Object
        {
            var loc1:*;
            loc1 = null;
            var loc2:*;
            loc2 = null;
            loc1 = new Object();
            var loc3:*;
            loc3 = 0;
            var loc4:*;
            loc4 = arg1;
            for (loc2 in loc4)
            {
                loc1[loc2] = arg1[loc2];
            }
            return loc1;
        }

        public static function bound(arg1:Number, arg2:Number=NaN, arg3:Number=NaN):Number
        {
            if (!isNaN(arg2))
            {
                arg1 = Math.max(arg1, arg2);
            }
            if (!isNaN(arg3))
            {
                arg1 = Math.min(arg1, arg3);
            }
            return arg1;
        }

        public static function degreesToRadians(arg1:Number):Number
        {
            return arg1 * Math.PI / 180;
        }

        public static const FLOAT_ERROR_MARGIN:Number=1e-009;
    }
}
