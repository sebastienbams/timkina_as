package com.google.maps.controls 
{
    public final class ControlPosition extends Object
    {
        public function ControlPosition(arg1:Number, arg2:Number=0, arg3:Number=NaN)
        {
            super();
            internalPaddingX = arg2;
            internalPaddingY = isNaN(arg3) ? internalPaddingX : arg3;
            internalAnchor = arg1 == ANCHOR_TOP_LEFT || arg1 == ANCHOR_BOTTOM_RIGHT || arg1 == ANCHOR_BOTTOM_LEFT ? arg1 : ANCHOR_TOP_RIGHT;
            return;
        }

        public function getOffsetX():Number
        {
            return internalPaddingX;
        }

        public function getOffsetY():Number
        {
            return internalPaddingY;
        }

        public function getAnchor():Number
        {
            return internalAnchor;
        }

        public static function fromObject(arg1:Object):com.google.maps.controls.ControlPosition
        {
            return new ControlPosition(arg1.getAnchor(), arg1.getOffsetX(), arg1.getOffsetY());
        }

        public static const ANCHOR_BOTTOM_LEFT:Number=32;

        public static const ANCHOR_TOP_RIGHT:Number=1;

        public static const ANCHOR_BOTTOM_RIGHT:Number=33;

        public static const ANCHOR_TOP_LEFT:Number=0;

        private var internalPaddingX:Number;

        private var internalPaddingY:Number;

        private var internalAnchor:Number;
    }
}
