package com.google.maps 
{
    import com.google.maps.styles.*;
    import com.google.maps.wrappers.*;
    import flash.geom.*;
    import flash.text.*;
    
    public class InfoWindowOptions extends Object
    {
        public function InfoWindowOptions(arg1:Object=null)
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
            com.google.maps.wrappers.Wrapper.copyProperties(this, arg1, ["width", "height", "cornerRadius", "padding", "tailWidth", "tailHeight", "tailOffset", "tailAlign"], Number);
            com.google.maps.wrappers.Wrapper.copyProperties(this, arg1, ["hasCloseButton", "hasTail", "hasShadow"], Boolean);
            com.google.maps.wrappers.Wrapper.copyProperties(this, arg1, ["title", "titleHTML", "content", "contentHTML"], String);
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
            if (arg1.titleFormat != null)
            {
                if (this.titleFormat == null)
                {
                    this.titleFormat = new flash.text.TextFormat();
                }
                com.google.maps.wrappers.Wrapper.copyTextFormatProperties(this.titleFormat, arg1.titleFormat);
            }
            if (arg1.titleStyleSheet != null)
            {
                if (this.titleStyleSheet == null)
                {
                    this.titleStyleSheet = new flash.text.StyleSheet();
                }
                com.google.maps.wrappers.Wrapper.copyStyleSheetProperties(this.titleStyleSheet, arg1.titleStyleSheet);
            }
            if (arg1.contentFormat != null)
            {
                if (this.contentFormat == null)
                {
                    this.contentFormat = new flash.text.TextFormat();
                }
                com.google.maps.wrappers.Wrapper.copyTextFormatProperties(this.contentFormat, arg1.contentFormat);
            }
            if (arg1.contentStyleSheet != null)
            {
                if (this.contentStyleSheet == null)
                {
                    this.contentStyleSheet = new flash.text.StyleSheet();
                }
                com.google.maps.wrappers.Wrapper.copyStyleSheetProperties(this.contentStyleSheet, arg1.contentStyleSheet);
            }
            if (arg1.pointOffset != null)
            {
                if (this.pointOffset == null)
                {
                    this.pointOffset = new flash.geom.Point();
                }
                com.google.maps.wrappers.Wrapper.copyPointProperties(this.pointOffset, arg1.pointOffset);
            }
            return;
        }

        public function get tailOffset():Object
        {
            return this._tailOffset;
        }

        public function set tailOffset(arg1:Object):void
        {
            this._tailOffset = arg1 as Number;
            return;
        }

        public function get hasTail():Object
        {
            return this._hasTail;
        }

        public function set pointOffset(arg1:flash.geom.Point):void
        {
            this._pointOffset = arg1;
            return;
        }

        public function get padding():Object
        {
            return this._padding;
        }

        public function get titleHTML():String
        {
            return this._titleHTML;
        }

        public function set width(arg1:Object):void
        {
            this._width = arg1 as Number;
            return;
        }

        public function set hasTail(arg1:Object):void
        {
            this._hasTail = arg1 as Boolean;
            return;
        }

        public function set contentStyleSheet(arg1:flash.text.StyleSheet):void
        {
            this._contentStyleSheet = arg1;
            return;
        }

        public function get tailAlign():Object
        {
            return this._tailAlign;
        }

        public function get tailHeight():Object
        {
            return this._tailHeight;
        }

        public function get contentStyleSheet():flash.text.StyleSheet
        {
            return this._contentStyleSheet;
        }

        public function set contentFormat(arg1:flash.text.TextFormat):void
        {
            this._contentFormat = arg1;
            return;
        }

        public function set titleHTML(arg1:String):void
        {
            this._titleHTML = arg1;
            if (this._titleHTML != null)
            {
                this._title = null;
            }
            return;
        }

        public function set tailAlign(arg1:Object):void
        {
            this._tailAlign = arg1 as Number;
            return;
        }

        public function get contentHTML():String
        {
            return this._contentHTML;
        }

        public function get titleStyleSheet():flash.text.StyleSheet
        {
            return this._titleStyleSheet;
        }

        public function set hasCloseButton(arg1:Object):void
        {
            this._hasCloseButton = arg1 as Boolean;
            return;
        }

        public function set padding(arg1:Object):void
        {
            this._padding = arg1 as Number;
            return;
        }

        public function set tailWidth(arg1:Object):void
        {
            this._tailWidth = arg1 as Number;
            return;
        }

        public function set tailHeight(arg1:Object):void
        {
            this._tailHeight = arg1 as Number;
            return;
        }

        public function set title(arg1:String):void
        {
            this._title = arg1;
            if (this._title != null)
            {
                this._titleHTML = null;
            }
            return;
        }

        public function set strokeStyle(arg1:com.google.maps.styles.StrokeStyle):void
        {
            this._strokeStyle = arg1;
            return;
        }

        public function set cornerRadius(arg1:Object):void
        {
            this._cornerRadius = arg1 as Number;
            return;
        }

        public function get height():Object
        {
            return this._height;
        }

        public function get pointOffset():flash.geom.Point
        {
            return this._pointOffset;
        }

        public function set contentHTML(arg1:String):void
        {
            this._contentHTML = arg1;
            if (this._contentHTML != null)
            {
                this._content = null;
            }
            return;
        }

        public function get width():Object
        {
            return this._width;
        }

        public function get contentFormat():flash.text.TextFormat
        {
            return this._contentFormat;
        }

        public function set titleStyleSheet(arg1:flash.text.StyleSheet):void
        {
            this._titleStyleSheet = arg1;
            return;
        }

        public function set height(arg1:Object):void
        {
            this._height = arg1 as Number;
            return;
        }

        public function get cornerRadius():Object
        {
            return this._cornerRadius;
        }

        public function get title():String
        {
            return this._title;
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

        public function get tailWidth():Object
        {
            return this._tailWidth;
        }

        public function get hasCloseButton():Object
        {
            return this._hasCloseButton;
        }

        public function set hasShadow(arg1:Object):void
        {
            this._hasShadow = arg1 as Boolean;
            return;
        }

        public function get strokeStyle():com.google.maps.styles.StrokeStyle
        {
            return this._strokeStyle;
        }

        public function set titleFormat(arg1:flash.text.TextFormat):void
        {
            this._titleFormat = arg1;
            return;
        }

        public function get fillStyle():com.google.maps.styles.FillStyle
        {
            return this._fillStyle;
        }

        public function set content(arg1:String):void
        {
            this._content = arg1;
            if (this._content != null)
            {
                this._contentHTML = null;
            }
            return;
        }

        public function get content():String
        {
            return this._content;
        }

        public function get titleFormat():flash.text.TextFormat
        {
            return this._titleFormat;
        }

        public static function fromObject(arg1:Object):com.google.maps.InfoWindowOptions
        {
            var loc1:*;
            loc1 = null;
            if (arg1 == null)
            {
                return null;
            }
            loc1 = new InfoWindowOptions();
            loc1.copyFromObject(arg1);
            return loc1;
        }

        public static function getDefaultOptions():com.google.maps.InfoWindowOptions
        {
            var loc1:*;
            loc1 = null;
            loc1 = com.google.maps.ClientBootstrap.getInstance();
            return loc1.getMapsFactory().getDefaultInfoWindowOptions();
        }

        public static function mergeOptions(arg1:Array):com.google.maps.InfoWindowOptions
        {
            return com.google.maps.wrappers.Wrapper.mergeStyles(com.google.maps.InfoWindowOptions, arg1) as com.google.maps.InfoWindowOptions;
        }

        public static function setDefaultOptions(arg1:com.google.maps.InfoWindowOptions):void
        {
            var loc1:*;
            loc1 = null;
            loc1 = com.google.maps.ClientBootstrap.getInstance();
            loc1.getMapsFactory().setDefaultInfoWindowOptions(arg1);
            return;
        }

        public static const ALIGN_LEFT:Number=0;

        public static const ALIGN_RIGHT:Number=2;

        public static const ALIGN_CENTER:Number=1;

        private var _pointOffset:flash.geom.Point;

        private var _contentStyleSheet:flash.text.StyleSheet;

        private var _titleHTML:String;

        private var _strokeStyle:com.google.maps.styles.StrokeStyle;

        private var _tailAlign:Object;

        private var _cornerRadius:Object;

        private var _tailOffset:Object;

        private var _titleFormat:flash.text.TextFormat;

        private var _content:String;

        private var _tailHeight:Object;

        private var _height:Object;

        private var _width:Object;

        private var _hasTail:Object;

        private var _contentFormat:flash.text.TextFormat;

        private var _padding:Object;

        private var _tailWidth:Object;

        private var _title:String;

        private var _hasShadow:Object;

        private var _titleStyleSheet:flash.text.StyleSheet;

        private var _contentHTML:String;

        private var _hasCloseButton:Object;

        private var _fillStyle:com.google.maps.styles.FillStyle;
    }
}
