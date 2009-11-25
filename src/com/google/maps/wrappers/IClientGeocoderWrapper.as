package com.google.maps.wrappers 
{
    import com.google.maps.*;
    import com.google.maps.interfaces.*;
    
    public class IClientGeocoderWrapper extends com.google.maps.wrappers.EventDispatcherWrapper implements com.google.maps.interfaces.IClientGeocoder
    {
        public function IClientGeocoderWrapper()
        {
            super();
            return;
        }

        public function geocode(arg1:String):void
        {
            com.google.maps.wrappers.Wrapper.checkValid(this.instance);
            this.instance.geocode(arg1);
            return;
        }

        public override function get interfaceChain():Array
        {
            return ["IClientGeocoder"];
        }

        public function setBaseCountryCode(arg1:String):void
        {
            com.google.maps.wrappers.Wrapper.checkValid(this.instance);
            this.instance.setBaseCountryCode(arg1);
            return;
        }

        public function getViewport():com.google.maps.LatLngBounds
        {
            com.google.maps.wrappers.Wrapper.checkValid(this.instance);
            return com.google.maps.wrappers.Wrapper.instance().wrapLatLngBounds(this.instance.getViewport());
        }

        public function setViewport(arg1:com.google.maps.LatLngBounds):void
        {
            com.google.maps.wrappers.Wrapper.checkValid(this.instance);
            this.instance.setViewport(this.extWrapper.wrapLatLngBounds(arg1));
            return;
        }

        public function resetCache():void
        {
            com.google.maps.wrappers.Wrapper.checkValid(this.instance);
            this.instance.resetCache();
            return;
        }

        public function getBaseCountryCode():String
        {
            com.google.maps.wrappers.Wrapper.checkValid(this.instance);
            return this.instance.getBaseCountryCode();
        }
    }
}
