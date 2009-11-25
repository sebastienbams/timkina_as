package com.gskinner.motion 
{
    import flash.events.*;
    import flash.utils.*;
    
    public class GTween extends flash.events.EventDispatcher
    {
        public function GTween(arg1:Object=null, arg2:Number=10, arg3:Object=null, arg4:Object=null)
        {
            ease = linearEase;
            super();
            ticker = activeTicker;
            this.target = arg1;
            this.duration = arg2;
            ease = defaultEase || linearEase;
            setProperties(arg3);
            setTweenProperties(arg4);
            return;
        }

        protected function setGCLock(arg1:Boolean):void
        {
            if (arg1)
            {
                if (_target as flash.events.IEventDispatcher)
                {
                    _target.addEventListener("GDS__NONEXISTENT_EVENT", nullListener, false, 0, false);
                }
                else 
                {
                    activeTweens[this] = true;
                }
            }
            else 
            {
                if (_target as flash.events.IEventDispatcher)
                {
                    _target.removeEventListener("GDS__NONEXISTENT_EVENT", nullListener);
                }
                delete activeTweens[this];
            }
            return;
        }

        public function get target():Object
        {
            return _target;
        }

        public function get delay():Number
        {
            return _delay;
        }

        public function set delay(arg1:Number):void
        {
            if (_position == -_delay)
            {
                setPosition(-arg1);
            }
            _delay = arg1;
            return;
        }

        protected function init():void
        {
            var loc1:*;
            loc1 = null;
            var loc2:*;
            loc2 = NaN;
            var loc3:*;
            loc3 = NaN;
            inited = true;
            if (_lockStartProperties)
            {
                return;
            }
            startValues = {};
            if (assignmentTarget && assignmentProperty)
            {
                _propertyTarget = assignmentTarget[assignmentProperty];
            }
            var loc4:*;
            loc4 = 0;
            var loc5:*;
            loc5 = endValues;
            for (loc1 in loc5)
            {
                if (autoRotation && rotationProperties[loc1])
                {
                    var loc6:*;
                    endValues[loc1] = loc6 = endValues[loc1] % 360;
                    loc2 = loc6;
                    loc3 = _propertyTarget[loc1] % 360;
                    startValues[loc1] = loc3 + (Math.abs(loc3 - loc2) < 180 ? 0 : loc3 > loc2 ? -360 : 360);
                    continue;
                }
                startValues[loc1] = _propertyTarget[loc1];
            }
            return;
        }

        public function get state():String
        {
            return _position == -_delay && _paused ? START : _position < 0 ? DELAY : !(repeat == -1) && _position >= (repeat + 1) * duration ? END : TWEEN;
        }

        public function get lockStartProperties():Boolean
        {
            return _lockStartProperties;
        }

        public function deleteProperty(arg1:String):Boolean
        {
            return delete endValues[arg1];
        }

        public function set target(arg1:Object):void
        {
            var loc1:*;
            _target = loc1 = arg1 !== null ? arg1 : {};
            _propertyTarget = loc1;
            inited = false;
            return;
        }

        public function set reversed(arg1:Boolean):void
        {
            if (arg1 == _reversed)
            {
                return;
            }
            _reversed = arg1;
            if (!inited)
            {
                init();
            }
            setPosition(_position, true);
            return;
        }

        public function get position():Number
        {
            return _position;
        }

        public function setPosition(arg1:Number, arg2:Boolean=true):void
        {
            var loc2:*;
            loc2 = NaN;
            _previousPosition = _position;
            _position = arg1;
            if (!inTick && !paused)
            {
                updatePositionOffset();
            }
            var loc1:*;
            loc1 = (repeat + 1) * duration;
            if (arg1 < 0)
            {
                loc2 = _reversed ? duration : 0;
            }
            else 
            {
                if (repeat == -1 || arg1 < loc1)
                {
                    loc2 = arg1 % duration;
                    if ((reflect && arg1 / duration % 2 >= 1) != _reversed)
                    {
                        loc2 = duration - loc2;
                    }
                }
                else 
                {
                    loc2 = (reflect && repeat % 2 >= 1) == _reversed ? duration : 0;
                }
            }
            if (loc2 == _tweenPosition)
            {
                return;
            }
            _previousTweenPosition = _tweenPosition;
            _tweenPosition = loc2;
            if (!arg2 && hasEventListener(flash.events.Event.CHANGE))
            {
                dispatchEvent(new flash.events.Event(flash.events.Event.CHANGE));
            }
            if (!inited && _previousPosition <= 0 && _position >= 0)
            {
                init();
                if (!arg2 && hasEventListener(flash.events.Event.INIT))
                {
                    dispatchEvent(new flash.events.Event(flash.events.Event.INIT));
                }
            }
            updateProperties();
            if (!(repeat == -1) && _previousPosition < loc1 && arg1 >= loc1)
            {
                if (!arg2 && hasEventListener(flash.events.Event.COMPLETE))
                {
                    dispatchEvent(new flash.events.Event(flash.events.Event.COMPLETE));
                }
                paused = true;
                if (nextTween)
                {
                    nextTween.paused = false;
                }
            }
            return;
        }

        public function set lockStartProperties(arg1:Boolean):void
        {
            if (arg1 && !inited)
            {
                init();
            }
            _lockStartProperties = arg1;
            return;
        }

        public function get paused():Boolean
        {
            return _paused;
        }

        public function get tweenPosition():Number
        {
            return _tweenPosition;
        }

        public function invalidate():void
        {
            inited = false;
            if (_position > 0)
            {
                _position = 0;
                updatePositionOffset();
            }
            if (autoPlay)
            {
                paused = false;
            }
            return;
        }

        public function getProperties():Object
        {
            return copyObject(endValues);
        }

        public function get propertyTarget():Object
        {
            return _propertyTarget;
        }

        public function play():void
        {
            paused = false;
            return;
        }

        public function setAssignment(arg1:Object=null, arg2:String=null):void
        {
            this.assignmentTarget = arg1;
            this.assignmentProperty = arg2;
            inited = false;
            return;
        }

        public function get reversed():Boolean
        {
            return _reversed;
        }

        public function set position(arg1:Number):void
        {
            setPosition(arg1, true);
            return;
        }

        protected function updateProperty(arg1:String, arg2:Number, arg3:Number, arg4:Number):void
        {
            var loc1:*;
            loc1 = arg2 + (arg3 - arg2) * arg4;
            if (snapping && snappingProperties[arg1])
            {
                loc1 = Math.round(loc1);
            }
            if (arg1 != "currentFrame")
            {
                _propertyTarget[arg1] = loc1;
            }
            else 
            {
                _propertyTarget.gotoAndStop(loc1 << 0);
            }
            return;
        }

        public function setProperties(arg1:Object):void
        {
            var loc1:*;
            loc1 = null;
            endValues = {};
            var loc2:*;
            loc2 = 0;
            var loc3:*;
            loc3 = arg1;
            for (loc1 in loc3)
            {
                setProperty(loc1, arg1[loc1]);
            }
            return;
        }

        public function getProperty(arg1:String):Number
        {
            return endValues[arg1];
        }

        public function end():void
        {
            setPosition(repeat != -1 ? (repeat + 1) * duration : duration);
            return;
        }

        public function set paused(arg1:Boolean):void
        {
            if (arg1 == _paused)
            {
                return;
            }
            _paused = arg1;
            if (arg1)
            {
                ticker.removeEventListener("tick", handleTick);
            }
            else 
            {
                ticker.addEventListener("tick", handleTick, false, 0, true);
                if (!(repeat == -1) && _position >= duration * (repeat + 1))
                {
                    position = 0;
                }
                else 
                {
                    updatePositionOffset();
                }
            }
            setGCLock(!arg1);
            return;
        }

        public function beginning():void
        {
            setPosition(-_delay);
            return;
        }

        public function setProperty(arg1:String, arg2:Number):void
        {
            if (isNaN(arg2))
            {
                return;
            }
            endValues[arg1] = arg2;
            if (_lockStartProperties && startValues[arg1] == null)
            {
                startValues[arg1] = _propertyTarget[arg1];
            }
            invalidate();
            return;
        }

        protected function updatePositionOffset():void
        {
            positionOffset = ticker.position - _position;
            return;
        }

        protected function copyObject(arg1:Object):Object
        {
            var loc2:*;
            loc2 = null;
            var loc1:*;
            loc1 = {};
            var loc3:*;
            loc3 = 0;
            var loc4:*;
            loc4 = arg1;
            for (loc2 in loc4)
            {
                loc1[arg1] = arg1[loc2];
            }
            return loc1;
        }

        public function setTweenProperties(arg1:Object):void
        {
            var loc1:*;
            loc1 = NaN;
            var loc2:*;
            loc2 = null;
            if (!arg1)
            {
                return;
            }
            if ("position" in arg1)
            {
                loc1 = arg1.position;
                delete arg1.position;
            }
            if ("initListener" in arg1)
            {
                addEventListener(flash.events.Event.INIT, arg1.initListener, false, 0, true);
                delete arg1.initListener;
            }
            if ("completeListener" in arg1)
            {
                addEventListener(flash.events.Event.COMPLETE, arg1.completeListener, false, 0, true);
                delete arg1.completeListener;
            }
            if ("changeListener" in arg1)
            {
                addEventListener(flash.events.Event.CHANGE, arg1.changeListener, false, 0, true);
                delete arg1.changeListener;
            }
            var loc3:*;
            loc3 = 0;
            var loc4:*;
            loc4 = arg1;
            for (loc2 in loc4)
            {
                this[loc2] = arg1[loc2];
            }
            if (!isNaN(loc1))
            {
                position = loc1;
            }
            return;
        }

        protected function updateProperties():void
        {
            var loc2:*;
            loc2 = null;
            var loc1:*;
            loc1 = ease(_tweenPosition / duration, 0, 1, 1);
            var loc3:*;
            loc3 = 0;
            var loc4:*;
            loc4 = endValues;
            for (loc2 in loc4)
            {
                updateProperty(loc2, startValues[loc2], endValues[loc2], loc1);
            }
            if (autoVisible && "alpha" in endValues && "alpha" in _propertyTarget && "visible" in _propertyTarget)
            {
                _propertyTarget.visible = _propertyTarget.alpha > 0;
            }
            if (assignmentTarget && assignmentProperty)
            {
                assignmentTarget[assignmentProperty] = _propertyTarget;
            }
            return;
        }

        public function reverse(arg1:Boolean=true):void
        {
            var loc1:*;
            loc1 = repeat != -1 ? (repeat + 1) * duration - _position : duration - _position % duration;
            if (reflect)
            {
                _reversed = !(position / duration % 2 >= 1 == loc1 / duration % 2 >= 1 == _reversed);
            }
            else 
            {
                _reversed = !_reversed;
            }
            setPosition(loc1, arg1);
            return;
        }

        public function setStartProperties(arg1:Object):void
        {
            startValues = copyObject(arg1);
            inited = true;
            return;
        }

        protected function handleTick(arg1:flash.events.Event):void
        {
            inTick = true;
            if (pauseAll)
            {
                updatePositionOffset();
            }
            else 
            {
                setPosition(ticker.position - positionOffset, false);
            }
            inTick = false;
            return;
        }

        public function get proxy():Object
        {
            if (_proxy == null)
            {
                _proxy = new TargetProxy(this);
            }
            return _proxy;
        }

        public function pause():void
        {
            paused = true;
            return;
        }

        protected function nullListener(arg1:flash.events.Event):void
        {
            return;
        }

        public function getStartProperties():Object
        {
            return copyObject(startValues);
        }

        public static function set timeInterval(arg1:uint):void
        {
            _timeInterval = arg1;
            if (_activeTicker as TimeTicker)
            {
                (_activeTicker as TimeTicker).interval = _timeInterval / 1000;
            }
            return;
        }

        public static function get timingMode():String
        {
            return _timingMode;
        }

        public static function get activeTicker():ITicker
        {
            if (_timingMode == null)
            {
                timingMode = HYBRID;
            }
            return _activeTicker;
        }

        public static function set timingMode(arg1:String):void
        {
            arg1 = arg1 == FRAME || arg1 == TIME ? arg1 : HYBRID;
            if (arg1 == _timingMode)
            {
                return;
            }
            _timingMode = arg1;
            if (_timingMode != TIME)
            {
                if (_timingMode != FRAME)
                {
                    _activeTicker = new HybridTicker();
                }
                else 
                {
                    _activeTicker = new FrameTicker();
                }
            }
            else 
            {
                _activeTicker = new TimeTicker();
                (_activeTicker as TimeTicker).interval = _timeInterval / 1000;
            }
            return;
        }

        public static function linearEase(arg1:Number, arg2:Number, arg3:Number, arg4:Number):Number
        {
            return arg1;
        }

        public static function get timeInterval():uint
        {
            return _timeInterval;
        }

        
        {
            _timeInterval = 40;
            activeTweens = new flash.utils.Dictionary();
            pauseAll = false;
            rotationProperties = {"rotation":true, "rotationX":true, "rotationY":true, "rotationZ":true};
            snappingProperties = {"x":true, "y":true};
        }

        public static const START:String="start";

        public static const FRAME:String="frame";

        public static const TWEEN:String="tween";

        public static const TIME:String="time";

        public static const DELAY:String="delay";

        public static const END:String="end";

        public static const HYBRID:String="hybrid";

        public var autoPlay:Boolean=true;

        protected var _position:Number=0;

        protected var ticker:ITicker;

        protected var _delay:Number=0;

        public var duration:Number=1;

        public var repeat:int=0;

        protected var positionOffset:Number;

        protected var _previousPosition:Number;

        protected var startValues:Object;

        public var data:*;

        protected var inited:Boolean;

        protected var _target:Object;

        protected var _tweenPosition:Number=0;

        protected var _reversed:Boolean;

        public var snapping:Boolean=false;

        public var reflect:Boolean=false;

        public var nextTween:com.gskinner.motion.GTween;

        protected var assignmentProperty:String;

        public var autoVisible:Boolean=true;

        protected var assignmentTarget:Object;

        protected var _lockStartProperties:Boolean;

        public var autoRotation:Boolean=false;

        protected var endValues:Object;

        protected var inTick:Boolean;

        protected var _paused:Boolean=true;

        protected var _propertyTarget:Object;

        public var ease:Function;

        protected var _proxy:TargetProxy;

        protected var _previousTweenPosition:Number;

        public static var snappingProperties:Object;

        public static var pauseAll:Boolean=false;

        protected static var activeTweens:flash.utils.Dictionary;

        protected static var _activeTicker:ITicker;

        protected static var _timeInterval:uint=40;

        public static var rotationProperties:Object;

        public static var defaultEase:Function;

        protected static var _timingMode:String;
    }
}

