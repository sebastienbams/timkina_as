package com.google.maps.interfaces 
{
    import com.google.maps.*;
    import com.google.maps.controls.*;
    import flash.display.*;
    import flash.events.*;
    import flash.geom.*;
    
    public interface IMap extends flash.events.IEventDispatcher, com.google.maps.interfaces.IWrappable
    {
        function scrollWheelZoomEnabled():Boolean;

        function setSize(arg1:flash.geom.Point):void;

        function disableContinuousZoom():void;

        function setMapType(arg1:com.google.maps.interfaces.IMapType):void;

        function monitorCopyright(arg1:com.google.maps.interfaces.IMap):void;

        function fromPointToLatLng(arg1:flash.geom.Point, arg2:Number=NaN, arg3:Boolean=false):com.google.maps.LatLng;

        function clearOverlays():void;

        function removeMapType(arg1:com.google.maps.interfaces.IMapType):void;

        function draggingEnabled():Boolean;

        function getBoundsZoomLevel(arg1:com.google.maps.LatLngBounds):Number;

        function registerOverlayOnPane(arg1:Number, arg2:com.google.maps.interfaces.IOverlay):flash.display.Sprite;

        function getImplementationVersion():String;

        function openInfoWindow(arg1:com.google.maps.LatLng, arg2:com.google.maps.InfoWindowOptions=null):com.google.maps.interfaces.IInfoWindow;

        function removeOverlay(arg1:com.google.maps.interfaces.IOverlay):void;

        function getMinZoomLevel(arg1:com.google.maps.interfaces.IMapType=null, arg2:com.google.maps.LatLng=null):Number;

        function removeControl(arg1:com.google.maps.interfaces.IControl):void;

        function getProjection():com.google.maps.interfaces.IProjection;

        function savePosition():void;

        function getZoom():Number;

        function getCenter():com.google.maps.LatLng;

        function loadResourceString(arg1:String):String;

        function isLoaded():Boolean;

        function getLatLngBounds():com.google.maps.LatLngBounds;

        function returnToSavedPosition():void;

        function addMapType(arg1:com.google.maps.interfaces.IMapType):void;

        function placeControl(arg1:com.google.maps.interfaces.IControl, arg2:com.google.maps.controls.ControlPosition):void;

        function setCenter(arg1:com.google.maps.LatLng, arg2:Number=NaN, arg3:com.google.maps.interfaces.IMapType=null):void;

        function zoomIn(arg1:com.google.maps.LatLng=null, arg2:Boolean=false, arg3:Boolean=false):void;

        function panBy(arg1:flash.geom.Point):void;

        function setZoom(arg1:Number):void;

        function closeInfoWindow():Boolean;

        function disableDragging():void;

        function continuousZoomEnabled():Boolean;

        function fromViewPortPointToLatLng(arg1:flash.geom.Point, arg2:Boolean=false):com.google.maps.LatLng;

        function getMaxZoomLevel(arg1:com.google.maps.interfaces.IMapType=null, arg2:com.google.maps.LatLng=null):Number;

        function enableContinuousZoom():void;

        function displayHint(arg1:String):void;

        function getDisplayObject():flash.display.DisplayObject;

        function fromLatLngToPoint(arg1:com.google.maps.LatLng, arg2:Number=NaN):flash.geom.Point;

        function get MERCATOR_PROJECTION():com.google.maps.interfaces.IProjection;

        function enableDragging():void;

        function getMapTypes():Array;

        function addOverlay(arg1:com.google.maps.interfaces.IOverlay):void;

        function getSize():flash.geom.Point;

        function panTo(arg1:com.google.maps.LatLng):void;

        function disableScrollWheelZoom():void;

        function getCurrentMapType():com.google.maps.interfaces.IMapType;

        function zoomOut(arg1:com.google.maps.LatLng=null, arg2:Boolean=false):void;

        function addControl(arg1:com.google.maps.interfaces.IControl):void;

        function enableScrollWheelZoom():void;
    }
}
