package com.google.maps.styles 
{
    import com.google.maps.wrappers.*;
    
    public class FillStyle extends Object
    {
        public function FillStyle(arg1:Object=null)
        {
            super();
            if (arg1 != null)
            {
                copyFromObject(arg1);
            }
            return;
        }

        public function set gradient(arg1:com.google.maps.styles.GradientStyle):void
        {
            this._gradient = arg1;
            return;
        }

        public function get color():Object
        {
            return this._color;
        }

        public function set color(arg1:Object):void
        {
            this._color = arg1 as Number;
            if (this._color != null)
            {
                this._gradient = null;
            }
            return;
        }

        public function copyFromObject(arg1:Object):void
        {
            com.google.maps.wrappers.Wrapper.copyProperties(this, arg1, ["color", "alpha"], Number);
            if (arg1.gradient != null)
            {
                this.gradient = com.google.maps.styles.GradientStyle.fromObject(arg1.gradient);
            }
            return;
        }

        public function toString():String
        {
            return "FillStyle: { color: " + this._color + ", alpha: " + this._alpha + ", gradient: " + this._gradient + "} ";
        }

        public function get alpha():Object
        {
            return this._alpha;
        }

        public function get gradient():com.google.maps.styles.GradientStyle
        {
            return this._gradient;
        }

        public function set alpha(arg1:Object):void
        {
            this._alpha = arg1 as Number;
            if (this._alpha != null)
            {
                this._gradient = null;
            }
            return;
        }

        public static function fromObject(arg1:Object):com.google.maps.styles.FillStyle
        {
            var loc1:*;
            loc1 = null;
            if (arg1 == null)
            {
                return null;
            }
            loc1 = new FillStyle();
            loc1.copyFromObject(arg1);
            return loc1;
        }

        public static function mergeStyles(arg1:Array):com.google.maps.styles.FillStyle
        {
            return com.google.maps.wrappers.Wrapper.mergeStyles(com.google.maps.styles.FillStyle, arg1) as com.google.maps.styles.FillStyle;
        }

        private var _color:Object;

        private var _gradient:com.google.maps.styles.GradientStyle;

        private var _alpha:Object;
    }
}
