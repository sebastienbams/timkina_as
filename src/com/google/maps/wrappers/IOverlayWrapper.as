package com.google.maps.wrappers 
{
    import com.google.maps.interfaces.*;
    
    public class IOverlayWrapper extends com.google.maps.wrappers.EventDispatcherWrapper implements com.google.maps.interfaces.IOverlay
    {
        public function IOverlayWrapper()
        {
            super();
            return;
        }

        public function hide():void
        {
            com.google.maps.wrappers.Wrapper.checkValid(this.instance);
            this.instance.hide();
            return;
        }

        public function isHidden():Boolean
        {
            com.google.maps.wrappers.Wrapper.checkValid(this.instance);
            return this.instance.isHidden();
        }

        public function remove():void
        {
            com.google.maps.wrappers.Wrapper.checkValid(this.instance);
            this.instance.remove();
            return;
        }

        public override function get interfaceChain():Array
        {
            return ["IOverlay"];
        }

        public function initialize(arg1:com.google.maps.interfaces.IMap, arg2:Number=NaN):void
        {
            com.google.maps.wrappers.Wrapper.checkValid(this.instance);
            this.instance.initialize(this.extWrapper.wrapIMap(arg1), arg2);
            return;
        }

        public function redraw(arg1:Boolean):void
        {
            com.google.maps.wrappers.Wrapper.checkValid(this.instance);
            this.instance.redraw(arg1);
            return;
        }

        public function show():void
        {
            com.google.maps.wrappers.Wrapper.checkValid(this.instance);
            this.instance.show();
            return;
        }
    }
}
