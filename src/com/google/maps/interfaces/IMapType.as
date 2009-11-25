package com.google.maps.interfaces 
{
    import com.google.maps.*;
    import flash.events.*;
    import flash.geom.*;
    
    public interface IMapType extends com.google.maps.interfaces.IWrappable, flash.events.IEventDispatcher
    {
        function getCopyrights(arg1:com.google.maps.LatLngBounds, arg2:Number):Array;

        function getProjection():com.google.maps.interfaces.IProjection;

        function getTileSize():Number;

        function getTileLayers():Array;

        function getRadius():Number;

        function getName(arg1:Boolean=false):String;

        function getSpanZoomLevel(arg1:com.google.maps.LatLng, arg2:com.google.maps.LatLng, arg3:flash.geom.Point):Number;

        function getLinkColor():Number;

        function getErrorMessage():String;

        function getTextColor():Number;

        function getUrlArg():String;

        function getBoundsZoomLevel(arg1:com.google.maps.LatLngBounds, arg2:flash.geom.Point):Number;

        function setMaxResolutionOverride(arg1:Number):void;

        function getMinimumResolution(arg1:com.google.maps.LatLng=null):Number;

        function getMaxResolutionOverride():Number;

        function getAlt():String;

        function getMaximumResolution(arg1:com.google.maps.LatLng=null):Number;
    }
}
