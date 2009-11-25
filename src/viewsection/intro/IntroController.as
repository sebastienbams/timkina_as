package viewsection.intro
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.net.*;
	
	public class IntroController extends flash.display.Sprite
	{
		public function IntroController()
		{
			super();
			init();
		}
		
        public function preload(arg1:flash.events.Event):void
        {
            var loc1:*;
            var loc2:*;
            
            loc2 = loader.bytesLoaded / (loader.bytesTotal == 0 ? 1 : loader.bytesTotal);
            
            loc1 = ( loc2 +  getElementsProgres() ) / 2;
            
            Control.getInstance().getSiteloader().setProgressIntro( loc1 );
            
            if (loc1 == 1)
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

			width *= Control.getInstance().getDelta();
			height *= Control.getInstance().getDelta();
			
			x =  arg1/2-width/2;
			y =  arg2/2-height/2;

			var loc1:Number = 0;
			var i:Number = 0; 
			
			if ( elements.length != 0 ){
				for ( i=0; i < elementsCount; i++){
					loc1 += elements[i].onStageResize(arg1, arg2);
				}
			}
			
            return;
        }
        
        private function init():void
        {
			var url:String;
			url = "data/intro.xml";

            loader = new flash.net.URLLoader(new flash.net.URLRequest(url));
            loader.addEventListener(flash.events.Event.COMPLETE, onConfigLoad);
            
            this.addEventListener(flash.events.Event.ENTER_FRAME, preload);
            
            alpha = 0;
        }

		public function setProgressIntro(loca:Number):void 
		{
			
		} 
		
		public function show():void 
		{
            alpha = 1;
            visible = true;
		} 
		
		
		public function onConfigLoad(event:Event):void 
		{ 
		    
		    var loc2:* = loader.bytesLoaded;
		    var property:XML;
		    var xml:XML = XML(loader.data); 
			var i:Number = 0;
			
				
			for each (property in xml.item) 
			{ 
				elements[i] =  new IntroBitmap( property.image.@url );
				addChild(elements[i]);
				
				
				if ( property.@x != ""){
					elements[i].x = int(property.image.@x);
				}
				if ( property.@y != ""){
					elements[i].y = int(property.image.@y);
				}
				/*if ( property.@right != ""){
					elements[i].right = property.@right;
				}*/
				/*if ( property.@alpha != ""){
					elements[i].alpha = property.@alpha;
				}
				if ( property.@visible != ""){
					elements[i].visible = property.@visible;
				}*/
				
				i++;     
			} 
			
			elementsCount = elements.length;
			
			/*var s:String;
			var property:XML;
			var picName:XML;
			
		    var pattern:RegExp = /\s+<br\/>\s+/g;

        	realURL = myXML.realURL;

			slideTimer = new Timer(pausems, 1);
        	slideTimer.addEventListener(TimerEvent.TIMER_COMPLETE, onSlideTimerComplete); 
			
			header.htmlText = myXML.header.toString().replace(pattern,'\n\t') ;
			overview.htmlText = myXML.overview.toString().replace(pattern,'\n\t') ;
			contact.htmlText = myXML.contact.toString().replace(pattern,'\n\t') ;
			contact1.htmlText = myXML.contact1.toString().replace(pattern,'\n\t') ;

			
			for each (property in myXML.section.(@id=="past").item) 
			{ 

			    s = property.@id; 
				past.push(s);     
			} 
			for each (property in myXML.section.(@id=="present").item) 
			{ 
			    s = property.@id; 
				present.push(s);     
			} 

			for each (property in myXML.section.(@id=="future").item) 
			{ 
			    s = property.@id; 
				future.push(s);     
			} 
			fonTimer.start();
			*/
		}        

		private var elementsCount:Number = 1;
		
		private var loader:flash.net.URLLoader;
		
		private var elements:Array = new Array();
		        

	}
}