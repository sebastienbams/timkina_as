package viewsection.menu
{
	import com.gskinner.motion.*;
	
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.net.*;
	
	import mx.effects.easing.*;
	
	import viewsection.MyEvent; 

	public class MenuItem extends Sprite
	{
		public function MenuItem( lid:*, url1: String, url2: String, arg:String  )
		{
			super();
			
			id = lid;
			
			contenerID = arg;
            
            Control.getInstance().addEventListener(MyEvent.QUICK_HIDE, disable);
            Control.getInstance().addEventListener(MyEvent.QUICK_SHOW, enable);
            Control.getInstance().addEventListener(MyEvent.SELECT, select);

            loader1 = new flash.display.Loader();
            loader1.contentLoaderInfo.addEventListener(flash.events.Event.COMPLETE, onImageLoadComplete1);
            loader1.load(new flash.net.URLRequest ( url1 ) );
			
            loader2 = new flash.display.Loader();
            loader2.contentLoaderInfo.addEventListener(flash.events.Event.COMPLETE, onImageLoadComplete2);
            loader2.load(new flash.net.URLRequest ( url2 ) );
            this.addEventListener(flash.events.Event.ENTER_FRAME, preload);
		}
		
		
        public function preload(arg1:flash.events.Event):void
        {
            
            var loc1: * = 0;
            var loc2: * = 0;
            
            loc1 = loader1.contentLoaderInfo.bytesLoaded / (loader1.contentLoaderInfo.bytesTotal == 0 ? 1 : loader1.contentLoaderInfo.bytesTotal);
            loc2 = loader1.contentLoaderInfo.bytesLoaded / (loader1.contentLoaderInfo.bytesTotal == 0 ? 1 : loader1.contentLoaderInfo.bytesTotal);
            
            progress = ( loc1 + loc2 ) / 2; 
            
            if  ( progress == 1 )
            {
                this.removeEventListener(flash.events.Event.ENTER_FRAME, preload);
            }
            
            return;
        }		
		
        private function onImageLoadComplete1 (arg1:flash.events.Event):void
        {

            var loc1:*;
            loc1 = new flash.display.BitmapData(arg1.target.content.width, arg1.target.content.height, true, 0);
            loc1.draw(arg1.target.content);
            image = new flash.display.Bitmap(loc1);
            image.visible = true;
            addChild( image );
            arg1.target.removeEventListener(flash.events.Event.COMPLETE, onImageLoadComplete1);
            flash.display.LoaderInfo(arg1.target).loader.unload();
            this.dispatchEvent(new flash.events.Event(viewsection.menu.MenuItem.READY));
            
            return;
        
        }

        private function onImageLoadComplete2 (arg1:flash.events.Event):void
        {

            var loc1:*;
            loc1 = new flash.display.BitmapData(arg1.target.content.width, arg1.target.content.height, true, 0);
            loc1.draw(arg1.target.content);
            imageHover = new flash.display.Bitmap(loc1);
            imageHover.visible = false;
            addChild( imageHover );
            arg1.target.removeEventListener(flash.events.Event.COMPLETE, onImageLoadComplete2);
            flash.display.LoaderInfo(arg1.target).loader.unload();
            this.dispatchEvent(new flash.events.Event(viewsection.menu.MenuItem.READY));
            
            return;
        
        }
		
		public function getProgress():Number
		{
			return progress;
		}
		
        public function onStageResize(arg1:Number, arg2:Number):void
        {
			/*width *= Control.getInstance().getDelta();
			height *= Control.getInstance().getDelta();*/

			x *= Control.getInstance().getDelta();
			y *= Control.getInstance().getDelta();

            return;	
        }		
        
        public function show():void
        {
	        
	        visible = !thisDisable;
	        
            if ( !thisDisable ){ 
	            
	            if ( tweenIn != null){
	        
	            	tweenIn.play();	
	        
	            }else{
	        
	            	onShowComplete( null );
	        
	            }
	            
            }

            addEventListener(MouseEvent.ROLL_OVER, hover);
            addEventListener(MouseEvent.ROLL_OUT , mouseLeave);
            addEventListener(MouseEvent.CLICK , onClick);
			
	        return;     
            
        }
        
        private function mouseLeave(event: Event):void
        {
         	if ( submenuController != null ){
         		submenuController.hide();
         	}
        	if ( !isActive ){
        		image.visible = true;
        		imageHover.visible = false;
        	}
        	return;
        }

        protected function hover(event: Event):void
        {
         	if ( submenuController != null ){
         		submenuController.show();
         	}
         	
         	if ( !isActive ){
	         	image.visible = false; 
	        	imageHover.visible = true;
         	}
        	return;       	
        }
        
        public function hide():void
        {

         	if ( submenuController != null ){
         		
         		visible = false;
         		return;
         	
         	}
			
            if ( !thisDisable ){

	            if ( tweenOut != null ){
		        
		            tweenOut.play();
		        
		        }
            	
            }else{
            	onShowComplete( null );
            }
            
            return;
        }
        
        protected function onClick( event: Event):void
        {
        	Control.getInstance().menuEvent( id );
        	return;
        }

        public function onShowComplete( event: Event): void
        {
        	
        	if ( !thisDisable ){
        	
        		tweenOut.position = -1*tweenOut.delay;
        	
        		if ( autoShowHide ){
        		
        			tweenOut.play();
        		
        		}
        	}
        	
        	return;
        }
        
        public function onHideComplete( event: Event): void
        {

        	visible = false;
        	
        	if ( !thisDisable ){

	        	if ( tweenIn != null ){
	        	
	        		tweenIn.position = -1*tweenIn.delay;	
		        	if ( autoShowHide ){
		        		
		        		scaleX = 1;
		        		scaleY = 1;
		        		tweenIn.play();
		        	}
	        	
	        	}
        		
        	}
        	
        	return;
        }

         public function createSubMenu ( url: String, id:String ):void
         {
         	submenuController = new MenuController( url, id ) ;
         	addChild( submenuController );
         }
         
         public function select( event: MyEvent ):void
         {
         	
         	if ( getProgress() == 1 ){
	         	if ( contenerID == event.targetContId ){
	         		isActive = event.targetId==id ? true : false; 
	         		image.visible = !isActive;
	         		imageHover.visible = isActive;
	         	}
 	         	
         	}
         	
         	return;
         
         }
 
 		protected function enable( event: MyEvent):void
		{
			
			if ( contenerID == event.targetContId ){
				if ( event.targetId == id){
					visible = true;
					thisDisable = false;	
				}
			}
			 			
		}		
		
		protected function disable( event: MyEvent):void
		{
			if ( contenerID == event.targetContId ){
				if ( event.targetId == id){
					visible = false;
					thisDisable = true;
				}
			}
		}
          
		 private var image: flash.display.Bitmap;
		 
		 private var imageHover: flash.display.Bitmap;
		 
		 public var id: *;
		
		 private var loader1: flash.display.Loader;
		 
		 private var loader2: flash.display.Loader;
		 
		 private var progress: Number = 0;
		 
		 public var tweenIn:com.gskinner.motion.GTween;
		 
		 public var tweenOut: com.gskinner.motion.GTween;
		 
		 public static var HIDDEN:String="hidden";

         public static var READY:String="ready";
         
         public static var autoShowHide: Boolean = false;
         
         private var submenuController:* = null;
         
         private var isActive: Boolean = false;
		 
		 private var contenerID: String;         
		 
		 public var thisDisable: Boolean = true;
		 
	}
}