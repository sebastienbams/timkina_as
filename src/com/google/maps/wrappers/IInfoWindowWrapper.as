package com.google.maps.wrappers 
{
    import com.google.maps.interfaces.*;
    
    public class IInfoWindowWrapper extends com.google.maps.wrappers.IOverlayWrapper implements com.google.maps.interfaces.IInfoWindow
    {
        public function IInfoWindowWrapper()
        {
            super();
            return;
        }

        public override function get interfaceChain():Array
        {
            return ["IInfoWindow", "IOverlay"];
        }

        public function get removed():Boolean
        {
            com.google.maps.wrappers.Wrapper.checkValid(this.instance);
            return this.instance.removed;
        }
    }
}
