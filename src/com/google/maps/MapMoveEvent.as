package com.google.maps 
{
    import flash.events.*;
    
    public class MapMoveEvent extends com.google.maps.MapEvent
    {
        public function MapMoveEvent(arg1:String, arg2:com.google.maps.LatLng, arg3:Boolean=false, arg4:Boolean=false)
        {
            super(arg1, null, arg3, arg4);
            this.eventLatLng = arg2;
            return;
        }

        public function get latLng():com.google.maps.LatLng
        {
            return this.eventLatLng;
        }

        public override function get eventClassChain():Array
        {
            return ["MapMoveEvent", "MapEvent"];
        }

        public override function clone():flash.events.Event
        {
            return this.crossDomainEvent ? fromCrossDomainEvent(crossDomainEvent.clone(), null) : new com.google.maps.MapMoveEvent(this.type, this.latLng, this.bubbles, this.cancelable);
        }

        public override function toString():String
        {
            return "[MapMoveEvent type=" + this.type + " latLng=" + this.latLng + " bubbles=" + this.bubbles + " cancellable=" + this.cancelable + "]";
        }

        public static function fromCrossDomainEvent(arg1:flash.events.Event, arg2:Object):com.google.maps.MapMoveEvent
        {
            var loc1:*;
            loc1 = null;
            loc1 = arg1 as com.google.maps.MapMoveEvent;
            if (loc1 != null)
            {
                return loc1;
            }
            loc1 = new MapMoveEvent(arg1.type, com.google.maps.LatLng.fromObject(Object(arg1).latLng), arg1.bubbles, arg1.cancelable);
            loc1.copyEventData(arg1, arg2);
            return loc1;
        }

        public static const MOVE_START:String="mapevent_movestart";

        public static const MOVE_STEP:String="mapevent_movestep";

        public static const MOVE_END:String="mapevent_moveend";

        private var eventLatLng:com.google.maps.LatLng;
    }
}
