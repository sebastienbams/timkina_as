package com.google.maps.interfaces 
{
    import flash.events.*;
    
    public interface IOverlay extends flash.events.IEventDispatcher, com.google.maps.interfaces.IWrappable
    {
        function hide():void;

        function remove():void;

        function initialize(arg1:com.google.maps.interfaces.IMap, arg2:Number=NaN):void;

        function redraw(arg1:Boolean):void;

        function isHidden():Boolean;

        function show():void;
    }
}
