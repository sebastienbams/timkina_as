package com.google.maps 
{
    import com.google.maps.wrappers.*;
    
    public class MapTypeOptions extends Object
    {
        public function MapTypeOptions(arg1:Object=null)
        {
            super();
            if (arg1 != null)
            {
                this.copyFromObject(arg1);
            }
            return;
        }

        public function set minResolution(arg1:Object):void
        {
            this._minResolution = arg1 as Number;
            return;
        }

        public function get linkColor():Object
        {
            return this._linkColor;
        }

        public function get alt():String
        {
            return this._alt;
        }

        public function set errorMessage(arg1:String):void
        {
            this._errorMessage = arg1;
            return;
        }

        public function set shortName(arg1:String):void
        {
            this._shortName = arg1;
            return;
        }

        public function set linkColor(arg1:Object):void
        {
            this._linkColor = arg1 as Number;
            return;
        }

        public function set urlArg(arg1:String):void
        {
            this._urlArg = arg1;
            return;
        }

        public function get tileSize():Object
        {
            return this._tileSize;
        }

        public function set alt(arg1:String):void
        {
            this._alt = arg1;
            return;
        }

        public function get minResolution():Object
        {
            return this._minResolution;
        }

        public function set maxResolution(arg1:Object):void
        {
            this._maxResolution = arg1 as Number;
            return;
        }

        public function get radius():Object
        {
            return this._radius;
        }

        public function set radius(arg1:Object):void
        {
            this._radius = arg1 as Number;
            return;
        }

        public function set tileSize(arg1:Object):void
        {
            this._tileSize = arg1 as Number;
            return;
        }

        public function get errorMessage():String
        {
            return this._errorMessage;
        }

        public function get shortName():String
        {
            return this._shortName;
        }

        public function set textColor(arg1:Object):void
        {
            this._textColor = arg1 as Number;
            return;
        }

        public function copyFromObject(arg1:Object):void
        {
            com.google.maps.wrappers.Wrapper.copyProperties(this, arg1, ["maxResolution", "minResolution", "tileSize", "textColor", "linkColor", "radius"], Number);
            com.google.maps.wrappers.Wrapper.copyProperties(this, arg1, ["shortName", "urlArg", "errorMessage", "alt"], String);
            return;
        }

        public function get maxResolution():Object
        {
            return this._maxResolution;
        }

        public function get urlArg():String
        {
            return this._urlArg;
        }

        public function toString():String
        {
            return "MapTypeOptions: { shortName: " + this.shortName + "\n\t  urlArg: " + this._urlArg + "\n\t  maxResolution: " + this._maxResolution + "\n\t  minResolution: " + this._minResolution + "\n\t  tileSize: " + this._tileSize + "\n\t  textColor: " + this._textColor + "\n\t  linkColor: " + this._linkColor + "\n\t  errorMessage: " + this._errorMessage + "\n\t  alt: " + this._alt + "\n\t  radius: " + this._radius + " }";
        }

        public function get textColor():Object
        {
            return this._textColor;
        }

        public static function merge(arg1:Array):com.google.maps.MapTypeOptions
        {
            return com.google.maps.wrappers.Wrapper.mergeStyles(com.google.maps.MapTypeOptions, arg1) as com.google.maps.MapTypeOptions;
        }

        public static function fromObject(arg1:Object):com.google.maps.MapTypeOptions
        {
            var loc1:*;
            loc1 = null;
            if (arg1 == null)
            {
                return null;
            }
            loc1 = new MapTypeOptions();
            loc1.copyFromObject(arg1);
            return loc1;
        }

        public static function getDefaultOptions():com.google.maps.MapTypeOptions
        {
            var loc1:*;
            loc1 = null;
            loc1 = com.google.maps.ClientBootstrap.getInstance();
            return loc1.getMapsFactory().getDefaultMapTypeOptions();
        }

        public static function setDefaultOptions(arg1:com.google.maps.MapTypeOptions):void
        {
            var loc1:*;
            loc1 = null;
            loc1 = com.google.maps.ClientBootstrap.getInstance();
            loc1.getMapsFactory().setDefaultMapTypeOptions(arg1);
            return;
        }

        private var _urlArg:String;

        private var _linkColor:Object;

        private var _minResolution:Object;

        private var _shortName:String;

        private var _alt:String;

        private var _tileSize:Object;

        private var _maxResolution:Object;

        private var _textColor:Object;

        private var _radius:Object;

        private var _errorMessage:String;
    }
}
