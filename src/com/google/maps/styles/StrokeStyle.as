package com.google.maps.styles 
{
    import com.google.maps.wrappers.*;
    
    public class StrokeStyle extends Object
    {
        public function StrokeStyle(arg1:Object=null)
        {
            super();
            if (arg1 != null)
            {
                copyFromObject(arg1);
            }
            return;
        }

        public function get color():Object
        {
            return this._color;
        }

        public function get alpha():Object
        {
            return this._alpha;
        }

        public function set color(arg1:Object):void
        {
            this._color = arg1 as Number;
            return;
        }

        public function toString():String
        {
            return "StrokeStyle: { thickness: " + this._thickness + ", color: " + this._color + ", alpha: " + this._alpha + "} ";
        }

        public function copyFromObject(arg1:Object):void
        {
            com.google.maps.wrappers.Wrapper.copyProperties(this, arg1, ["thickness", "color", "alpha"], Number);
            return;
        }

        public function get thickness():Object
        {
            return this._thickness;
        }

        public function set thickness(arg1:Object):void
        {
            this._thickness = arg1 as Number;
            return;
        }

        public function set alpha(arg1:Object):void
        {
            this._alpha = arg1 as Number;
            return;
        }

        public static function fromObject(arg1:Object):com.google.maps.styles.StrokeStyle
        {
            var loc1:*;
            loc1 = null;
            if (arg1 == null)
            {
                return null;
            }
            loc1 = new StrokeStyle();
            com.google.maps.wrappers.Wrapper.copyProperties(loc1, arg1, ["thickness", "color", "alpha"], Number);
            return loc1;
        }

        public static function mergeStyles(arg1:Array):com.google.maps.styles.StrokeStyle
        {
            return com.google.maps.wrappers.Wrapper.mergeStyles(com.google.maps.styles.StrokeStyle, arg1) as com.google.maps.styles.StrokeStyle;
        }

        private var _color:Object;

        private var _thickness:Object;

        private var _alpha:Object;
    }
}
