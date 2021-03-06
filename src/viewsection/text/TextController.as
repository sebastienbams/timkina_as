package viewsection.text
{
	import com.gskinner.motion.*;
	
	import flash.display.*;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	import flash.net.*;
	import flash.text.*;
	
	import mx.effects.easing.*;

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
			
			maxHeight = textBlock.height;
			
			scrollAble = ( arg1.@scroll == "1" ) ? true : false;
			
                    
            if ( scrollAble ){
            	
	            upScroll = new flash.display.Sprite();
	            upScroll.addChild(new viewsection.text.UpScroll());
	            upScroll.y = 0;
	            upScroll.x = textBlock.width;
				upScroll.alpha = 1;
	
	            downScroll = new flash.display.Sprite();
	            downScroll.addChild(new viewsection.text.DownScroll());
	            downScroll.y = textBlock.height-downScroll.height;
	            downScroll.x = textBlock.width;
				downScroll.alpha = 1;
				
	            begScroll = new flash.display.Sprite();
	            begScroll.addChild(new viewsection.text.ScrollBeg());
	            begScroll.y = upScroll.height;
	            begScroll.x = textBlock.width;
				begScroll.alpha = 1;
	
				var rect:Rectangle = new Rectangle( textBlock.width - downScroll.width, 0, downScroll.width, textBlock.height-downScroll.height*2 );
				
				var square:Shape = new Shape();
				
				square.graphics.beginBitmapFill(new ScrollBar().bitmapData);
				square.graphics.drawRect(textBlock.width, downScroll.height, downScroll.width, maxHeight-downScroll.height*2);
	
				addChild(square);

	            upScroll.addEventListener(flash.events.MouseEvent.CLICK, mouseUpScroll);
    	        downScroll.addEventListener(flash.events.MouseEvent.CLICK, mouseDownScroll);
            	
				addChild(downScroll);
				addChild(upScroll);
				addChild(begScroll);
				
				
            
            }
			
			h = Number(arg1.@height);
			w = Number(arg1.@width);
			
			textBlock.multiline = true; 
 			textBlock.wordWrap = true; 

            alpha = 1;
            visible = true;
            
            
		}

		public function mouseDownScroll(event:MouseEvent):void
		{
			if ( visible ){

				//textBlock.scrollV += scrollStep;
				
				tweenScrollDown = new com.gskinner.motion.GTween(textBlock, 0.3, {"scrollV": (textBlock.scrollV+scrollStep) }, {"ease":mx.effects.easing.Linear.easeIn});
				
				var inc:Number = ( ( maxHeight-downScroll.height*2 ) / textBlock.maxScrollV ) * scrollStep; 
				 
				var newY:Number = begScroll.y + inc;
				newY = textBlock.scrollV+scrollStep >= textBlock.maxScrollV  ? maxHeight-upScroll.height-begScroll.height : newY ;
				
				tweenScrollBeg = new com.gskinner.motion.GTween(begScroll, 0.3, {"y": (newY) }, {"ease":mx.effects.easing.Linear.easeIn});
				
				tweenScrollBeg.play(); 
				tweenScrollDown.play(); 

			}
		}
			
		public function mouseUpScroll(event:MouseEvent):void
		{
			if ( visible ){
				
				//textBlock.scrollV -= scrollStep;
				  
				tweenScrollUp = new com.gskinner.motion.GTween(textBlock, 0.3, {"scrollV": (textBlock.scrollV-scrollStep) }, {"ease":mx.effects.easing.Linear.easeIn});
				
				var inc:Number = ( ( maxHeight-downScroll.height*2 ) / textBlock.maxScrollV ) * scrollStep;
				
				var newY:Number = begScroll.y - inc;
				newY = newY <= upScroll.y+upScroll.height  ? upScroll.y+upScroll.height : newY ;
				
				tweenScrollBeg = new com.gskinner.motion.GTween(begScroll, 0.3, {"y": (newY) }, {"ease":mx.effects.easing.Linear.easeIn});
				
				tweenScrollBeg.play(); 
				
				tweenScrollUp.play(); 				
				 
			}
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
			
			//scrollRect = new Rectangle(0, 0, w+50, h);
			//
			textBlock.embedFonts = true;
			//textBlock.antiAliasType = AntiAliasType.ADVANCED;
			textBlock.gridFitType = GridFitType.NONE;
			//textBlock.autoSize = TextFieldAutoSize.LEFT;
			
			 style = new StyleSheet(); 
			  
			 var styleObj:Object = new Object(); 
			 styleObj.fontSize = "16"; 
			 styleObj.color = "#FFFFFF";
			 styleObj.fontFamily = Control.getInstance().getMyFont().fontName;
			 style.setStyle("p", styleObj);

			 var styleObj1:Object = new Object(); 
			 styleObj1.fontSize = "25"; 
			 styleObj1.color = "#FFFFFF";
			 styleObj1.fontFamily = Control.getInstance().getMyFont().fontName;

			 style.setStyle("h1", styleObj1);
			 
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
        
        private var h:Number = 0;
        
        private var w:Number = 0;
        
        private var upScroll:flash.display.Sprite;
        
        private var downScroll:flash.display.Sprite;
        
        private var begScroll:flash.display.Sprite;
        
        private var scrollAble:Boolean = false;
        
        private var scrollStep:Number = 10;
        
        private var maxHeight:Number = 0;
        
        private var tweenScrollDown: com.gskinner.motion.GTween;
        private var tweenScrollUp: com.gskinner.motion.GTween;
        private var tweenScrollBeg: com.gskinner.motion.GTween;
        
	}
	
}