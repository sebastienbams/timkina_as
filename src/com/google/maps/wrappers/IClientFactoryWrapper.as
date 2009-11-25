package com.google.maps.wrappers 
{
    import com.google.maps.interfaces.*;
    import flash.text.*;
    
    public class IClientFactoryWrapper extends com.google.maps.wrappers.WrapperBase implements com.google.maps.interfaces.IClientFactory
    {
        public function IClientFactoryWrapper()
        {
            super();
            return;
        }

        public override function get interfaceChain():Array
        {
            return ["IClientFactory"];
        }

        public function createTextField():flash.text.TextField
        {
            com.google.maps.wrappers.Wrapper.checkValid(this.instance);
            return com.google.maps.wrappers.Wrapper.instance().wrapTextField(this.instance.createTextField());
        }

        public function getSwcVersion():String
        {
            com.google.maps.wrappers.Wrapper.checkValid(this.instance);
            return this.instance.getSwcVersion();
        }
    }
}
