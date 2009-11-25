package com.google.maps.controls 
{
    import com.google.maps.styles.*;
    import com.google.maps.wrappers.*;
    import flash.geom.*;
    
    public class PositionControlOptions extends Object
    {
        public function PositionControlOptions(arg1:Object=null)
        {
            super();
            if (arg1 != null)
            {
                this.copyFromObject(arg1);
            }
            return;
        }

        public function set buttonSpacing(arg1:flash.geom.Point):void
        {
            this._buttonSpacing = arg1;
            return;
        }

        public function copyFromObject(arg1:Object):void
        {
            com.google.maps.wrappers.Wrapper.copyProperties(this, arg1, ["buttonSize", "buttonSpacing"], flash.geom.Point);
            if (arg1.buttonStyle != null)
            {
                if (this.buttonStyle == null)
                {
                    this.buttonStyle = new com.google.maps.styles.ButtonStyle();
                }
                this.buttonStyle.copyFromObject(arg1.buttonStyle);
            }
            return;
        }

        public function set buttonSize(arg1:flash.geom.Point):void
        {
            this._buttonSize = arg1;
            return;
        }

        public function toString():String
        {
            return "PositionControlOptions:\n\t{ buttonSize: " + this._buttonSize + "\n\t  buttonStyle: " + this._buttonStyle + "\n\t  buttonSpacing: " + this._buttonSpacing + " }";
        }

        public function get buttonSpacing():flash.geom.Point
        {
            return this._buttonSpacing;
        }

        public function get buttonSize():flash.geom.Point
        {
            return this._buttonSize;
        }

        public function set buttonStyle(arg1:com.google.maps.styles.ButtonStyle):void
        {
            this._buttonStyle = arg1;
            return;
        }

        public function get buttonStyle():com.google.maps.styles.ButtonStyle
        {
            return this._buttonStyle;
        }

        public static function merge(arg1:Array):com.google.maps.controls.PositionControlOptions
        {
            return com.google.maps.wrappers.Wrapper.mergeStyles(com.google.maps.controls.PositionControlOptions, arg1) as com.google.maps.controls.PositionControlOptions;
        }

        public static function fromObject(arg1:Object):com.google.maps.controls.PositionControlOptions
        {
            var loc1:*;
            loc1 = null;
            if (arg1 == null)
            {
                return null;
            }
            loc1 = new PositionControlOptions();
            loc1.copyFromObject(arg1);
            return loc1;
        }

        private var _buttonStyle:com.google.maps.styles.ButtonStyle;

        private var _buttonSize:flash.geom.Point;

        private var _buttonSpacing:flash.geom.Point;
    }
}
