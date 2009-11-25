package viewsection.scens
{
	import com.gskinner.motion.*;
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Rectangle;
	import flash.net.*;
	
	import mx.effects.easing.*;
	
	import viewsection.menu.*;
	import viewsection.slideShow.*;
	import viewsection.text.*;
	
	
	public class SceneController extends flash.display.Sprite implements Resize
	{
		public function SceneController( lurl: String, pOnTop:Boolean )
		{
			super();
			url = lurl;
			onTop = pOnTop;
		}
		
        public function load():void
        {
        	init();
        }
        
        public function getProgress():Number
        {
			var loc1:Number = 0;
			var i:Number = 0; 
			
			if ( elements.length != 0 ){
				for ( i=0; i < elementsCount; i++){
					loc1 += elements[i].getProgress();
				}
				
				loc1 = loc1/elementsCount;
				return loc1;
				
			}else{
				return 0;
			}   
			        
        }

        public function onStageResize(arg1:Number, arg2:Number):void
        {

			var w:* = width * Control.getInstance().getDelta();
			var h:* = height * Control.getInstance().getDelta();
			var scale:Boolean = false;
			
			if ( ( w <= Control.getInstance().getStageWidth() && h <= Control.getInstance().getStageHeight() )
			      && 
			      !( width <= Control.getInstance().getStageWidth() &&  height <= Control.getInstance().getStageHeight() )
			      &&
			       Control.getInstance().getDelta() < 1
			    ) 
			{
				scale = true;
			}
			
			if ( ( w <= Control.getInstance().getStageWidth() && h <= Control.getInstance().getStageHeight() )
			      &&
			       Control.getInstance().getDelta() > 1
			    ) 
			{
				scale = true;
			}

			if  ( scale ) {
	
				var rect:Rectangle = scrollRect;
				
				//rect.height  *= Control.getInstance().getDelta();
				
				//rect.width *= Control.getInstance().getDelta();
				
				//scrollRect = rect;	
				
				//width *= Control.getInstance().getDelta();

				//height *= Control.getInstance().getDelta();
				
				var loc1:Number = 0;

				
			}

			var i:Number = 0; 
			
			if ( elements.length != 0 && resizeChilds ){

				for ( i=0; i < elementsCount; i++){

					elements[i].onStageResize( width, height );

				}

			}
			
			if ( ax != 0 ){

				var x1:Number = arg1/2-Control.getInstance().getMaxWidth()/2;
				x = x1 + ax;
				
			}else{

				x = arg1/2-width/2;

			}
			

			if ( ay != 0 ){

				var y1:Number = arg2/2-Control.getInstance().getMaxHeight()/2;
				y = y1 + ay;
				
			}else{

				y =  arg2/2-height/2;

			}

							
			
            return;
        }
        
        protected function init():void
        {

            loader = new flash.net.URLLoader(new flash.net.URLRequest( url ));
            
            loader.addEventListener(flash.events.Event.COMPLETE, onConfigLoad);
            
            alpha = 0;
            
        }

		public function show():void 
		{
            alpha = 1;

			for ( var i:* = 0; i < elementsCount; i++){

				elements[i].show();

			}
			
			visible = true;
		} 

		public function hide():void 
		{
			
			this.addEventListener(flash.events.Event.ENTER_FRAME, hiding);
			
			for ( var i:* = 0; i <  elements.length; i++){

				if ( elements[i].visible ){
					
					elements[i].hide();	
				
				}
				

			}
			
			
		} 
		
		protected function onHideComlete( ):void
		{
			
			this.removeEventListener(flash.events.Event.ENTER_FRAME, hiding);
			
			visible = false;
			
		}
		
		protected function hiding( event: Event ):void
		{
			var loc:* = 0;
			
			for ( var i:* = 0; i < elements.length; i++){

				loc += !elements[i].visible ? 1 : 0 ;

			}			
			
			if ( loc / elements.length == 1 ){
				onHideComlete();
			}
			
		}

		
		protected function onConfigLoad(event:Event):void 
		{ 
		    
		    var loc2:* = loader.bytesLoaded;
		    var property:XML;
		    var xml:XML = XML(loader.data); 
			var i:Number = 0;
			
			var h:* = int(xml.nastr.@height);
			
			var w:* = int(xml.nastr.@width);

			ax = int(xml.nastr.@x);
			
			ay = int(xml.nastr.@y);
			
			resizeChilds = int(xml.nastr.@resizeChilds) == 1 ? true : false ;
			
			toLeft = int(xml.nastr.@toLeft) == 1 ? true : false ;
			
			scrollRect = new Rectangle(0, 0, w, h );
			
			for each (property in xml.item) 
			{ 
				
				switch ( String( property.@type ) ){
					
					case "image":
					
							addImage( property );
								
					break;
					
					case "menu":
					
							addMenu( property );
							
					break;

					case "slideShow":
					
							addSlideShow( property );
							
					break;
					
					case "text":
							addText( property );
					 
				}
				
				i++;     
			} 
			
			elementsCount = elements.length;
			return;
			
		}        

		public function getAutoLoad():Boolean
		{
			return autoLoad;
		}

		public function setAutoLoad ( arg1: Boolean ):void
		{
			autoLoad = arg1;
			return;
		}
		
		protected function addImage( property:XML ):void
		{
				
				elements.push( new SceneBitmap( property.image.@url ) ) ;
				
				var i: Number = elements.length - 1;
				
				addChild( elements[i] );
				
				if ( property.image.@x != ""){
					
					elements[i].x = int(property.image.@x);
				
				}
				
				if ( property.image.@y != ""){
					
					elements[i].y = int(property.image.@y);
				
				}

				if ( property.image.@alpha != ""){
					
					elements[i].alpha = int( property.image.@alpha );
				
				}

				if ( property.image.@noScale != ""){
					
					elements[i].noScale = int( property.image.@noScale ) == 1 ? true : false ;
				
				}

				if ( property.image.@centrX != ""){
					
					elements[i].centrX = int( property.image.@centrX ) == 1 ? true : false ;
				
				}

				if ( property.image.@autoShowHide != ""){
					
					elements[i].autoShowHide = int( property.image.@autoShowHide ) == 1 ? true : false;
				
				}else{
					elements[i].autoShowHide  = false;
				}

				var effect:*;
				var param:String;
				var arr:*;
					
					arr = new Array();
					
					for each (effect in property.tweenIn.effect) 
					{
						param = effect.@paramert;
						arr[param] = Number(effect.@value);
					} 			
					
					elements[i].tweenIn = new com.gskinner.motion.GTween(elements[i], Number(property.tweenIn.@duration), arr, {"paused":true, "autoPlay": false,  "ease":mx.effects.easing.Linear.easeIn, "completeListener":elements[i].onShowComplete});
				    
					if ( property.tweenIn.@delay != ""){
					
						elements[i].tweenIn.delay = Number( property.tweenIn.@delay );
				
					}				
				

					
					arr = new Array();
					
					for each (effect in property.tweenOut.effect) 
					{
						param = effect.@paramert;
						arr[param] = Number(effect.@value);
					} 
					
					
					elements[i].tweenOut = new com.gskinner.motion.GTween(elements[i], Number(property.tweenOut.@duration), arr, {"paused":true, "autoPlay": false, "ease":mx.effects.easing.Linear.easeOut, "completeListener":elements[i].onHideComplete});
				
					if ( property.tweenOut.@delay != ""){
					
						elements[i].tweenOut.delay = Number( property.tweenOut.@delay );
				
					}				
				

				return;
		}
		
		protected function addSlideShow( property:XML ):void
		{
				
			elements.push( new SlideShowController( property.@url, property.@id  ) ) ;
			
			elements[elements.length-1].name = property.@id;
			
			addChild( elements[elements.length-1] );
			
			return;
				
		}
		
		protected function addText( property:XML ):void
		{
				
			elements.push( new TextController( property ) ) ;
			
			elements[elements.length-1].name = property.@id;
			
			addChild( elements[elements.length-1] );
			
			return;
		}
			
		
		protected function addMenu( property:XML ):void
		{
				
			elements.push( new MenuController( property.@url, property.@id  ) ) ;
			
			elements[elements.length-1].name = property.@id;
			
			addChild( elements[elements.length-1] );
			
			return;
				
		}
		
		public function isOnTop():Boolean
		{
			return onTop;	
		}
		
		protected var elementsCount:Number = 1;
		
		protected var loader:flash.net.URLLoader;
		
		protected var elements:Array = new Array();
		
		protected var url:String;
		
		protected var autoLoad:Boolean = false;
		
		protected var onTop: Boolean = false;
		
		protected var toLeft: Boolean = false; 		
		
		protected var ax:Number = 0;
		
		protected var ay:Number = 0;
		
		protected var resizeChilds: Boolean;
		  
	}
}