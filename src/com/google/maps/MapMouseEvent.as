package com.google.maps 
{
    import flash.events.*;
    
    public class MapMouseEvent extends com.google.maps.MapEvent
    {
        public function MapMouseEvent(arg1:String, arg2:Object, arg3:com.google.maps.LatLng, arg4:Boolean=false, arg5:Boolean=false)
        {
            super(arg1, arg2, arg4, arg5);
            this.eventLatLng = arg3;
            return;
        }

        public function get latLng():com.google.maps.LatLng
        {
            return this.eventLatLng;
        }

        public override function get eventClassChain():Array
        {
            return ["MapMouseEvent", "MapEvent"];
        }

        public override function clone():flash.events.Event
        {
            return this.crossDomainEvent ? fromCrossDomainEvent(crossDomainEvent.clone(), null) : new com.google.maps.MapMouseEvent(this.type, this.feature, this.latLng, this.bubbles, this.cancelable);
        }

        public override function toString():String
        {
            return "[MapMouseEvent type=" + this.type + " feature=" + this.feature + " latLng=" + this.latLng + " bubbles=" + this.bubbles + " cancellable=" + this.cancelable + "]";
        }

        public static function fromCrossDomainEvent(arg1:flash.events.Event, arg2:Object):com.google.maps.MapMouseEvent
        {
            var loc1:*;
            loc1 = null;
            loc1 = arg1 as com.google.maps.MapMouseEvent;
            if (loc1 != null)
            {
                return loc1;
            }
            loc1 = new MapMouseEvent(arg1.type, wrapFeature(Object(arg1).feature), com.google.maps.LatLng.fromObject(Object(arg1).latLng), arg1.bubbles, arg1.cancelable);
            loc1.copyEventData(arg1, arg2);
            return loc1;
        }

        public static const MOUSE_UP:String="mapevent_mouseup";

        public static const CLICK:String="mapevent_click";

        public static const MOUSE_MOVE:String="mapevent_mousemove";

        public static const ROLL_OUT:String="mapevent_rollout";

        public static const DRAG_START:String="mapevent_dragstart";

        public static const DOUBLE_CLICK:String="mapevent_doubleclick";

        public static const MOUSE_DOWN:String="mapevent_mousedown";

        public static const ROLL_OVER:String="mapevent_rollover";

        public static const DRAG_STEP:String="mapevent_dragstep";

        public static const DRAG_END:String="mapevent_dragend";

        private var eventLatLng:com.google.maps.LatLng;
    }
}
