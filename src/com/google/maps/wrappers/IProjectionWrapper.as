package com.google.maps.wrappers 
{
    import com.google.maps.*;
    import com.google.maps.interfaces.*;
    import flash.geom.*;
    
    public class IProjectionWrapper extends com.google.maps.wrappers.WrapperBase implements com.google.maps.interfaces.IProjection
    {
        public function IProjectionWrapper()
        {
            super();
            return;
        }

        public function tileCheckRange(arg1:flash.geom.Point, arg2:Number, arg3:Number):Boolean
        {
            com.google.maps.wrappers.Wrapper.checkValid(this.instance);
            return this.instance.tileCheckRange(arg1, arg2, arg3);
        }

        public override function get interfaceChain():Array
        {
            return ["IProjection"];
        }

        public function fromPixelToLatLng(arg1:flash.geom.Point, arg2:Number, arg3:Boolean=false):com.google.maps.LatLng
        {
            com.google.maps.wrappers.Wrapper.checkValid(this.instance);
            return com.google.maps.wrappers.Wrapper.instance().wrapLatLng(this.instance.fromPixelToLatLng(arg1, arg2, arg3));
        }

        public function fromLatLngToPixel(arg1:com.google.maps.LatLng, arg2:Number):flash.geom.Point
        {
            com.google.maps.wrappers.Wrapper.checkValid(this.instance);
            return this.instance.fromLatLngToPixel(this.extWrapper.wrapLatLng(arg1), arg2);
        }

        public function getWrapWidth(arg1:Number):Number
        {
            com.google.maps.wrappers.Wrapper.checkValid(this.instance);
            return this.instance.getWrapWidth(arg1);
        }
    }
}
