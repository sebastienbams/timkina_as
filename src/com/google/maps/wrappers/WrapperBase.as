package com.google.maps.wrappers 
{
    import com.google.maps.interfaces.*;
    
    public class WrapperBase extends Object implements com.google.maps.interfaces.IWrappable
    {
        public function WrapperBase()
        {
            super();
            return;
        }

        function initializeWrapper(arg1:Object, arg2:Object):void
        {
            this.instance = arg1;
            this.extWrapper = arg2;
            return;
        }

        public function set wrapper(arg1:Object):void
        {
            return;
        }

        public function get interfaceChain():Array
        {
            return null;
        }

        public function get wrapper():Object
        {
            return this.instance;
        }

        protected var extWrapper:Object;

        protected var instance:Object;
    }
}
