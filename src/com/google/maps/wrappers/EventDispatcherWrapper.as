package com.google.maps.wrappers 
{
    import flash.events.*;
    
    public class EventDispatcherWrapper extends com.google.maps.wrappers.WrapperBase implements flash.events.IEventDispatcher
    {
        public function EventDispatcherWrapper()
        {
            super();
            wrappedListenerCache = new com.google.maps.wrappers.WrappedListenerCache(this);
            return;
        }

        public function dispatchEvent(arg1:flash.events.Event):Boolean
        {
            return this.instance.dispatchEvent(arg1);
        }

        public function willTrigger(arg1:String):Boolean
        {
            return this.instance.willTrigger(arg1);
        }

        public function addEventListener(arg1:String, arg2:Function, arg3:Boolean=false, arg4:int=0, arg5:Boolean=false):void
        {
            wrappedListenerCache.addListener(this.instance.addEventListener, arg1, arg2, arg3, arg4, arg5);
            return;
        }

        public function removeEventListener(arg1:String, arg2:Function, arg3:Boolean=false):void
        {
            wrappedListenerCache.removeListener(this.instance.removeEventListener, arg1, arg2, arg3);
            return;
        }

        public function hasEventListener(arg1:String):Boolean
        {
            return this.instance.hasEventListener(arg1);
        }

        private var wrappedListenerCache:com.google.maps.wrappers.WrappedListenerCache;
    }
}
