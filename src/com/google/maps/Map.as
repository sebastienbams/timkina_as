package com.google.maps 
{
    import com.google.maps.interfaces.*;
    import com.google.maps.wrappers.*;
    import flash.display.*;
    import flash.events.*;
    import flash.geom.*;
    import flash.text.*;
    import flash.utils.*;
    
    public class Map extends com.google.maps.wrappers.IMapWrapper implements com.google.maps.interfaces.IMap
    {
        public function Map()
        {
            super();
            this.controlList = [];
            this.delayedCalls = [];
            this.autoSize = true;
            this.size = new flash.geom.Point(0, 0);
            this.addEventListener(flash.events.Event.ADDED_TO_STAGE, onAdded);
            return;
        }

        public function set channel(arg1:String):void
        {
            BootstrapConfiguration.getInstance().channel = arg1;
            return;
        }

        private function internalSetSize(arg1:flash.geom.Point):void
        {
            if (this.isLoaded())
            {
                super.setSize(arg1);
            }
            this.size = arg1;
            drawBackground();
            return;
        }

        protected override function onObjectReady():void
        {
            callLater(this.completeInitialization);
            return;
        }

        public override function removeControl(arg1:com.google.maps.interfaces.IControl):void
        {
            var loc1:*;
            loc1 = null;
            var loc2:*;
            loc2 = 0;
            loc1 = com.google.maps.ClientBootstrap.getInstance();
            if (loc1.isReady())
            {
                super.removeControl(arg1);
            }
            else 
            {
                loc2 = controlList.indexOf(arg1);
                if (loc2 >= 0)
                {
                    controlList.splice(loc2, 1);
                }
            }
            return;
        }

        public function get key():String
        {
            return BootstrapConfiguration.getInstance().key;
        }

        private function onBootstrapFailed(arg1:flash.events.Event):void
        {
            bootstrapFailure("Initialization failed: please check the API key,\nswf location, " + "version and network availability.");
            return;
        }

        public function set language(arg1:String):void
        {
            BootstrapConfiguration.getInstance().language = arg1;
            return;
        }

        private function onAdded(arg1:flash.events.Event):void
        {
            var loc1:*;
            loc1 = null;
            var loc2:*;
            loc2 = null;
            this.removeEventListener(flash.events.Event.ADDED_TO_STAGE, onAdded);
            this.parent.addEventListener(flash.events.Event.RESIZE, this.onParentResize);
            loc1 = this.parent as flash.display.Stage;
            if (!(loc1 == null) && this.autoSize)
            {
                loc1.scaleMode = flash.display.StageScaleMode.NO_SCALE;
                loc1.align = flash.display.StageAlign.TOP_LEFT;
                onParentResize();
            }
            drawBackground();
            loc2 = BootstrapConfiguration.getInstance();
            loc2.initialize(loaderInfo);
            loc2.lock();
            if (key != null)
            {
                com.google.maps.ClientBootstrap.getInstance().addEventListener(com.google.maps.ClientBootstrap.BOOTSTRAP_FAILED, onBootstrapFailed);
                com.google.maps.ClientBootstrap.getInstance().loadBootstrap();
                instantiateCrossDomainObject(com.google.maps.interfaces.IMap, com.google.maps.Map, "createMap");
            }
            else 
            {
                bootstrapFailure("Initialization failed: please specify an API key.");
            }
            return;
        }

        private function completeInitialization():void
        {
            var loc1:*;
            loc1 = NaN;
            loc1 = 0;
            while (loc1 < controlList.length) 
            {
                super.addControl(controlList[loc1]);
                loc1 = (loc1 + 1);
            }
            controlList = [];
            internalSetSize(this.size);
            dispatchEvent(new com.google.maps.MapEvent(com.google.maps.MapEvent.MAP_READY, this));
            return;
        }

        public function set key(arg1:String):void
        {
            BootstrapConfiguration.getInstance().key = arg1;
            return;
        }

        protected function callLater(arg1:Function):void
        {
            if (this.timer == null)
            {
                this.timer = new flash.utils.Timer(1, 1);
                this.timer.addEventListener(flash.events.TimerEvent.TIMER, this.executeDelayedCalls);
                this.timer.start();
            }
            this.delayedCalls.push(arg1);
            return;
        }

        public function get version():String
        {
            return BootstrapConfiguration.getInstance().version;
        }

        public function getInterfaceVersion():String
        {
            return com.google.maps.Release.version;
        }

        public function get channel():String
        {
            return BootstrapConfiguration.getInstance().channel;
        }

        private function bootstrapFailure(arg1:String):void
        {
            var loc1:*;
            loc1 = null;
            com.google.maps.Log.log0("Bootstrap failure: " + arg1);
            loc1 = new flash.text.TextField();
            loc1.background = true;
            loc1.autoSize = flash.text.TextFieldAutoSize.CENTER;
            loc1.defaultTextFormat = new flash.text.TextFormat("_sans", 16);
            loc1.x = this.size.x / 2;
            loc1.y = this.size.y / 2;
            loc1.text = arg1;
            addChild(loc1);
            return;
        }

        public function get language():String
        {
            return BootstrapConfiguration.getInstance().language;
        }

        public override function addControl(arg1:com.google.maps.interfaces.IControl):void
        {
            var loc1:*;
            loc1 = null;
            loc1 = com.google.maps.ClientBootstrap.getInstance();
            if (loc1.isReady())
            {
                super.addControl(arg1);
            }
            else 
            {
                controlList.push(arg1);
            }
            return;
        }

        private function onParentResize(arg1:flash.events.Event=null):void
        {
            var loc1:*;
            loc1 = null;
            if (this.autoSize)
            {
                loc1 = this.parent as flash.display.Stage;
                if (loc1 == null)
                {
                    internalSetSize(new flash.geom.Point(this.parent.width * this.parent.scaleX, this.parent.height * this.parent.scaleY));
                }
                else 
                {
                    internalSetSize(new flash.geom.Point(loc1.stageWidth, loc1.stageHeight));
                }
                drawBackground();
            }
            return;
        }

        public override function setSize(arg1:flash.geom.Point):void
        {
            this.autoSize = false;
            internalSetSize(arg1);
            return;
        }

        public function set client(arg1:String):void
        {
            BootstrapConfiguration.getInstance().client = arg1;
            return;
        }

        private function drawBackground():void
        {
            this.graphics.clear();
            this.graphics.beginFill(12632256);
            this.graphics.lineStyle();
            this.graphics.drawRect(0, 0, this.size.x, this.size.y);
            this.graphics.endFill();
            this.scaleX = 1;
            this.scaleY = 1;
            return;
        }

        private function executeDelayedCalls(arg1:flash.events.Event):void
        {
            var loc1:*;
            loc1 = null;
            var loc2:*;
            loc2 = 0;
            this.timer = null;
            loc1 = this.delayedCalls;
            this.delayedCalls = [];
            if (loc1 == null)
            {
                return;
            }
            while (loc2 < loc1.length) 
            {
                var loc3:*;
                (loc3 = loc1)[loc2]();
                ++loc2;
            }
            return;
        }

        public function set version(arg1:String):void
        {
            BootstrapConfiguration.getInstance().version = arg1;
            return;
        }

        public override function isLoaded():Boolean
        {
            return com.google.maps.ClientBootstrap.getInstance().isReady() && super.isLoaded();
        }

        public function get client():String
        {
            return BootstrapConfiguration.getInstance().client;
        }

        private var size:flash.geom.Point;

        private var autoSize:Boolean;

        private var timer:flash.utils.Timer;

        private var delayedCalls:Array;

        private var controlList:Array;
    }
}
