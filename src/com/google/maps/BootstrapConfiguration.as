package com.google.maps 
{
    import flash.display.*;
    
    internal class BootstrapConfiguration extends Object
    {
        public function BootstrapConfiguration()
        {
            super();
            return;
        }

        public function get channel():String
        {
            return this._channel;
        }

        public function set channel(arg1:String):void
        {
            checkLocked(this._channel, arg1);
            this._channel = arg1;
            return;
        }

        private function get hl():String
        {
            return this.language;
        }

        public function get key():String
        {
            return this._key;
        }

        public function initialize(arg1:flash.display.LoaderInfo):void
        {
            var loc1:*;
            loc1 = null;
            var loc2:*;
            loc2 = NaN;
            var loc3:*;
            loc3 = null;
            var loc4:*;
            loc4 = null;
            loc1 = BootstrapConfiguration.HTML_PARAMS;
            loc2 = 0;
            while (loc2 != loc1.length) 
            {
                loc3 = loc1[loc2];
                if (loc4 = ClientUtil.getFlashVar(arg1, loc3))
                {
                    this[loc3] = loc4;
                }
                loc2 = (loc2 + 1);
            }
            this._url = arg1.loaderURL;
            return;
        }

        public function get version():String
        {
            return this._version;
        }

        public function get client():String
        {
            return this._client;
        }

        public function set language(arg1:String):void
        {
            checkLocked(this._language, arg1);
            this._language = arg1;
            return;
        }

        public function getBootstrapUrl():String
        {
            var loc1:*;
            loc1 = null;
            var loc2:*;
            loc2 = null;
            var loc3:*;
            loc3 = 0;
            var loc4:*;
            loc4 = null;
            var loc5:*;
            loc5 = null;
            loc1 = "http://";
            loc1 = loc1 + com.google.maps.Release.mfeHost;
            loc1 = loc1 + BootstrapConfiguration.BOOTSTRAP_PATH;
            loc2 = BootstrapConfiguration.BOOTSTRAP_PARAMS;
            loc3 = 0;
            while (loc3 < loc2.length) 
            {
                loc4 = loc2[loc3];
                if ((loc5 = this[loc4]) != null)
                {
                    loc1 = loc1 + "&" + loc4 + "=" + encodeURIComponent(loc5);
                }
                ++loc3;
            }
            return loc1;
        }

        public function getMfeRequestParams():String
        {
            var loc1:*;
            loc1 = null;
            var loc2:*;
            loc2 = null;
            var loc3:*;
            loc3 = NaN;
            var loc4:*;
            loc4 = null;
            if (this._mfeRequestParams == null || !this._locked)
            {
                loc1 = "";
                loc2 = BootstrapConfiguration.MFE_REQUEST_PARAMS;
                loc3 = 0;
                while (loc3 != loc2.length) 
                {
                    loc4 = loc2[loc3];
                    if (this[loc4] != null)
                    {
                        loc1 = loc1 + "&" + loc4 + "=" + encodeURIComponent(this[loc4]);
                    }
                    loc3 = (loc3 + 1);
                }
                if (this._locked)
                {
                    this._mfeRequestParams = loc1;
                }
                return loc1;
            }
            return this._mfeRequestParams;
        }

        public function set client(arg1:String):void
        {
            checkLocked(this._client, arg1);
            this._client = arg1;
            return;
        }

        public function getClientVersion():String
        {
            return com.google.maps.Release.version;
        }

        public function lock():void
        {
            this._locked = true;
            return;
        }

        public function get url():String
        {
            return this._url;
        }

        private function get vlib():String
        {
            return this.version;
        }

        private function checkLocked(arg1:*, arg2:*):void
        {
            if (this._locked && !(arg1 == arg2))
            {
                throw new Error("Configuration parameters can no longer be changed");
            }
            return;
        }

        private function get v():String
        {
            return "1." + com.google.maps.Release.version;
        }

        public function get language():String
        {
            return this._language;
        }

        public function set key(arg1:String):void
        {
            checkLocked(this._key, arg1);
            this._key = arg1;
            return;
        }

        public function set version(arg1:String):void
        {
            checkLocked(this._version, arg1);
            this._version = arg1;
            return;
        }

        public static function getInstance():BootstrapConfiguration
        {
            if (BootstrapConfiguration.instance == null)
            {
                BootstrapConfiguration.instance = new BootstrapConfiguration();
            }
            return BootstrapConfiguration.instance;
        }

        private static const BOOTSTRAP_PATH:String="/mapsapi/publicapi?file=flashapi";

        private static const BOOTSTRAP_PARAMS:Array=["url", "key", "client", "channel", "hl", "v", "vlib"];

        private static const MFE_REQUEST_PARAMS:Array=["key", "client", "channel"];

        private static const HTML_PARAMS:Array=["key", "client", "channel", "language", "version"];

        private var _channel:String;

        private var _mfeRequestParams:String;

        private var _version:String;

        private var _key:String;

        private var _locked:Boolean;

        private var _client:String;

        private var _url:String;

        private var _language:String;

        private static var instance:BootstrapConfiguration;
    }
}
