package viewsection.text
{
	import com.gskinner.motion.*;
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.net.*;
	import mx.effects.easing.*;	
	import flash.display.Sprite;
	import flash.text.*;

	public class TextController extends Sprite
	{
		public function TextController( arg1: XML )
		{
			super();
        
        
            loader = new flash.net.URLLoader( new flash.net.URLRequest( arg1.@url ) );
            
            loader.addEventListener(flash.events.Event.COMPLETE, onConfigLoad);
            
            this.addEventListener(flash.events.Event.ENTER_FRAME, preload);		
			
			textBlock =  new flash.text.TextField();
			
			textBlock.x = arg1.@x;
			textBlock.y = arg1.@y;

			textBlock.height = Number(arg1.@height);
			textBlock.width = Number(arg1.@width);
			
			textBlock.multiline = true; 
 			textBlock.wordWrap = true; 

            alpha = 1;
            visible = true;
            
		}

        public function preload(arg1:flash.events.Event):void
        {
            progress = loader.bytesLoaded / (loader.bytesTotal == 0 ? 1 : loader.bytesTotal);
            
            if (progress == 1)
            {
                this.removeEventListener(flash.events.Event.ENTER_FRAME, preload);
            }
            return;
        }
		
        private function onConfigLoad( event: Event ):void
        {
		    this.removeEventListener(flash.events.Event.COMPLETE, onConfigLoad);
		    
		    var loc2:* = loader.bytesLoaded;
		    var HTMLText: String = String(loader.data); 
		    setText( HTMLText );
		    
        }

		public function setText( HTMLText: String ):void
		{
			
			textBlock.embedFonts = true;
			textBlock.antiAliasType = AntiAliasType.ADVANCED;
			textBlock.gridFitType = GridFitType.NONE;
			textBlock.autoSize = TextFieldAutoSize.LEFT;
			
			 style = new StyleSheet(); 
			  
			 var styleObj:Object = new Object(); 
			 styleObj.fontSize = "16"; 
			 styleObj.color = "#FFFFFF";
			 styleObj.fontFamily = Control.getInstance().getMyFont().fontName;
			 style.setStyle("p", styleObj);
			 
			textBlock.styleSheet = style;
			
			textBlock.htmlText = HTMLText;
			
			textBlock.alpha = 1;
			
			addChild( textBlock );
		
		}
		
       public function getProgress():Number
        {
        	return  progress;
        }
        
        public function show():void
        {
		            visible = true;
		            //tweenIn.play();
		            return;
        }
        
        public function hide():void
        {
		            //tweenOut.play();
	              visible = false;
		            return;
        }
        
        public function onStageResize(arg1:Number, arg2:Number):void
        {
            return;	
        }        
        		
		private var textBlock: flash.text.TextField;
		
		private var  format: TextFormat;
		
		private var url: String = "";

        protected var bitmap:flash.display.Bitmap;
        
        protected var progress:Number = 0;
        
        private var loader: flash.net.URLLoader;
        
        public static var HIDDEN:String="hidden";

        public static var READY:String="ready";
        
        public var tweenIn: com.gskinner.motion.GTween;
        
        public var tweenOut: com.gskinner.motion.GTween;
        
        protected var hideComlete: Boolean = false; 
         
        public var autoShowHide: Boolean = false;
        
        public var noScale: Boolean = false;
        
        public var centrX: Boolean = false;
        
        protected var style:StyleSheet;
        
	}
	
}