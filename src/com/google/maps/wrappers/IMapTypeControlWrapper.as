package com.google.maps.wrappers 
{
    import com.google.maps.interfaces.*;
    
    public class IMapTypeControlWrapper extends com.google.maps.wrappers.IControlWrapper implements com.google.maps.interfaces.IMapTypeControl
    {
        public function IMapTypeControlWrapper()
        {
            super();
            return;
        }

        public override function get interfaceChain():Array
        {
            return ["IMapTypeControl", "IControl"];
        }
    }
}
