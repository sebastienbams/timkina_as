package com.google.maps.wrappers 
{
    import com.google.maps.interfaces.*;
    import flash.display.*;
    import flash.geom.*;
    
    public class ITileLayerWrapper extends com.google.maps.wrappers.WrapperBase implements com.google.maps.interfaces.ITileLayer
    {
        public function ITileLayerWrapper()
        {
            super();
            return;
        }

        public function setMapType(arg1:com.google.maps.interfaces.IMapType):void
        {
            com.google.maps.wrappers.Wrapper.checkValid(this.instance);
            this.instance.setMapType(this.extWrapper.wrapIMapType(arg1));
            return;
        }

        public override function get interfaceChain():Array
        {
            return ["ITileLayer"];
        }

        public function getCopyrightCollection():com.google.maps.interfaces.ICopyrightCollection
        {
            com.google.maps.wrappers.Wrapper.checkValid(this.instance);
            return com.google.maps.wrappers.Wrapper.instance().wrapICopyrightCollection(this.instance.getCopyrightCollection());
        }

        public function getMapType():com.google.maps.interfaces.IMapType
        {
            com.google.maps.wrappers.Wrapper.checkValid(this.instance);
            return com.google.maps.wrappers.Wrapper.instance().wrapIMapType(this.instance.getMapType());
        }

        public function getMinResolution():Number
        {
            com.google.maps.wrappers.Wrapper.checkValid(this.instance);
            return this.instance.getMinResolution();
        }

        public function getAlpha():Number
        {
            com.google.maps.wrappers.Wrapper.checkValid(this.instance);
            return this.instance.getAlpha();
        }

        public function loadTile(arg1:flash.geom.Point, arg2:Number):flash.display.DisplayObject
        {
            com.google.maps.wrappers.Wrapper.checkValid(this.instance);
            return this.instance.loadTile(arg1, arg2);
        }

        public function getMaxResolution():Number
        {
            com.google.maps.wrappers.Wrapper.checkValid(this.instance);
            return this.instance.getMaxResolution();
        }
    }
}
