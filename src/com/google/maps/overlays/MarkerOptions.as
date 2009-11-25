package com.google.maps.overlays 
{
    import com.google.maps.*;
    import com.google.maps.interfaces.*;
    import com.google.maps.styles.*;
    import com.google.maps.wrappers.*;
    import flash.display.*;
    import flash.geom.*;
    import flash.text.*;
    
    public class MarkerOptions extends Object
    {
        public function MarkerOptions(arg1:Object=null)
        {
            super();
            if (arg1 != null)
            {
                this.copyFromObject(arg1);
            }
            return;
        }

        public function get tooltip():String
        {
            return this._tooltip;
        }

        public function set tooltip(arg1:String):void
        {
            this._tooltip = arg1;
            return;
        }

        public function get draggable():Object
        {
            return this._draggable;
        }

        public function get labelFormat():flash.text.TextFormat
        {
            return this._labelFormat;
        }

        public function get radius():Object
        {
            return this._radius;
        }

        public function set draggable(arg1:Object):void
        {
            this._draggable = arg1 as Boolean;
            return;
        }

        public function set gravity(arg1:Object):void
        {
            this._gravity = arg1 as Number;
            return;
        }

        public function set radius(arg1:Object):void
        {
            this._radius = arg1 as Number;
            return;
        }

        public function set labelFormat(arg1:flash.text.TextFormat):void
        {
            this._labelFormat = arg1;
            return;
        }

        public function set strokeStyle(arg1:com.google.maps.styles.StrokeStyle):void
        {
            this._strokeStyle = arg1;
            return;
        }

        public function set hasShadow(arg1:Object):void
        {
            this._hasShadow = arg1 as Boolean;
            return;
        }

        public function get gravity():Object
        {
            return this._gravity;
        }

        public function set iconAlignment(arg1:Object):void
        {
            this._iconAlignment = arg1;
            return;
        }

        public function get strokeStyle():com.google.maps.styles.StrokeStyle
        {
            return this._strokeStyle;
        }

        public function get hasShadow():Object
        {
            return this._hasShadow;
        }

        public function set fillStyle(arg1:com.google.maps.styles.FillStyle):void
        {
            this._fillStyle = arg1;
            return;
        }

        public function set iconOffset(arg1:flash.geom.Point):void
        {
            this._iconOffset = arg1 == null ? null : new flash.geom.Point(arg1.x, arg1.y);
            return;
        }

        public function copyFromObject(arg1:Object):void
        {
            com.google.maps.wrappers.Wrapper.copyProperties(this, arg1, ["radius", "gravity", "iconAlignment"], Number);
            com.google.maps.wrappers.Wrapper.copyProperties(this, arg1, ["hasShadow", "draggable"], Boolean);
            com.google.maps.wrappers.Wrapper.copyProperties(this, arg1, ["label", "tooltip"], String);
            com.google.maps.wrappers.Wrapper.copyProperties(this, arg1, ["iconOffset"], flash.geom.Point);
            com.google.maps.wrappers.Wrapper.copyProperties(this, arg1, ["icon"], flash.display.DisplayObject);
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

        public function set label(arg1:String):void
        {
            this._label = arg1;
            if (this._label != null)
            {
                this._icon = null;
            }
            return;
        }

        public function get iconAlignment():Object
        {
            return this._iconAlignment;
        }

        public function get iconOffset():flash.geom.Point
        {
            return this._iconOffset == null ? null : new flash.geom.Point(this._iconOffset.x, this._iconOffset.y);
        }

        public function get fillStyle():com.google.maps.styles.FillStyle
        {
            return this._fillStyle;
        }

        public function set icon(arg1:flash.display.DisplayObject):void
        {
            this._icon = arg1;
            if (this._icon != null)
            {
                this._label = null;
            }
            return;
        }

        public function toString():String
        {
            return "MarkerOptions:\n\t{ strokeStyle: " + this._strokeStyle + "\n\t  fillStyle: " + this._fillStyle + "\n\t  label: " + this._label + "\n\t  labelFormat: " + this._labelFormat + "\n\t  tooltip: " + this._tooltip + "\n\t  radius: " + this._radius + "\n\t  hasShadow: " + this._hasShadow + "\n\t  draggable: " + this._draggable + "\n\t  gravity: " + this._gravity + "\n\t  icon: " + this._icon + "\n\t  iconAlignment: " + this._iconAlignment + "\n\t  iconOffset: " + this._iconOffset + " }";
        }

        public function get label():String
        {
            return this._label;
        }

        public function get icon():flash.display.DisplayObject
        {
            return this._icon;
        }

        public static function fromObject(arg1:Object):com.google.maps.overlays.MarkerOptions
        {
            var loc1:*;
            loc1 = null;
            if (arg1 == null)
            {
                return null;
            }
            loc1 = new MarkerOptions();
            loc1.copyFromObject(arg1);
            return loc1;
        }

        public static function getDefaultOptions():com.google.maps.overlays.MarkerOptions
        {
            var loc1:*;
            loc1 = null;
            loc1 = com.google.maps.ClientBootstrap.getInstance().getMapsFactory();
            return loc1.getDefaultMarkerOptions();
        }

        public static function merge(arg1:Array):com.google.maps.overlays.MarkerOptions
        {
            return com.google.maps.wrappers.Wrapper.mergeStyles(com.google.maps.overlays.MarkerOptions, arg1) as com.google.maps.overlays.MarkerOptions;
        }

        public static function setDefaultOptions(arg1:com.google.maps.overlays.MarkerOptions):void
        {
            var loc1:*;
            loc1 = null;
            if (arg1._icon != null)
            {
                throw new Error("Cannot specify a custom icon in default MarkerOptions");
            }
            loc1 = com.google.maps.ClientBootstrap.getInstance().getMapsFactory();
            loc1.setDefaultMarkerOptions(arg1);
            return;
        }

        public static const ALIGN_LEFT:Number=0;

        public static const ALIGN_VERTICAL_CENTER:Number=16;

        public static const ALIGN_BOTTOM:Number=32;

        public static const ALIGN_RIGHT:Number=2;

        public static const ALIGN_HORIZONTAL_CENTER:Number=1;

        public static const ALIGN_TOP:Number=0;

        private var _iconOffset:flash.geom.Point;

        private var _draggable:Object;

        private var _gravity:Object;

        private var _strokeStyle:com.google.maps.styles.StrokeStyle;

        private var _radius:Object;

        private var _tooltip:String;

        private var _labelFormat:flash.text.TextFormat;

        private var _icon:flash.display.DisplayObject;

        private var _hasShadow:Object;

        private var _iconAlignment:Object;

        private var _fillStyle:com.google.maps.styles.FillStyle;

        private var _label:String;
    }
}
