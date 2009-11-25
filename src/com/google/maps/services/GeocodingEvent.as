package com.google.maps.services 
{
    import com.google.maps.*;
    import com.google.maps.wrappers.*;
    import flash.events.*;
    
    public final class GeocodingEvent extends com.google.maps.MapEvent
    {
        public function GeocodingEvent(arg1:String, arg2:Boolean=false, arg3:Boolean=false)
        {
            super(arg1, arg2, arg3);
            return;
        }

        public override function get eventClassChain():Array
        {
            return ["GeocodingEvent", "MapEvent"];
        }

        protected override function copyEventData(arg1:flash.events.Event, arg2:Object):void
        {
            var loc1:*;
            loc1 = null;
            super.copyEventData(arg1, arg2);
            loc1 = Object(arg1);
            this.name = loc1.name as String;
            this.request = loc1.request as String;
            this.status = loc1.status as Number;
            this.response = com.google.maps.wrappers.Wrapper.instance().wrapGeocodingResponse(loc1.response);
            return;
        }

        public static function fromCrossDomainEvent(arg1:flash.events.Event, arg2:Object):com.google.maps.services.GeocodingEvent
        {
            var loc1:*;
            loc1 = null;
            loc1 = arg1 as com.google.maps.services.GeocodingEvent;
            if (loc1 != null)
            {
                return loc1;
            }
            loc1 = new GeocodingEvent(arg1.type, arg1.bubbles, arg1.cancelable);
            loc1.copyEventData(arg1, arg2);
            return loc1;
        }

        public static const GEOCODING_FAILURE:String="geocodingfailure";

        public static const GEOCODING_SUCCESS:String="geocodingsuccess";

        public var name:String;

        public var response:com.google.maps.services.GeocodingResponse;

        public var status:Number;

        public var request:String;
    }
}
