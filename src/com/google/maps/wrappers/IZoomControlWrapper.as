package com.google.maps.wrappers 
{
    import com.google.maps.interfaces.*;
    
    public class IZoomControlWrapper extends com.google.maps.wrappers.IControlWrapper implements com.google.maps.interfaces.IZoomControl
    {
        public function IZoomControlWrapper()
        {
            super();
            return;
        }

        public override function get interfaceChain():Array
        {
            return ["IZoomControl", "IControl"];
        }
    }
}
