package com.google.maps.wrappers 
{
    import com.google.maps.interfaces.*;
    
    public class IPositionControlWrapper extends com.google.maps.wrappers.IControlWrapper implements com.google.maps.interfaces.IPositionControl
    {
        public function IPositionControlWrapper()
        {
            super();
            return;
        }

        public override function get interfaceChain():Array
        {
            return ["IPositionControl", "IControl"];
        }
    }
}
