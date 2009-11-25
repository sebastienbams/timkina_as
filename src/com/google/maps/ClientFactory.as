package com.google.maps 
{
    import com.google.maps.interfaces.*;
    import flash.text.*;
    
    public class ClientFactory extends Object implements com.google.maps.interfaces.IClientFactory
    {
        public function ClientFactory()
        {
            super();
            return;
        }

        public function set wrapper(arg1:Object):void
        {
            this._wrapper = arg1;
            return;
        }

        public function getSwcVersion():String
        {
            return com.google.maps.Release.version;
        }

        public function createTextField():flash.text.TextField
        {
            return new flash.text.TextField();
        }

        public function get wrapper():Object
        {
            return this._wrapper;
        }

        public function get interfaceChain():Array
        {
            return ["IClientFactory"];
        }

        private var _wrapper:Object;
    }
}
