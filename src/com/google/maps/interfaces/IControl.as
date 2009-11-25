package com.google.maps.interfaces 
{
    import com.google.maps.controls.*;
    import flash.display.*;
    import flash.events.*;
    import flash.geom.*;
    
    public interface IControl extends flash.events.IEventDispatcher, com.google.maps.interfaces.IWrappable
    {
        function setControlPosition(arg1:com.google.maps.controls.ControlPosition):void;

        function initControlWithMap(arg1:com.google.maps.interfaces.IMap):void;

        function getDisplayObject():flash.display.DisplayObject;

        function getControlPosition():com.google.maps.controls.ControlPosition;

        function getSize():flash.geom.Point;
    }
}
