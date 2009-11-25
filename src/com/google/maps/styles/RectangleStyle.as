package com.google.maps.styles 
{
    import com.google.maps.wrappers.*;
    
    public class RectangleStyle extends Object
    {
        public function RectangleStyle(arg1:Object=null)
        {
            _fillStyle = null;
            _strokeStyle = null;
            super();
            if (arg1 != null)
            {
                copyFromObject(arg1);
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
            return "RectangleStyle: { " + "\n\tfillStyle: " + this._fillStyle + "\n\tstrokeStyle: " + this._strokeStyle + " } ";
        }

        public function get fillStyle():com.google.maps.styles.FillStyle
        {
            return this._fillStyle;
        }

        public function set strokeStyle(arg1:com.google.maps.styles.StrokeStyle):void
        {
            this._strokeStyle = arg1;
            return;
        }

        public function get strokeStyle():com.google.maps.styles.StrokeStyle
        {
            return this._strokeStyle;
        }

        public function set fillStyle(arg1:com.google.maps.styles.FillStyle):void
        {
            this._fillStyle = arg1;
            return;
        }

        public static function fromObject(arg1:Object):com.google.maps.styles.RectangleStyle
        {
            var loc1:*;
            loc1 = null;
            if (arg1 == null)
            {
                return null;
            }
            loc1 = new RectangleStyle();
            loc1.copyFromObject(arg1);
            return loc1;
        }

        public static function mergeStyles(arg1:Array):com.google.maps.styles.RectangleStyle
        {
            return com.google.maps.wrappers.Wrapper.mergeStyles(com.google.maps.styles.RectangleStyle, arg1) as com.google.maps.styles.RectangleStyle;
        }

        private var _fillStyle:com.google.maps.styles.FillStyle=null;

        private var _strokeStyle:com.google.maps.styles.StrokeStyle=null;
    }
}
