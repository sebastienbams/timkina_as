package com.google.maps.interfaces 
{
    import com.google.maps.*;
    import com.google.maps.overlays.*;
    
    public interface IPolygon extends com.google.maps.interfaces.IOverlay
    {
        function getOuterVertex(arg1:Number):com.google.maps.LatLng;

        function getInnerVertexCount(arg1:Number):Number;

        function getOuterVertexCount():Number;

        function setOptions(arg1:com.google.maps.overlays.PolygonOptions):void;

        function getInnerVertex(arg1:Number, arg2:Number):com.google.maps.LatLng;

        function getOptions():com.google.maps.overlays.PolygonOptions;

        function getInnerPolylineCount():Number;
    }
}