import flash.display.*;
import flash.events.*;
import flash.utils.*;


class FrameTicker extends flash.events.EventDispatcher implements ITicker
{
    public function FrameTicker()
    {
        super();
        shape = new flash.display.Shape();
        shape.addEventListener(flash.events.Event.ENTER_FRAME, tick);
        return;
    }

    public function get position():Number
    {
        return _position;
    }

    protected function tick(arg1:flash.events.Event):void
    {
        var loc1:*;
        var loc2:*;
        _position++;
        dispatchEvent(new flash.events.Event("tick"));
        return;
    }

    protected var shape:flash.display.Shape;

    protected var _position:Number=0;
}

class HybridTicker extends flash.events.EventDispatcher implements ITicker
{
    public function HybridTicker()
    {
        super();
        shape = new flash.display.Shape();
        shape.addEventListener(flash.events.Event.ENTER_FRAME, tick);
        return;
    }

    public function get position():Number
    {
        return flash.utils.getTimer() / 1000;
    }

    protected function tick(arg1:flash.events.Event):void
    {
        dispatchEvent(new flash.events.Event("tick"));
        return;
    }

    protected var shape:flash.display.Shape;
}

interface ITicker extends flash.events.IEventDispatcher
{
    function get position():Number;
}

dynamic class TargetProxy extends flash.utils.Proxy
{
    public function TargetProxy(arg1:com.gskinner.motion.GTween)
    {
        super();
        this.gTween = arg1;
        return;
    }

    flash_proxy override function deleteProperty(arg1:*):Boolean
    {
        return gTween.deleteProperty(arg1);
    }

    flash_proxy override function callProperty(arg1:*, ... rest):*
    {
        return gTween.propertyTarget[arg1].apply(null, rest);
    }

    flash_proxy override function setProperty(arg1:*, arg2:*):void
    {
        if (isNaN(arg2))
        {
            gTween.propertyTarget[arg1] = arg2;
        }
        else 
        {
            gTween.setProperty(String(arg1), Number(arg2));
        }
        return;
    }

    flash_proxy override function getProperty(arg1:*):*
    {
        var loc1:*;
        loc1 = gTween.getProperty(arg1);
        return isNaN(loc1) ? gTween.propertyTarget[arg1] : loc1;
    }

    private var gTween:com.gskinner.motion.GTween;
}

class TimeTicker extends flash.events.EventDispatcher implements ITicker
{
    public function TimeTicker()
    {
        super();
        timer = new flash.utils.Timer(20);
        timer.start();
        timer.addEventListener(flash.events.TimerEvent.TIMER, tick);
        return;
    }

    public function get position():Number
    {
        return flash.utils.getTimer() / 1000;
    }

    public function set interval(arg1:Number):void
    {
        timer.delay = arg1 * 1000;
        return;
    }

    protected function tick(arg1:flash.events.TimerEvent):void
    {
        dispatchEvent(new flash.events.Event("tick"));
        arg1.updateAfterEvent();
        return;
    }

    protected var timer:flash.utils.Timer;
}