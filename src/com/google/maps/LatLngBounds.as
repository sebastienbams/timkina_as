package com.google.maps 
{
    public class LatLngBounds extends Object
    {
        public function LatLngBounds(arg1:com.google.maps.LatLng=null, arg2:com.google.maps.LatLng=null)
        {
            var loc1:*;
            loc1 = NaN;
            var loc2:*;
            loc2 = NaN;
            var loc3:*;
            loc3 = NaN;
            var loc4:*;
            loc4 = NaN;
            super();
            if (arg1 && !arg2)
            {
                arg2 = arg1;
            }
            if (arg1)
            {
                loc1 = com.google.maps.MapUtil.bound(arg1.latRadians(), (-PI) / 2, PI / 2);
                loc2 = com.google.maps.MapUtil.bound(arg2.latRadians(), (-PI) / 2, PI / 2);
                lat_ = new com.google.maps.R1Interval(loc1, loc2);
                loc3 = arg1.lngRadians();
                if ((loc4 = arg2.lngRadians()) - loc3 >= PI * 2)
                {
                    lng_ = new com.google.maps.S1Interval(-PI, PI);
                }
                else 
                {
                    loc3 = com.google.maps.MapUtil.wrap(loc3, -PI, PI);
                    loc4 = com.google.maps.MapUtil.wrap(loc4, -PI, PI);
                    lng_ = new com.google.maps.S1Interval(loc3, loc4);
                }
            }
            else 
            {
                lat_ = new com.google.maps.R1Interval(1, -1);
                lng_ = new com.google.maps.S1Interval(PI, -PI);
            }
            return;
        }

        public function getNorthEast():com.google.maps.LatLng
        {
            return com.google.maps.LatLng.fromRadians(lat_.hi, lng_.hi);
        }

        public function containsLatLng(arg1:com.google.maps.LatLng):Boolean
        {
            return lat_.contains(arg1.latRadians()) && lng_.contains(arg1.lngRadians());
        }

        public function isFullLat():Boolean
        {
            return lat_.hi >= PI / 2 && lat_.lo <= (-PI) / 2;
        }

        public function isEmpty():Boolean
        {
            return lat_.isEmpty() || lng_.isEmpty();
        }

        public function getCenter():com.google.maps.LatLng
        {
            return com.google.maps.LatLng.fromRadians(lat_.center(), lng_.center());
        }

        public function intersects(arg1:com.google.maps.LatLngBounds):Boolean
        {
            return lat_.intersects(arg1.lat_) && lng_.intersects(arg1.lng_);
        }

        public function isFullLng():Boolean
        {
            return lng_.isFull();
        }

        public function union(arg1:com.google.maps.LatLngBounds):void
        {
            extend(arg1.getSouthWest());
            extend(arg1.getNorthEast());
            return;
        }

        public function getSouth():Number
        {
            return com.google.maps.MapUtil.radiansToDegrees(lat_.lo);
        }

        public function clone():com.google.maps.LatLngBounds
        {
            return new com.google.maps.LatLngBounds(getSouthWest(), getNorthEast());
        }

        public function getNorthWest():com.google.maps.LatLng
        {
            return com.google.maps.LatLng.fromRadians(lat_.hi, lng_.lo);
        }

        public function extend(arg1:com.google.maps.LatLng):void
        {
            lat_.extend(arg1.latRadians());
            lng_.extend(arg1.lngRadians());
            return;
        }

        public function isLargerThan(arg1:com.google.maps.LatLngBounds):Boolean
        {
            var loc1:*;
            loc1 = null;
            var loc2:*;
            loc2 = null;
            loc1 = toSpan();
            loc2 = arg1.toSpan();
            return loc1.lat() > loc2.lat() && loc1.lng() > loc2.lng();
        }

        public function getWest():Number
        {
            return com.google.maps.MapUtil.radiansToDegrees(lng_.lo);
        }

        public function getSouthWest():com.google.maps.LatLng
        {
            return com.google.maps.LatLng.fromRadians(lat_.lo, lng_.lo);
        }

        public function getNorth():Number
        {
            return com.google.maps.MapUtil.radiansToDegrees(lat_.hi);
        }

        public function toString():String
        {
            return "(" + getSouthWest() + ", " + getNorthEast() + ")";
        }

        public function getEast():Number
        {
            return com.google.maps.MapUtil.radiansToDegrees(lng_.hi);
        }

        public function containsBounds(arg1:com.google.maps.LatLngBounds):Boolean
        {
            return lat_.containsInterval(arg1.lat_) && lng_.containsInterval(arg1.lng_);
        }

        public function getSouthEast():com.google.maps.LatLng
        {
            return com.google.maps.LatLng.fromRadians(lat_.lo, lng_.hi);
        }

        public function toSpan():com.google.maps.LatLng
        {
            return com.google.maps.LatLng.fromRadians(lat_.span(), lng_.span(), true);
        }

        public function equals(arg1:com.google.maps.LatLngBounds):Boolean
        {
            return lat_.equals(arg1.lat_) && lng_.equals(arg1.lng_);
        }

        public static function fromObject(arg1:Object):com.google.maps.LatLngBounds
        {
            return new LatLngBounds(com.google.maps.LatLng.fromObject(arg1.getSouthWest()), com.google.maps.LatLng.fromObject(arg1.getNorthEast()));
        }

        private static const PI:Number=Math.PI;

        private var lng_:com.google.maps.S1Interval;

        private var lat_:com.google.maps.R1Interval;
    }
}
