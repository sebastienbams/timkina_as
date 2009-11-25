package viewsection.sound 
{
    import com.gskinner.motion.*;
    import flash.display.*;
    import flash.events.*;
    import flash.media.*;
    import flash.net.*;
    import mx.effects.easing.*;
    
    
    public class SoundController extends flash.display.Sprite
    {
        public function SoundController()
        {
            super();
            var loc1:*;
            //loc1 = new flash.net.URLRequest(Control.getInstance().getConfig().getURLSoundLoop());
            
            loc1 = new flash.net.URLRequest("data/sound/Track  1.mp3");
            
            loc1.contentType = "audio/mpeg";
            loopSound = new flash.media.Sound();
            loopSound.addEventListener(flash.events.IOErrorEvent.IO_ERROR, onError);
            loopSound.load(loc1);
            this.addEventListener(flash.events.Event.ENTER_FRAME, preload);
            return;
        }

        public function changeVolume(arg1:Number):void
        {
            var loc1:*;
            loc1 = NaN;
            if (volumeCurrent == arg1)
            {
                return;
            }
            if (arg1 > volumeCurrent)
            {
                //loc1 = Control.getInstance().getConfig().getTransitionDurationOut();
            }
            else 
            {
                //loc1 = Control.getInstance().getConfig().getTransitionDurationIn();
            }
            volumeTarget = arg1;
            new com.gskinner.motion.GTween(this, loc1, {"volumeCurrent":arg1}, {"ease":mx.effects.easing.Quadratic.easeOut, "changeListener":onChangeVolumeProgress, "completeListener":onChangeVolumeComplete});
            return;
        }

        public function preload(arg1:flash.events.Event):void
        {
            var loc1:*;
            loc1 = loopSound.bytesLoaded / (loopSound.bytesTotal == 0 ? 1 : loopSound.bytesTotal);
            Control.getInstance().getSiteloader().setProgressSound(loc1);
            if (loc1 == 1)
            {
                this.removeEventListener(flash.events.Event.ENTER_FRAME, preload);
                //start();
            }
            return;
        }

        public function onChangeLoopVolumeComplete(arg1:flash.events.Event):void
        {
            loopTransform = new flash.media.SoundTransform(loopVolumeTarget);
            loopChannel.soundTransform = loopTransform;
            return;
        }

        public function loud():void
        {
            PLAYBACK_MODE = PLAYBACK_MODE_LOUD;
            changeLoopVolume(volumeLoud);
            return;
        }

        public function onChangeVolumeComplete(arg1:flash.events.Event):void
        {
            sndTransform = new flash.media.SoundTransform(volumeTarget);
            flash.media.SoundMixer.soundTransform = sndTransform;
            return;
        }

        public function on():void
        {
            changeVolume(1);
            soundOn = true;
            this.dispatchEvent(new flash.events.Event(viewsection.sound.SoundController.SOUND_ONOFF_CHANGE));
            return;
        }

        public function mute():void
        {
            PLAYBACK_MODE = PLAYBACK_MODE_MUTE;
            changeLoopVolume(volumeMute);
            return;
        }

        public function toggleOnOff():void
        {
            if (soundOn)
            {
                off();
            }
            else 
            {
                on();
            }
            return;
        }

        public function getSoundOn():Boolean
        {
            return soundOn;
        }

        public function changeLoopVolume(arg1:Number):void
        {
            var loc1:*;
            loc1 = NaN;
            if (loopVolumeCurrent == arg1)
            {
                return;
            }
            if (arg1 > loopVolumeCurrent)
            {
                //loc1 = Control.getInstance().getConfig().getTransitionDurationOut();
            }
            else 
            {
                //loc1 = Control.getInstance().getConfig().getTransitionDurationIn();
            }
            loopVolumeTarget = arg1;
            new com.gskinner.motion.GTween(this, loc1, {"loopVolumeCurrent":loopVolumeTarget}, {"ease":mx.effects.easing.Quadratic.easeOut, "changeListener":onChangeLoopVolumeProgress, "completeListener":onChangeLoopVolumeComplete});
            return;
        }

        public function off():void
        {
            changeVolume(volumeOff);
            soundOn = false;
            dispatchEvent(new flash.events.Event(SOUND_ONOFF_CHANGE));
            return;
        }

        private function onError(arg1:flash.events.IOErrorEvent):void
        {
            //net.hires.debug.Logger.error("* SoundController. IOError");
            return;
        }

        public function start():void
        {
            loopChannel = loopSound.play(0, int.MAX_VALUE);
            loopTransform = new flash.media.SoundTransform(volumeLoud);
            loopChannel.soundTransform = loopTransform;
            loopVolumeCurrent = volumeLoud;
            volumeCurrent = 1;
            loud();
            return;
        }

        public function soft():void
        {
            PLAYBACK_MODE = PLAYBACK_MODE_SOFT;
            changeLoopVolume(volumeSoft);
            return;
        }

        public function onChangeLoopVolumeProgress(arg1:flash.events.Event):void
        {
            loopTransform = new flash.media.SoundTransform(loopVolumeCurrent);
            loopChannel.soundTransform = loopTransform;
            return;
        }

        public function onChangeVolumeProgress(arg1:flash.events.Event):void
        {
            sndTransform = new flash.media.SoundTransform(volumeCurrent);
            flash.media.SoundMixer.soundTransform = sndTransform;
            return;
        }

        public static const SOUND_ONOFF_CHANGE:String="Sound_on_off";

        private var sndTransform:flash.media.SoundTransform;

        private var PLAYBACK_MODE:int;

        private var PLAYBACK_MODE_LOUD:int=0;

        private var loopSound:flash.media.Sound;

        private var volumeLoud:Number=0.8;

        private var soundOn:Boolean=true;

        private var loopVolumeTarget:Number;

        private var PLAYBACK_MODE_MUTE:int=2;

        private var volumeTarget:Number;

        private var volumeMute:Number=0;

        private var loopChannel:flash.media.SoundChannel;

        private var PLAYBACK_MODE_SOFT:int=1;

        private var volumeSoft:Number=0.2;

        private var loopTransform:flash.media.SoundTransform;

        private var volumeOff:Number=0;

        public var loopVolumeCurrent:Number;

        public var volumeCurrent:Number;
    }
}
