package com.google.maps.styles 
{
    import com.google.maps.wrappers.*;
    
    public class BevelStyle extends com.google.maps.styles.RectangleStyle
    {
        public function BevelStyle(arg1:Object=null)
        {
            _highlightColor = null;
            _shadowColor = null;
            _bevelAlpha = null;
            _bevelStyle = null;
            _bevelThickness = null;
            super();
            if (arg1 != null)
            {
                copyFromObject(arg1);
            }
            return;
        }

        public function get bevelAlpha():Object
        {
            return this._bevelAlpha;
        }

        public function set shadowColor(arg1:Object):void
        {
            if (arg1 == null)
            {
                this._shadowColor = null;
            }
            else 
            {
                this._shadowColor = arg1 as Number;
            }
            return;
        }

        public function get highlightColor():Object
        {
            return this._highlightColor;
        }

        public function get bevelStyle():Object
        {
            return this._bevelStyle;
        }

        public function get bevelThickness():Object
        {
            return this._bevelThickness;
        }

        public function set highlightColor(arg1:Object):void
        {
            if (arg1 == null)
            {
                this._highlightColor = null;
            }
            else 
            {
                this._highlightColor = arg1 as Number;
            }
            return;
        }

        public function set bevelAlpha(arg1:Object):void
        {
            if (arg1 == null)
            {
                this._bevelAlpha = null;
            }
            else 
            {
                this._bevelAlpha = arg1 as Number;
            }
            return;
        }

        public override function copyFromObject(arg1:Object):void
        {
            super.copyFromObject(arg1);
            com.google.maps.wrappers.Wrapper.copyProperties(this, arg1, ["bevelStyle", "highlightColor", "shadowColor", "bevelAlpha", "bevelThickness"], Number);
            return;
        }

        public function get shadowColor():Object
        {
            return this._shadowColor;
        }

        public override function toString():String
        {
            return "BevelStyle: { " + "\n\t" + super.toString() + "\n\tbevelStyle: " + this._bevelStyle + "\n\tbevelThickness: " + this._bevelThickness + "\n\thighlightColor: " + this._highlightColor + "\n\tshadowColor: " + this._shadowColor + "\n\tbevelAlpha: " + this._bevelAlpha + " } ";
        }

        public function set bevelThickness(arg1:Object):void
        {
            if (arg1 == null)
            {
                this._bevelThickness = null;
            }
            else 
            {
                this._bevelThickness = arg1 as Number;
            }
            return;
        }

        public function set bevelStyle(arg1:Object):void
        {
            if (arg1 == null)
            {
                this._bevelStyle = null;
            }
            else 
            {
                this._bevelStyle = arg1 as Number;
            }
            return;
        }

        public static function fromObject(arg1:Object):com.google.maps.styles.BevelStyle
        {
            var loc1:*;
            loc1 = null;
            if (arg1 == null)
            {
                return null;
            }
            loc1 = new BevelStyle();
            loc1.copyFromObject(arg1);
            return loc1;
        }

        public static function mergeStyles(arg1:Array):com.google.maps.styles.BevelStyle
        {
            return com.google.maps.wrappers.Wrapper.mergeStyles(com.google.maps.styles.BevelStyle, arg1) as com.google.maps.styles.BevelStyle;
        }

        public static const BEVEL_NONE:Number=0;

        public static const BEVEL_LOWERED:Number=2;

        public static const BEVEL_RAISED:Number=1;

        private var _bevelAlpha:Object=null;

        private var _shadowColor:Object=null;

        private var _highlightColor:Object=null;

        private var _bevelStyle:Object=null;

        private var _bevelThickness:Object=null;
    }
}
