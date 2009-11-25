package com.google.maps.wrappers 
{
    import com.google.maps.interfaces.*;
    import flash.geom.*;
    
    public class IOverviewMapControlWrapper extends com.google.maps.wrappers.IControlWrapper implements com.google.maps.interfaces.IOverviewMapControl
    {
        public function IOverviewMapControlWrapper()
        {
            super();
            return;
        }

        public override function get interfaceChain():Array
        {
            return ["IOverviewMapControl", "IControl"];
        }

        public function setSize(arg1:flash.geom.Point):void
        {
            com.google.maps.wrappers.Wrapper.checkValid(this.instance);
            this.instance.setSize(arg1);
            return;
        }
    }
}
