package com.google.maps.wrappers 
{
    import flash.events.*;
    
    public class SpriteWrapperEventDispatcher extends com.google.maps.wrappers.WrapperBase implements flash.events.IEventDispatcher
    {
        public function SpriteWrapperEventDispatcher()
        {
            super();
            return;
        }

        public function dispatchEvent(arg1:flash.events.Event):Boolean
        {
            return dispatchMethod(arg1);
        }

        public function willTrigger(arg1:String):Boolean
        {
            return willTriggerMethod(arg1);
        }

        public function removeEventListener(arg1:String, arg2:Function, arg3:Boolean=false):void
        {
            removeListenerMethod(arg1, arg2, arg3);
            return;
        }

        public function addEventListener(arg1:String, arg2:Function, arg3:Boolean=false, arg4:int=0, arg5:Boolean=false):void
        {
            addListenerMethod(arg1, arg2, arg3, arg4, arg5);
            return;
        }

        public function hasEventListener(arg1:String):Boolean
        {
            return hasListenerMethod(arg1);
        }

        public var willTriggerMethod:Function;

        public var removeListenerMethod:Function;

        public var hasListenerMethod:Function;

        public var addListenerMethod:Function;

        public var dispatchMethod:Function;
    }
}
