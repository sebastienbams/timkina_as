package com.google.maps.interfaces 
{
    import com.google.maps.*;
    import com.google.maps.overlays.*;
    
    public interface IMarker extends com.google.maps.interfaces.IOverlay
    {
        function setOptions(arg1:com.google.maps.overlays.MarkerOptions):void;

        function getLatLng():com.google.maps.LatLng;

        function setLatLng(arg1:com.google.maps.LatLng):void;

        function openInfoWindow(arg1:com.google.maps.InfoWindowOptions=null):com.google.maps.interfaces.IInfoWindow;

        function getOptions():com.google.maps.overlays.MarkerOptions;

        function closeInfoWindow():void;
    }
}
