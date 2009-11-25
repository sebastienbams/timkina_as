package com.google.maps 
{
    import com.google.maps.interfaces.*;
    import com.google.maps.wrappers.*;
    import flash.events.*;
    
    public class MapEvent extends flash.events.Event
    {
        public function MapEvent(arg1:String, arg2:Object, arg3:Boolean=false, arg4:Boolean=false)
        {
            super(arg1, arg3, arg4);
            this.eventFeature = arg2;
            return;
        }

        public override function isDefaultPrevented():Boolean
        {
            return this.crossDomainEvent ? this.crossDomainEvent.isDefaultPrevented() : super.isDefaultPrevented();
        }

        public override function get eventPhase():uint
        {
            return this.crossDomainEvent ? this.crossDomainEvent.eventPhase : super.eventPhase;
        }

        public override function formatToString(arg1:String, ... rest):String
        {
            return this.crossDomainEvent ? this.crossDomainEvent.formatToString(arg1, rest) : super.formatToString(arg1, rest);
        }

        public override function preventDefault():void
        {
            if (this.crossDomainEvent)
            {
                this.crossDomainEvent.preventDefault();
            }
            else 
            {
                super.preventDefault();
            }
            return;
        }

        public override function get target():Object
        {
            return this.localTarget ? this.localTarget : super.target;
        }

        public override function get cancelable():Boolean
        {
            return this.crossDomainEvent ? this.crossDomainEvent.cancelable : super.cancelable;
        }

        public override function clone():flash.events.Event
        {
            return this.crossDomainEvent ? fromCrossDomainEvent(crossDomainEvent.clone(), null) : new com.google.maps.MapEvent(this.type, this.feature, this.bubbles, this.cancelable);
        }

        public function get eventClassChain():Array
        {
            return ["MapEvent"];
        }

        public override function get bubbles():Boolean
        {
            return this.crossDomainEvent ? this.crossDomainEvent.bubbles : super.bubbles;
        }

        public override function stopPropagation():void
        {
            if (this.crossDomainEvent)
            {
                this.crossDomainEvent.stopPropagation();
            }
            else 
            {
                super.stopPropagation();
            }
            return;
        }

        public override function toString():String
        {
            return "[MapEvent type=" + this.type + " feature=" + this.feature + " bubbles=" + this.bubbles + " cancellable=" + this.cancelable + "]";
        }

        protected function copyEventData(arg1:flash.events.Event, arg2:Object):void
        {
            this.crossDomainEvent = arg1;
            this.localTarget = arg2;
            return;
        }

        public override function get currentTarget():Object
        {
            return this.crossDomainEvent ? this.crossDomainEvent.currentTarget : super.currentTarget;
        }

        public function get feature():Object
        {
            return this.eventFeature;
        }

        public override function get type():String
        {
            return this.crossDomainEvent ? this.crossDomainEvent.type : super.type;
        }

        public override function stopImmediatePropagation():void
        {
            if (this.crossDomainEvent)
            {
                this.crossDomainEvent.stopImmediatePropagation();
            }
            else 
            {
                super.stopImmediatePropagation();
            }
            return;
        }

        protected static function wrapFeature(arg1:Object):Object
        {
            return arg1 == null ? null : com.google.maps.wrappers.Wrapper.instance().wrap(arg1, null, com.google.maps.interfaces.IWrappable, Object);
        }

        public static function fromCrossDomainEvent(arg1:flash.events.Event, arg2:Object):com.google.maps.MapEvent
        {
            var loc1:*;
            loc1 = null;
            loc1 = arg1 as com.google.maps.MapEvent;
            if (loc1 != null)
            {
                return loc1;
            }
            loc1 = new MapEvent(arg1.type, wrapFeature(getEventFeature(arg1)), arg1.bubbles, arg1.cancelable);
            loc1.copyEventData(arg1, arg2);
            return loc1;
        }

        public static function getEventFeature(arg1:flash.events.Event):Object
        {
            return Object(arg1).feature;
        }

        public static const MAP_READY:String="mapevent_mapready";

        public static const OVERLAY_CHANGED:String="mapevent_overlaychanged";

        public static const MAPTYPE_CHANGED:String="maptypechanged";

        public static const OVERLAY_ADDED:String="mapevent_overlayadded";

        public static const SIZE_CHANGED:String="mapevent_sizechanged";

        public static const MAPTYPE_ADDED:String="mapevent_maptypeadded";

        public static const MAP_READY_INTERNAL:String="readyinternal";

        public static const CONTROL_ADDED:String="mapevent_controladded";

        public static const VISIBILITY_CHANGED:String="mapevent_visibilitychanged";

        public static const COPYRIGHTS_UPDATED:String="mapevent_copyrightsupdated";

        public static const INFOWINDOW_OPENED:String="mapevent_infowindowopened";

        public static const INFOWINDOW_CLOSED:String="mapevent_infowindowclosed";

        public static const OVERLAY_REMOVED:String="mapevent_overlayremoved";

        public static const INFOWINDOW_CLOSING:String="mapevent_infowindowclosing";

        public static const MAPTYPE_REMOVED:String="mapevent_maptyperemoved";

        public static const OVERLAY_ANIMATE_END:String="mapevent_overlayanimateend";

        public static const CONTROL_REMOVED:String="mapevent_controlremoved";

        protected var crossDomainEvent:flash.events.Event;

        private var localTarget:Object;

        private var eventFeature:Object;
    }
}
