package viewsection.intro
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.net.*;

	public class IntroBitmap extends flash.display.Sprite
	{
		public function IntroBitmap(url:String)
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
			width *= Control.getInstance().getDelta();
			height *= Control.getInstance().getDelta();

			x *= Control.getInstance().getDelta();
			y *= Control.getInstance().getDelta();

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
        
        private function onImageLoadComplete(arg1:flash.events.Event):void
        {

            var loc1:*;
            loc1 = new flash.display.BitmapData(arg1.target.content.width, arg1.target.content.height, true, 0);
            loc1.draw(arg1.target.content);
            bitmap = new flash.display.Bitmap(loc1);
            /*bitmap.x = arg1.target.content.width * -0.5;
            bitmap.y = arg1.target.content.height * -0.5;*/
            addChild(bitmap);
            arg1.target.removeEventListener(flash.events.IOErrorEvent.IO_ERROR, onLoadError);
            arg1.target.removeEventListener(flash.events.Event.COMPLETE, onImageLoadComplete);
            flash.display.LoaderInfo(arg1.target).loader.unload();
            
            this.dispatchEvent(new flash.events.Event(viewsection.intro.IntroBitmap.READY));
            return;
        
        }
        
        private function onLoadError(arg1:flash.events.Event):void
        {
        	return;
        }
        
        
        public function getProgress():Number
        {
        	return  progress;
        }
        
        
        private var bitmap:flash.display.Bitmap;
        
        private var progress:Number = 0;
        
        private var loader:flash.display.Loader;
        
        public static var HIDDEN:String="hidden";

        public static var READY:String="ready";
        
	}
}