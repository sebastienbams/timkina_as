package viewsection.scens
{
	import com.gskinner.motion.*;
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.net.*;
	import mx.effects.easing.*;	
	
	public class SceneBitmap extends flash.display.Sprite
	{
		public function SceneBitmap(url:String)
		{
            super();
            
            loader = new flash.display.Loader();
            loader.contentLoaderInfo.addEventListener(flash.events.Event.COMPLETE, onImageLoadComplete);
            loader.load(new flash.net.URLRequest(url));
			
            this.addEventListener(flash.events.Event.ENTER_FRAME, preload);
            alpha = 1;
            visible = true;
		}
		
        public function onStageResize(arg1:Number, arg2:Number):void
        {
			/*if ( !noScale ){
				width *= Control.getInstance().getDelta();
				height *= Control.getInstance().getDelta();
			}

			if ( centrX ){
				x =  arg1/2-width/2;
			}else{
				x *= Control.getInstance().getDelta();
			}
			
			y *= Control.getInstance().getDelta();*/

            return;	
        }
        
        public function preload(arg1:flash.events.Event):void
        {
            progress = loader.contentLoaderInfo.bytesLoaded / (loader.contentLoaderInfo.bytesTotal == 0 ? 1 : loader.contentLoaderInfo.bytesTotal);
            
            if (progress == 1)
            {
                this.removeEventListener(flash.events.Event.ENTER_FRAME, preload);
            }
            return;
        }
        
        protected function onImageLoadComplete(arg1:flash.events.Event):void
        {

            var loc1:*;
            loc1 = new flash.display.BitmapData(arg1.target.content.width, arg1.target.content.height, true, 0);
            loc1.draw(arg1.target.content);
            bitmap = new flash.display.Bitmap(loc1);
            addChild(bitmap);
            arg1.target.removeEventListener(flash.events.IOErrorEvent.IO_ERROR, onLoadError);
            arg1.target.removeEventListener(flash.events.Event.COMPLETE, onImageLoadComplete);
            flash.display.LoaderInfo(arg1.target).loader.unload();
            
            this.dispatchEvent(new flash.events.Event(viewsection.scens.SceneBitmap.READY));
            return;
        
        }
        
        protected function onLoadError(arg1:flash.events.Event):void
        {
        	return;
        }
        
        public function getProgress():Number
        {
        	return  progress;
        }
        
        public function show():void
        {
		            visible = true;
		            tweenIn.play();
		            return;
        }
        
        public function hide():void
        {
		            tweenOut.play();
		            return;
        }
        
        public function onShowComplete( event: Event): void
        {
        	tweenOut.position = -1*tweenOut.delay;
        	if ( autoShowHide ){
        		tweenOut.play();
        	}
        	return;
        }
        
        public function onHideComplete( event: Event): void
        {
        	tweenIn.position = -1*tweenIn.delay;
        	visible = false;
        	if ( autoShowHide ){
        		
        		scaleX = 1;
        		scaleY = 1;
        		tweenIn.play();
        	}
        	return;
        }
        
        public function isHideComlete():Number
        {
        	return ( hideComlete ? 1 : 0 );
        }
        
		public function setActiveMenu( id: String ):void
		{
			return;
		}
        
        protected var bitmap:flash.display.Bitmap;
        
        protected var progress:Number = 0;
        
        private var loader: flash.display.Loader;
        
        public static var HIDDEN:String="hidden";

        public static var READY:String="ready";
        
        public var tweenIn: com.gskinner.motion.GTween;
        
        public var tweenOut: com.gskinner.motion.GTween;
        
        protected var hideComlete: Boolean = false; 
         
        public var autoShowHide: Boolean = false;
        
        public var noScale: Boolean = false;
        
        public var centrX: Boolean = false;
        
	}
}