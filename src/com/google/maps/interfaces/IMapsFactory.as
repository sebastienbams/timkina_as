package com.google.maps.interfaces 
{
    import com.google.maps.*;
    import com.google.maps.controls.*;
    import com.google.maps.overlays.*;
    import flash.display.*;
    import flash.events.*;
    
    public interface IMapsFactory extends com.google.maps.interfaces.IWrappable
    {
        function createMap(arg1:flash.display.Sprite, arg2:flash.events.IEventDispatcher):Object;

        function setDefaultGroundOverlayOptions(arg1:com.google.maps.overlays.GroundOverlayOptions):void;

        function setDefaultMarkerOptions(arg1:com.google.maps.overlays.MarkerOptions):void;

        function createPolygonFromEncoded(arg1:Array, arg2:com.google.maps.overlays.PolygonOptions=null):Object;

        function setDefaultInfoWindowOptions(arg1:com.google.maps.InfoWindowOptions):void;

        function createOverviewMapControl(arg1:flash.display.Sprite, arg2:flash.events.IEventDispatcher, arg3:com.google.maps.controls.OverviewMapControlOptions=null):Object;

        function createPolylineFromEncoded(arg1:String, arg2:Number, arg3:String, arg4:Number, arg5:com.google.maps.overlays.PolylineOptions=null):Object;

        function createPositionControl(arg1:flash.display.Sprite, arg2:flash.events.IEventDispatcher, arg3:com.google.maps.controls.PositionControlOptions=null):Object;

        function createMapType(arg1:Array, arg2:com.google.maps.interfaces.IProjection, arg3:String, arg4:com.google.maps.MapTypeOptions=null):Object;

        function createPolyline(arg1:Array, arg2:com.google.maps.overlays.PolylineOptions=null):Object;

        function createMarker(arg1:com.google.maps.LatLng, arg2:com.google.maps.overlays.MarkerOptions=null):Object;

        function createPolygon(arg1:Array, arg2:com.google.maps.overlays.PolygonOptions=null):Object;

        function getDefaultGroundOverlayOptions():com.google.maps.overlays.GroundOverlayOptions;

        function createMapTypeControl(arg1:flash.display.Sprite, arg2:flash.events.IEventDispatcher, arg3:com.google.maps.controls.MapTypeControlOptions=null):Object;

        function setDefaultMapTypeOptions(arg1:com.google.maps.MapTypeOptions):void;

        function createCopyrightCollection(arg1:String=null):Object;

        function setDefaultPolygonOptions(arg1:com.google.maps.overlays.PolygonOptions):void;

        function getDefaultMapType(arg1:String):Object;

        function getDefaultMapTypesList():Object;

        function createZoomControl(arg1:flash.display.Sprite, arg2:flash.events.IEventDispatcher, arg3:com.google.maps.controls.ZoomControlOptions=null):Object;

        function getDefaultPolygonOptions():com.google.maps.overlays.PolygonOptions;

        function getDefaultMapTypeOptions():com.google.maps.MapTypeOptions;

        function createGroundOverlay(arg1:flash.display.DisplayObject, arg2:com.google.maps.LatLngBounds, arg3:com.google.maps.overlays.GroundOverlayOptions=null):Object;

        function getDefaultInfoWindowOptions():com.google.maps.InfoWindowOptions;

        function getDefaultMarkerOptions():com.google.maps.overlays.MarkerOptions;

        function getDefaultPolylineOptions():com.google.maps.overlays.PolylineOptions;

        function createClientGeocoder(arg1:String=null, arg2:com.google.maps.LatLngBounds=null):Object;

        function setDefaultPolylineOptions(arg1:com.google.maps.overlays.PolylineOptions):void;
    }
}
