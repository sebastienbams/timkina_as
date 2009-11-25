package viewsection.menu
{
	import com.gskinner.motion.*;
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.net.*;
	import mx.effects.easing.*;
	import  viewsection.MyEvent;

	public class MenuController extends Sprite
	{
		public function MenuController( lurl: String, lid: String )
		{
			super();
			id = lid;
			url = lurl;
			init();
		}
		
        private function init():void
        {

            loader = new flash.net.URLLoader(new flash.net.URLRequest(url));
            
            loader.addEventListener(flash.events.Event.COMPLETE, onConfigLoad);
            
            this.addEventListener(flash.events.Event.ENTER_FRAME, preload);
            
            alpha = 0;
            
        }
        
        public function preload(arg1:flash.events.Event):void
        {
            var loc1:*;
            var loc2:*;
            
            loc2 = loader.bytesLoaded / (loader.bytesTotal == 0 ? 1 : loader.bytesTotal);
            
            loc1 = ( loc2 +  getElementsProgres() ) / 2;
            
            progress = loc1;
            
            if ( progress == 1 )
            {
                this.removeEventListener(flash.events.Event.ENTER_FRAME, preload);
            }
            
            return;
        }
		
        private function getElementsProgres():Number
        {
			var loc1:Number = 0;
			var i:Number = 0; 
			
			if ( elements.length != 0 ){
				for ( i=0; i < elements.length ; i++){
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

			/*width *= Control.getInstance().getDelta();
			height *= Control.getInstance().getDelta();*/

			x *= Control.getInstance().getDelta();
			//x =  arg1/2-w/2;

			y *= Control.getInstance().getDelta();
				
			/*if ( elements.length != 0 ){

				for ( var i:* =0; i < elements.length; i++ ){

					elements[i].onStageResize(arg1, arg2);

				}

			}*/

            return;
        }
		
		public function onConfigLoad(event:Event):void 
		{ 
		    var loc2:* = loader.bytesLoaded;
		    var property:XML;
		    var xml:XML = XML(loader.data); 
			var i:Number = 0;
			
			h = int(xml.nastr.@height);
			
			w = int(xml.nastr.@width);
			
			//scrollRect = new Rectangle(0, 0, w, h );
			
			x = int(xml.nastr.@x);
			
			y = int(xml.nastr.@y);
			
            var logoZast:* = new flash.display.Sprite();
	        logoZast.graphics.beginFill(0xAAFFFF,0);
            logoZast.graphics.drawRect(0, 0, w, h );
            logoZast.graphics.endFill();
            
            addChild(logoZast);

			for each (property in xml.item) 
			{ 
				
				elements[i] =  new MenuItem( property.@id,  property.@image, property.@imageHover, id );
				
				addChild( elements[i] );
				
				if ( property.@x != ""){
					
					elements[i].x = int(property.@x);
				
				}
				
				if ( property.@y != ""){
					
					elements[i].y = int(property.@y);
				
				}

				if ( property.@alpha != ""){
					
					elements[i].alpha = int( property.@alpha );
				
				}
				
				elements[i].thisDisable = property.@disable == "true" ? true : false ;
				
				var rrr:*;
				for each (rrr in property.submenu) 
				{
					elements[i].createSubMenu ( String(rrr.@url), String(rrr.@id) ) ;
					
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
			
				i++;     
			} 
			
			elementsCount = elements.length;			
		}
		
		public function getProgress(): Number
		{
			return progress;			
		}
		
		public function show():void 
		{
            
            alpha = 1;
            visible = true;

			for ( var i:* = 0; i < elements.length; i++){

				elements[i].show();

			}
			return;

		} 
		
		public function hide():void 
		{
			
			this.addEventListener(flash.events.Event.ENTER_FRAME, hiding);
			
			for ( var i:* = 0; i <  elements.length; i++){

				elements[i].hide();

			}
			
			return;

		} 
		
		private function onHideComlete( ):void
		{
			
			this.removeEventListener(flash.events.Event.ENTER_FRAME, hiding);
			
			visible = false;
			return;
			
		}
		
		private function hiding( event: Event ):void
		{
			var loc:* = 0;
			
			for ( var i:* = 0; i < elements.length; i++){

				loc += !elements[i].visible ? 1 : 0;

			}			
			
			if ( loc / elements.length == 1 ){
				onHideComlete();
			}
			return;
			
		}
		
		
		
		

		private var elements: Array = new Array();
		
		private var elementsCount: Number = 1;
		
		private var loader: flash.net.URLLoader;		
		
		private var url: String;
		
		private var progress: Number = 0;
		
		private var id: String = "";
		
		private var h:*;
			
		private var w:*;

		
	}
}