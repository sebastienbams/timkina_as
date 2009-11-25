package com.google.maps.wrappers 
{
    import com.google.maps.*;
    import com.google.maps.interfaces.*;
    
    public class ICopyrightCollectionWrapper extends com.google.maps.wrappers.EventDispatcherWrapper implements com.google.maps.interfaces.ICopyrightCollection
    {
        public function ICopyrightCollectionWrapper()
        {
            super();
            return;
        }

        public function getCopyrightsAtLatLng(arg1:com.google.maps.LatLng):Array
        {
            com.google.maps.wrappers.Wrapper.checkValid(this.instance);
            return com.google.maps.wrappers.Wrapper.instance().wrapCopyrightArray(this.instance.getCopyrightsAtLatLng(this.extWrapper.wrapLatLng(arg1)));
        }

        public override function get interfaceChain():Array
        {
            return ["ICopyrightCollection"];
        }

        public function getCopyrights(arg1:com.google.maps.LatLngBounds, arg2:Number):Array
        {
            com.google.maps.wrappers.Wrapper.checkValid(this.instance);
            return this.instance.getCopyrights(this.extWrapper.wrapLatLngBounds(arg1), arg2);
        }

        public function getCopyrightNotice(arg1:com.google.maps.LatLngBounds, arg2:Number):com.google.maps.CopyrightNotice
        {
            com.google.maps.wrappers.Wrapper.checkValid(this.instance);
            return com.google.maps.wrappers.Wrapper.instance().wrapCopyrightNotice(this.instance.getCopyrightNotice(this.extWrapper.wrapLatLngBounds(arg1), arg2));
        }

        public function addCopyright(arg1:com.google.maps.Copyright):Boolean
        {
            com.google.maps.wrappers.Wrapper.checkValid(this.instance);
            return this.instance.addCopyright(this.extWrapper.wrapCopyright(arg1));
        }
    }
}
