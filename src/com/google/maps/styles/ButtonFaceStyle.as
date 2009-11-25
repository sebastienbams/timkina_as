package com.google.maps.styles 
{
    import com.google.maps.wrappers.*;
    import flash.text.*;
    
    public class ButtonFaceStyle extends com.google.maps.styles.BevelStyle
    {
        public function ButtonFaceStyle(arg1:Object=null)
        {
            _labelFormat = null;
            super(null);
            if (arg1 != null)
            {
                copyFromObject(arg1);
            }
            return;
        }

        public function get labelFormat():flash.text.TextFormat
        {
            return this._labelFormat;
        }

        public override function toString():String
        {
            return "ButtonFaceStyle: { " + "\n\t" + super.toString() + "\n\tlabelFormat: " + this._labelFormat + " } ";
        }

        public function set labelFormat(arg1:flash.text.TextFormat):void
        {
            this._labelFormat = arg1;
            return;
        }

        public override function copyFromObject(arg1:Object):void
        {
            super.copyFromObject(arg1);
            if (arg1.labelFormat != null)
            {
                if (this.labelFormat == null)
                {
                    this.labelFormat = new flash.text.TextFormat();
                }
                com.google.maps.wrappers.Wrapper.copyTextFormatProperties(this.labelFormat, arg1.labelFormat);
            }
            return;
        }

        public static function fromObject(arg1:Object):com.google.maps.styles.ButtonFaceStyle
        {
            var loc1:*;
            loc1 = null;
            if (arg1 == null)
            {
                return null;
            }
            loc1 = new ButtonFaceStyle();
            loc1.copyFromObject(arg1);
            return loc1;
        }

        public static function mergeStyles(arg1:Array):com.google.maps.styles.ButtonFaceStyle
        {
            return com.google.maps.wrappers.Wrapper.mergeStyles(com.google.maps.styles.ButtonFaceStyle, arg1) as com.google.maps.styles.ButtonFaceStyle;
        }

        private var _labelFormat:flash.text.TextFormat=null;
    }
}
