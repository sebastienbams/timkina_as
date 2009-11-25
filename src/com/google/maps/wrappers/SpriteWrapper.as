package com.google.maps.wrappers 
{
    import com.google.maps.*;
    import com.google.maps.interfaces.*;
    import flash.display.*;
    import flash.events.*;
    
    public class SpriteWrapper extends flash.display.Sprite implements com.google.maps.interfaces.IWrappable
    {
        public function SpriteWrapper()
        {
            super();
            wrappedListenerCache = new com.google.maps.wrappers.WrappedListenerCache(this);
            return;
        }

        function initializeWrapper(arg1:Object, arg2:Object):void
        {
            this.instance = arg1;
            this.extWrapper = arg2;
            return;
        }

        public function get interfaceChain():Array
        {
            return null;
        }

        public function set wrapper(arg1:Object):void
        {
            return;
        }

        protected function onObjectReady():void
        {
            return;
        }

        public override function removeEventListener(arg1:String, arg2:Function, arg3:Boolean=false):void
        {
            wrappedListenerCache.removeListener(super.removeEventListener, arg1, arg2, arg3);
            return;
        }

        public override function addEventListener(arg1:String, arg2:Function, arg3:Boolean=false, arg4:int=0, arg5:Boolean=false):void
        {
            wrappedListenerCache.addListener(super.addEventListener, arg1, arg2, arg3, arg4, arg5);
            return;
        }

        protected function isReady():Boolean
        {
            return this.isObjectReady;
        }

        private function getBaseEventDispatcher():flash.events.IEventDispatcher
        {
            var loc1:*;
            loc1 = null;
            loc1 = new com.google.maps.wrappers.SpriteWrapperEventDispatcher();
            loc1.addListenerMethod = super.addEventListener;
            loc1.removeListenerMethod = super.removeEventListener;
            loc1.willTriggerMethod = super.willTrigger;
            loc1.hasListenerMethod = super.hasEventListener;
            loc1.dispatchMethod = super.dispatchEvent;
            return loc1;
        }

        public function get wrapper():Object
        {
            return this.instance;
        }

        protected function instantiateCrossDomainObject(arg1:Class, arg2:Class, arg3:String, arg4:Object=null):void
        {
            var loc1:*;
            loc1 = null;
            this.interfaceClass = arg1;
            this.wrapperClass = arg2;
            this.createMethodName = arg3;
            this.initOptions = arg4;
            if (!(loc1 = com.google.maps.ClientBootstrap.getInstance()).isReady())
            {
                loc1.addEventListener(com.google.maps.ClientBootstrap.BOOTSTRAP_READY, this.completeInstantiation);
                return;
            }
            this.completeInstantiation();
            return;
        }

        private function completeInstantiation(arg1:flash.events.Event=null):void
        {
            var loc1:*;
            loc1 = null;
            var loc2:*;
            loc2 = null;
            loc1 = com.google.maps.ClientBootstrap.getInstance();
            loc2 = loc1.getMapsFactory()[createMethodName];
            com.google.maps.wrappers.Wrapper.instance().wrap(this.initOptions == null ? loc2(this, this.getBaseEventDispatcher()) : loc2(this, this.getBaseEventDispatcher(), this.initOptions), this, interfaceClass, wrapperClass);
            isObjectReady = true;
            onObjectReady();
            return;
        }

        private var isObjectReady:Boolean;

        protected var extWrapper:Object;

        private var createMethodName:String;

        private var initOptions:Object;

        protected var instance:Object;

        private var wrappedListenerCache:com.google.maps.wrappers.WrappedListenerCache;

        private var wrapperClass:Class;

        private var interfaceClass:Class;
    }
}
