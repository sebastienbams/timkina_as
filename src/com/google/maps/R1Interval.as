package com.google.maps 
{
    public class R1Interval extends Object
    {
        public function R1Interval(arg1:Number, arg2:Number)
        {
            super();
            lo = arg1;
            hi = arg2;
            return;
        }

        public function containsInterval(arg1:com.google.maps.R1Interval):Boolean
        {
            if (arg1.isEmpty())
            {
                return true;
            }
            return arg1.lo >= lo && arg1.hi <= hi;
        }

        public function isEmpty():Boolean
        {
            return lo > hi;
        }

        public function equals(arg1:com.google.maps.R1Interval):Boolean
        {
            if (isEmpty())
            {
                return isEmpty();
            }
            return Math.abs(arg1.lo - lo) + Math.abs(hi - arg1.hi) <= com.google.maps.MapUtil.FLOAT_ERROR_MARGIN;
        }

        public function span():Number
        {
            return isEmpty() ? 0 : hi - lo;
        }

        public function intersects(arg1:com.google.maps.R1Interval):Boolean
        {
            if (lo <= arg1.lo)
            {
                return arg1.lo <= hi && arg1.lo <= arg1.hi;
            }
            return lo <= arg1.hi && lo <= hi;
        }

        public function center():Number
        {
            return (hi + lo) / 2;
        }

        public function extend(arg1:Number):void
        {
            if (isEmpty())
            {
                lo = arg1;
                hi = arg1;
            }
            else 
            {
                if (arg1 < lo)
                {
                    lo = arg1;
                }
                else 
                {
                    if (arg1 > hi)
                    {
                        hi = arg1;
                    }
                }
            }
            return;
        }

        public function contains(arg1:Number):Boolean
        {
            return arg1 >= lo && arg1 <= hi;
        }

        public static function fromObject(arg1:Object):com.google.maps.R1Interval
        {
            return new R1Interval(arg1.lo, arg1.hi);
        }

        public var hi:Number;

        public var lo:Number;
    }
}
