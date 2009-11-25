package com.google.maps.wrappers 
{
    import com.google.maps.*;
    import com.google.maps.interfaces.*;
    import com.google.maps.overlays.*;
    
    public class IMarkerWrapper extends com.google.maps.wrappers.IOverlayWrapper implements com.google.maps.interfaces.IMarker
    {
        public function IMarkerWrapper()
        {
            super();
            return;
        }

        public override function get interfaceChain():Array
        {
            return ["IMarker", "IOverlay"];
        }

        public function closeInfoWindow():void
        {
            com.google.maps.wrappers.Wrapper.checkValid(this.instance);
            this.instance.closeInfoWindow();
            return;
        }

        public function setOptions(arg1:com.google.maps.overlays.MarkerOptions):void
        {
            com.google.maps.wrappers.Wrapper.checkValid(this.instance);
            this.instance.setOptions(this.extWrapper.wrapMarkerOptions(arg1));
            return;
        }

        public function setLatLng(arg1:com.google.maps.LatLng):void
        {
            com.google.maps.wrappers.Wrapper.checkValid(this.instance);
            this.instance.setLatLng(this.extWrapper.wrapLatLng(arg1));
            return;
        }

        public function openInfoWindow(arg1:com.google.maps.InfoWindowOptions=null):com.google.maps.interfaces.IInfoWindow
        {
            com.google.maps.wrappers.Wrapper.checkValid(this.instance);
            return com.google.maps.wrappers.Wrapper.instance().wrapIInfoWindow(this.instance.openInfoWindow(this.extWrapper.wrapInfoWindowOptions(arg1)));
        }

        public function getOptions():com.google.maps.overlays.MarkerOptions
        {
            com.google.maps.wrappers.Wrapper.checkValid(this.instance);
            return com.google.maps.wrappers.Wrapper.instance().wrapMarkerOptions(this.instance.getOptions());
        }

        public function getLatLng():com.google.maps.LatLng
        {
            com.google.maps.wrappers.Wrapper.checkValid(this.instance);
            return com.google.maps.wrappers.Wrapper.instance().wrapLatLng(this.instance.getLatLng());
        }
    }
}
