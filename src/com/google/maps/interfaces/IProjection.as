package com.google.maps.interfaces 
{
    import com.google.maps.*;
    import flash.geom.*;
    
    public interface IProjection extends com.google.maps.interfaces.IWrappable
    {
        function getWrapWidth(arg1:Number):Number;

        function tileCheckRange(arg1:flash.geom.Point, arg2:Number, arg3:Number):Boolean;

        function fromLatLngToPixel(arg1:com.google.maps.LatLng, arg2:Number):flash.geom.Point;

        function fromPixelToLatLng(arg1:flash.geom.Point, arg2:Number, arg3:Boolean=false):com.google.maps.LatLng;
    }
}
