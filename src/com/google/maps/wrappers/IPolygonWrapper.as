package com.google.maps.wrappers 
{
    import com.google.maps.*;
    import com.google.maps.interfaces.*;
    import com.google.maps.overlays.*;
    
    public class IPolygonWrapper extends com.google.maps.wrappers.IOverlayWrapper implements com.google.maps.interfaces.IPolygon
    {
        public function IPolygonWrapper()
        {
            super();
            return;
        }

        public override function get interfaceChain():Array
        {
            return ["IPolygon", "IOverlay"];
        }

        public function getInnerVertexCount(arg1:Number):Number
        {
            com.google.maps.wrappers.Wrapper.checkValid(this.instance);
            return this.instance.getInnerVertexCount(arg1);
        }

        public function getOuterVertex(arg1:Number):com.google.maps.LatLng
        {
            com.google.maps.wrappers.Wrapper.checkValid(this.instance);
            return com.google.maps.wrappers.Wrapper.instance().wrapLatLng(this.instance.getOuterVertex(arg1));
        }

        public function setOptions(arg1:com.google.maps.overlays.PolygonOptions):void
        {
            com.google.maps.wrappers.Wrapper.checkValid(this.instance);
            this.instance.setOptions(this.extWrapper.wrapPolygonOptions(arg1));
            return;
        }

        public function getOuterVertexCount():Number
        {
            com.google.maps.wrappers.Wrapper.checkValid(this.instance);
            return this.instance.getOuterVertexCount();
        }

        public function getOptions():com.google.maps.overlays.PolygonOptions
        {
            com.google.maps.wrappers.Wrapper.checkValid(this.instance);
            return com.google.maps.wrappers.Wrapper.instance().wrapPolygonOptions(this.instance.getOptions());
        }

        public function getInnerPolylineCount():Number
        {
            com.google.maps.wrappers.Wrapper.checkValid(this.instance);
            return this.instance.getInnerPolylineCount();
        }

        public function getInnerVertex(arg1:Number, arg2:Number):com.google.maps.LatLng
        {
            com.google.maps.wrappers.Wrapper.checkValid(this.instance);
            return com.google.maps.wrappers.Wrapper.instance().wrapLatLng(this.instance.getInnerVertex(arg1, arg2));
        }
    }
}
