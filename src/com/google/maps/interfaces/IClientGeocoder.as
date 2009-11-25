package com.google.maps.interfaces 
{
    import com.google.maps.*;
    import flash.events.*;
    
    public interface IClientGeocoder extends com.google.maps.interfaces.IWrappable, flash.events.IEventDispatcher
    {
        function getViewport():com.google.maps.LatLngBounds;

        function getBaseCountryCode():String;

        function setViewport(arg1:com.google.maps.LatLngBounds):void;

        function setBaseCountryCode(arg1:String):void;

        function resetCache():void;

        function geocode(arg1:String):void;
    }
}
