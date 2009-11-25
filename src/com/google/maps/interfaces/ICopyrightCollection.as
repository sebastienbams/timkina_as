package com.google.maps.interfaces 
{
    import com.google.maps.*;
    import flash.events.*;
    
    public interface ICopyrightCollection extends com.google.maps.interfaces.IWrappable, flash.events.IEventDispatcher
    {
        function getCopyrights(arg1:com.google.maps.LatLngBounds, arg2:Number):Array;

        function getCopyrightNotice(arg1:com.google.maps.LatLngBounds, arg2:Number):com.google.maps.CopyrightNotice;

        function addCopyright(arg1:com.google.maps.Copyright):Boolean;

        function getCopyrightsAtLatLng(arg1:com.google.maps.LatLng):Array;
    }
}
