package com.google.maps.wrappers 
{
    import com.google.maps.*;
    import com.google.maps.interfaces.*;
    import com.google.maps.overlays.*;
    
    public class IPolylineWrapper extends com.google.maps.wrappers.IOverlayWrapper implements com.google.maps.interfaces.IPolyline
    {
        public function IPolylineWrapper()
        {
            super();
            return;
        }

        public override function get interfaceChain():Array
        {
            return ["IPolyline", "IOverlay"];
        }

        public function getVertexCount():Number
        {
            com.google.maps.wrappers.Wrapper.checkValid(this.instance);
            return this.instance.getVertexCount();
        }

        public function getVertex(arg1:Number):com.google.maps.LatLng
        {
            com.google.maps.wrappers.Wrapper.checkValid(this.instance);
            return com.google.maps.wrappers.Wrapper.instance().wrapLatLng(this.instance.getVertex(arg1));
        }

        public function getOptions():com.google.maps.overlays.PolylineOptions
        {
            com.google.maps.wrappers.Wrapper.checkValid(this.instance);
            return com.google.maps.wrappers.Wrapper.instance().wrapPolylineOptions(this.instance.getOptions());
        }

        public function getLength(arg1:Number=6378137):Number
        {
            com.google.maps.wrappers.Wrapper.checkValid(this.instance);
            return this.instance.getLength(arg1);
        }

        public function setOptions(arg1:com.google.maps.overlays.PolylineOptions):void
        {
            com.google.maps.wrappers.Wrapper.checkValid(this.instance);
            this.instance.setOptions(this.extWrapper.wrapPolylineOptions(arg1));
            return;
        }
    }
}
