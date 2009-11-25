package com.google.maps.controls 
{
    import com.google.maps.styles.*;
    import com.google.maps.wrappers.*;
    import flash.geom.*;
    
    public class OverviewMapControlOptions extends Object
    {
        public function OverviewMapControlOptions(arg1:Object=null)
        {
            super();
            if (arg1 != null)
            {
                this.copyFromObject(arg1);
            }
            return;
        }

        public function set size(arg1:flash.geom.Point):void
        {
            if (arg1 == null)
            {
                this._size = null;
            }
            else 
            {
                this._size = new flash.geom.Point(arg1.x, arg1.y);
            }
            return;
        }

        public function get size():flash.geom.Point
        {
            return this._size;
        }

        public function set padding(arg1:flash.geom.Point):void
        {
            if (arg1 == null)
            {
                this._padding = null;
            }
            else 
            {
                this._padding = new flash.geom.Point(arg1.x, arg1.y);
            }
            return;
        }

        public function toString():String
        {
            return "OverviewMapControlOptions: {" + "\n\tcontrolStyle: " + this.controlStyle + "\n\tsize: " + this.size + "\n\tpadding: " + this.padding + "\n\tnavigatorStyle: " + this.navigatorStyle + " }";
        }

        public function get padding():flash.geom.Point
        {
            return this._padding;
        }

        public function get controlStyle():com.google.maps.styles.BevelStyle
        {
            return this._controlStyle;
        }

        public function set controlStyle(arg1:com.google.maps.styles.BevelStyle):void
        {
            this._controlStyle = arg1;
            return;
        }

        public function set navigatorStyle(arg1:com.google.maps.styles.RectangleStyle):void
        {
            this._navigatorStyle = arg1;
            return;
        }

        public function get navigatorStyle():com.google.maps.styles.RectangleStyle
        {
            return this._navigatorStyle;
        }

        public function copyFromObject(arg1:Object):void
        {
            if (arg1.size != null)
            {
                this.size = new flash.geom.Point(arg1.size.x, arg1.size.y);
            }
            if (arg1.padding != null)
            {
                this.padding = new flash.geom.Point(arg1.padding.x, arg1.padding.y);
            }
            if (arg1.controlStyle != null)
            {
                if (this.controlStyle == null)
                {
                    this.controlStyle = new com.google.maps.styles.BevelStyle();
                }
                this.controlStyle.copyFromObject(arg1.controlStyle);
            }
            if (arg1.navigatorStyle != null)
            {
                if (this.navigatorStyle == null)
                {
                    this.navigatorStyle = new com.google.maps.styles.RectangleStyle();
                }
                this.navigatorStyle.copyFromObject(arg1.navigatorStyle);
            }
            return;
        }

        public static function merge(arg1:Array):com.google.maps.controls.OverviewMapControlOptions
        {
            return com.google.maps.wrappers.Wrapper.mergeStyles(com.google.maps.controls.OverviewMapControlOptions, arg1) as com.google.maps.controls.OverviewMapControlOptions;
        }

        public static function fromObject(arg1:Object):com.google.maps.controls.OverviewMapControlOptions
        {
            var loc1:*;
            loc1 = null;
            if (arg1 == null)
            {
                return null;
            }
            loc1 = new OverviewMapControlOptions();
            loc1.copyFromObject(arg1);
            return loc1;
        }

        private var _size:flash.geom.Point;

        private var _padding:flash.geom.Point;

        private var _controlStyle:com.google.maps.styles.BevelStyle;

        private var _navigatorStyle:com.google.maps.styles.RectangleStyle;
    }
}
