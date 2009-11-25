package com.google.maps.interfaces 
{
    import com.google.maps.*;
    import com.google.maps.overlays.*;
    
    public interface IPolyline extends com.google.maps.interfaces.IOverlay
    {
        function getLength(arg1:Number=6378137):Number;

        function setOptions(arg1:com.google.maps.overlays.PolylineOptions):void;

        function getOptions():com.google.maps.overlays.PolylineOptions;

        function getVertexCount():Number;

        function getVertex(arg1:Number):com.google.maps.LatLng;
    }
}
