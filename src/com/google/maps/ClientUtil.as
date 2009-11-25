package com.google.maps 
{
    import flash.display.*;
    
    internal class ClientUtil extends Object
    {
        public function ClientUtil()
        {
            super();
            return;
        }

        public static function getFlashVar(arg1:flash.display.LoaderInfo, arg2:String):String
        {
            var loc1:*;
            loc1 = null;
            var loc2:*;
            loc2 = null;
            loc1 = arg1.parameters;
            loc2 = null;
            if (loc1 == null)
            {
                return null;
            }
            return loc1[arg2] as String;
        }
    }
}
