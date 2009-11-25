package com.google.maps 
{
    import com.google.maps.interfaces.*;
    import com.google.maps.wrappers.*;
    
    public class MapType extends com.google.maps.wrappers.IMapTypeWrapper implements com.google.maps.interfaces.IMapType
    {
        public function MapType(arg1:Array, arg2:com.google.maps.interfaces.IProjection, arg3:String, arg4:com.google.maps.MapTypeOptions=null)
        {
            var loc1:*;
            loc1 = null;
            var loc2:*;
            loc2 = null;
            super();
            loc2 = (loc1 = com.google.maps.ClientBootstrap.getInstance()).getMapsFactory();
            com.google.maps.wrappers.Wrapper.instance().wrap(loc2.createMapType(arg1, arg2, arg3, arg4), this, com.google.maps.interfaces.IMapType, com.google.maps.MapType);
            return;
        }

        public static function get HYBRID_MAP_TYPE():com.google.maps.interfaces.IMapType
        {
            return getDefaultMapType(com.google.maps.Constants.HYBRID_MAP_TYPE_NAME);
        }

        public static function get SATELLITE_MAP_TYPE():com.google.maps.interfaces.IMapType
        {
            return getDefaultMapType(com.google.maps.Constants.SATELLITE_MAP_TYPE_NAME);
        }

        public static function get PHYSICAL_MAP_TYPE():com.google.maps.interfaces.IMapType
        {
            return getDefaultMapType(com.google.maps.Constants.PHYSICAL_MAP_TYPE_NAME);
        }

        public static function get DEFAULT_MAP_TYPES():Array
        {
            var loc1:*;
            loc1 = null;
            var loc2:*;
            loc2 = null;
            loc1 = com.google.maps.ClientBootstrap.getInstance();
            loc2 = loc1.getMapsFactory();
            return com.google.maps.wrappers.Wrapper.instance().wrapIMapTypeArray(loc2.getDefaultMapTypes());
        }

        private static function getDefaultMapType(arg1:String):com.google.maps.interfaces.IMapType
        {
            var loc1:*;
            loc1 = null;
            var loc2:*;
            loc2 = null;
            loc1 = com.google.maps.ClientBootstrap.getInstance();
            loc2 = loc1.getMapsFactory();
            return com.google.maps.wrappers.Wrapper.instance().wrapIMapType(loc2.getDefaultMapType(arg1));
        }

        public static function get NORMAL_MAP_TYPE():com.google.maps.interfaces.IMapType
        {
            return getDefaultMapType(com.google.maps.Constants.NORMAL_MAP_TYPE_NAME);
        }
    }
}
