package com.google.maps.wrappers 
{
    import com.google.maps.*;
    import com.google.maps.interfaces.*;
    import flash.geom.*;
    
    public class IMapTypeWrapper extends com.google.maps.wrappers.EventDispatcherWrapper implements com.google.maps.interfaces.IMapType
    {
        public function IMapTypeWrapper()
        {
            super();
            return;
        }

        public function getCopyrights(arg1:com.google.maps.LatLngBounds, arg2:Number):Array
        {
            com.google.maps.wrappers.Wrapper.checkValid(this.instance);
            return com.google.maps.wrappers.Wrapper.instance().wrapCopyrightNoticeArray(this.instance.getCopyrights(this.extWrapper.wrapLatLngBounds(arg1), arg2));
        }

        public override function get interfaceChain():Array
        {
            return ["IMapType"];
        }

        public function getName(arg1:Boolean=false):String
        {
            com.google.maps.wrappers.Wrapper.checkValid(this.instance);
            return this.instance.getName(arg1);
        }

        public function getSpanZoomLevel(arg1:com.google.maps.LatLng, arg2:com.google.maps.LatLng, arg3:flash.geom.Point):Number
        {
            com.google.maps.wrappers.Wrapper.checkValid(this.instance);
            return this.instance.getSpanZoomLevel(this.extWrapper.wrapLatLng(arg1), this.extWrapper.wrapLatLng(arg2), arg3);
        }

        public function getTextColor():Number
        {
            com.google.maps.wrappers.Wrapper.checkValid(this.instance);
            return this.instance.getTextColor();
        }

        public function getMinimumResolution(arg1:com.google.maps.LatLng=null):Number
        {
            com.google.maps.wrappers.Wrapper.checkValid(this.instance);
            return this.instance.getMinimumResolution(this.extWrapper.wrapLatLng(arg1));
        }

        public function getTileLayers():Array
        {
            com.google.maps.wrappers.Wrapper.checkValid(this.instance);
            return com.google.maps.wrappers.Wrapper.instance().wrapITileLayerArray(this.instance.getTileLayers());
        }

        public function getRadius():Number
        {
            com.google.maps.wrappers.Wrapper.checkValid(this.instance);
            return this.instance.getRadius();
        }

        public function getMaximumResolution(arg1:com.google.maps.LatLng=null):Number
        {
            com.google.maps.wrappers.Wrapper.checkValid(this.instance);
            return this.instance.getMaximumResolution(this.extWrapper.wrapLatLng(arg1));
        }

        public function getBoundsZoomLevel(arg1:com.google.maps.LatLngBounds, arg2:flash.geom.Point):Number
        {
            com.google.maps.wrappers.Wrapper.checkValid(this.instance);
            return this.instance.getBoundsZoomLevel(this.extWrapper.wrapLatLngBounds(arg1), arg2);
        }

        public function getProjection():com.google.maps.interfaces.IProjection
        {
            com.google.maps.wrappers.Wrapper.checkValid(this.instance);
            return com.google.maps.wrappers.Wrapper.instance().wrapIProjection(this.instance.getProjection());
        }

        public function getLinkColor():Number
        {
            com.google.maps.wrappers.Wrapper.checkValid(this.instance);
            return this.instance.getLinkColor();
        }

        public function getErrorMessage():String
        {
            com.google.maps.wrappers.Wrapper.checkValid(this.instance);
            return this.instance.getErrorMessage();
        }

        public function getTileSize():Number
        {
            com.google.maps.wrappers.Wrapper.checkValid(this.instance);
            return this.instance.getTileSize();
        }

        public function setMaxResolutionOverride(arg1:Number):void
        {
            com.google.maps.wrappers.Wrapper.checkValid(this.instance);
            this.instance.setMaxResolutionOverride(arg1);
            return;
        }

        public function getMaxResolutionOverride():Number
        {
            com.google.maps.wrappers.Wrapper.checkValid(this.instance);
            return this.instance.getMaxResolutionOverride();
        }

        public function getUrlArg():String
        {
            com.google.maps.wrappers.Wrapper.checkValid(this.instance);
            return this.instance.getUrlArg();
        }

        public function getAlt():String
        {
            com.google.maps.wrappers.Wrapper.checkValid(this.instance);
            return this.instance.getAlt();
        }
    }
}
