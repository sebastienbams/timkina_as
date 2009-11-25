package com.google.maps.wrappers 
{
    import com.google.maps.interfaces.*;
    import com.google.maps.overlays.*;
    
    public class IGroundOverlayWrapper extends com.google.maps.wrappers.IOverlayWrapper implements com.google.maps.interfaces.IGroundOverlay
    {
        public function IGroundOverlayWrapper()
        {
            super();
            return;
        }

        public override function get interfaceChain():Array
        {
            return ["IGroundOverlay", "IOverlay"];
        }

        public function setOptions(arg1:com.google.maps.overlays.GroundOverlayOptions):void
        {
            com.google.maps.wrappers.Wrapper.checkValid(this.instance);
            this.instance.setOptions(this.extWrapper.wrapGroundOverlayOptions(arg1));
            return;
        }

        public function getOptions():com.google.maps.overlays.GroundOverlayOptions
        {
            com.google.maps.wrappers.Wrapper.checkValid(this.instance);
            return com.google.maps.wrappers.Wrapper.instance().wrapGroundOverlayOptions(this.instance.getOptions());
        }
    }
}
