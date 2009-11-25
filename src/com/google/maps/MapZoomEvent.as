package com.google.maps 
{
    import flash.events.*;
    
    public class MapZoomEvent extends com.google.maps.MapEvent
    {
        public function MapZoomEvent(arg1:String, arg2:Number, arg3:Boolean=false, arg4:Boolean=false)
        {
            super(arg1, null, arg3, arg4);
            this.eventZoomLevel = arg2;
            return;
        }

        public override function clone():flash.events.Event
        {
            return this.crossDomainEvent ? fromCrossDomainEvent(crossDomainEvent.clone(), null) : new com.google.maps.MapZoomEvent(this.type, this.zoomLevel, this.bubbles, this.cancelable);
        }

        public override function get eventClassChain():Array
        {
            return ["MapZoomEvent", "MapEvent"];
        }

        public function get zoomLevel():Number
        {
            return this.eventZoomLevel;
        }

        public override function toString():String
        {
            return "[MapZoomEvent type=" + this.type + " zoomLevel=" + this.zoomLevel + " bubbles=" + this.bubbles + " cancellable=" + this.cancelable + "]";
        }

        public static function fromCrossDomainEvent(arg1:flash.events.Event, arg2:Object):com.google.maps.MapZoomEvent
        {
            var loc1:*;
            loc1 = null;
            loc1 = arg1 as com.google.maps.MapZoomEvent;
            if (loc1 != null)
            {
                return loc1;
            }
            loc1 = new MapZoomEvent(arg1.type, Object(arg1).zoomLevel, arg1.bubbles, arg1.cancelable);
            loc1.copyEventData(arg1, arg2);
            return loc1;
        }

        public static const ZOOM_RANGE_CHANGED:String="mapevent_zoomrangechanged";

        public static const ZOOM_STEP:String="mapevent_zoomstep";

        public static const ZOOM_START:String="mapevent_zoomstart";

        public static const ZOOM_END:String="mapevent_zoomend";

        private var eventZoomLevel:Number;
    }
}
