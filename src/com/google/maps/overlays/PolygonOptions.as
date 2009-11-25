package com.google.maps.overlays 
{
    import com.google.maps.*;
    import com.google.maps.styles.*;
    import com.google.maps.wrappers.*;
    
    public class PolygonOptions extends Object
    {
        public function PolygonOptions(arg1:Object=null)
        {
            super();
            if (arg1 != null)
            {
                this.copyFromObject(arg1);
            }
            return;
        }

        public function copyFromObject(arg1:Object):void
        {
            if (arg1.strokeStyle != null)
            {
                if (this.strokeStyle == null)
                {
                    this.strokeStyle = new com.google.maps.styles.StrokeStyle();
                }
                this.strokeStyle.copyFromObject(arg1.strokeStyle);
            }
            if (arg1.fillStyle != null)
            {
                if (this.fillStyle == null)
                {
                    this.fillStyle = new com.google.maps.styles.FillStyle();
                }
                this.fillStyle.copyFromObject(arg1.fillStyle);
            }
            return;
        }

        public function toString():String
        {
            return "PolygonOptions: { strokeStyle: " + this.strokeStyle + " fillStyle: " + this.fillStyle + "}";
        }

        public static function merge(arg1:Array):com.google.maps.overlays.PolygonOptions
        {
            return com.google.maps.wrappers.Wrapper.mergeStyles(com.google.maps.overlays.PolygonOptions, arg1) as com.google.maps.overlays.PolygonOptions;
        }

        public static function fromObject(arg1:Object):com.google.maps.overlays.PolygonOptions
        {
            var loc1:*;
            loc1 = null;
            if (arg1 == null)
            {
                return null;
            }
            loc1 = new PolygonOptions();
            loc1.copyFromObject(arg1);
            return loc1;
        }

        public static function getDefaultOptions():com.google.maps.overlays.PolygonOptions
        {
            var loc1:*;
            loc1 = null;
            loc1 = com.google.maps.ClientBootstrap.getInstance();
            return loc1.getMapsFactory().getDefaultPolygonOptions();
        }

        public static function setDefaultOptions(arg1:com.google.maps.overlays.PolygonOptions):void
        {
            var loc1:*;
            loc1 = null;
            loc1 = com.google.maps.ClientBootstrap.getInstance();
            loc1.getMapsFactory().setDefaultPolygonOptions(arg1);
            return;
        }

        public var strokeStyle:com.google.maps.styles.StrokeStyle;

        public var fillStyle:com.google.maps.styles.FillStyle;
    }
}
