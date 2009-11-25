package com.google.maps.interfaces 
{
    import flash.display.*;
    import flash.geom.*;
    
    public interface ITileLayer extends com.google.maps.interfaces.IWrappable
    {
        function getMapType():com.google.maps.interfaces.IMapType;

        function getMinResolution():Number;

        function getAlpha():Number;

        function loadTile(arg1:flash.geom.Point, arg2:Number):flash.display.DisplayObject;

        function getCopyrightCollection():com.google.maps.interfaces.ICopyrightCollection;

        function getMaxResolution():Number;

        function setMapType(arg1:com.google.maps.interfaces.IMapType):void;
    }
}
