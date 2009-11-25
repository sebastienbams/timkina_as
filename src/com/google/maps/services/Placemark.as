package com.google.maps.services 
{
    import com.google.maps.*;
    import com.google.maps.wrappers.*;
    
    public dynamic class Placemark extends Object
    {
        public function Placemark()
        {
            super();
            return;
        }

        public static function fromObject(arg1:Object):com.google.maps.services.Placemark
        {
            var loc1:*;
            loc1 = null;
            loc1 = new Placemark();
            loc1.point = com.google.maps.LatLng.fromObject(arg1.point);
            loc1.address = arg1.address as String;
            loc1.addressDetails = arg1.addressDetails;
            com.google.maps.wrappers.Wrapper.copyObject(loc1, arg1);
            return loc1;
        }

        public var point:com.google.maps.LatLng;

        public var address:String;

        public var addressDetails:Object;
    }
}
