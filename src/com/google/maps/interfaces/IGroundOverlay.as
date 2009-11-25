package com.google.maps.interfaces 
{
    import com.google.maps.overlays.*;
    
    public interface IGroundOverlay extends com.google.maps.interfaces.IOverlay
    {
        function setOptions(arg1:com.google.maps.overlays.GroundOverlayOptions):void;

        function getOptions():com.google.maps.overlays.GroundOverlayOptions;
    }
}
