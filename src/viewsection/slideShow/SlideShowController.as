package viewsection.slideShow
{
	import com.gskinner.motion.*;
	
	import flash.events.Event;
	import flash.geom.Rectangle;
	
	import mx.effects.easing.*;
	
	import viewsection.MyEvent;
	import viewsection.scens.*;

	public class SlideShowController extends SceneController implements Resize
	{
		public function SlideShowController(lurl:String, pOnTop:Boolean)
		{
			super(lurl, pOnTop);
			
			Control.getInstance().addEventListener(MyEvent.PREV_IMAGE, prev);
			
			Control.getInstance().addEventListener(MyEvent.NEXT_IMAGE, next);
			
			init();
			
		}

	    override public function show():void 
		{
            alpha = 1;

			elements[index].show();
				
			visible = true;
		} 
		
		
		protected function next( event: Event ):void
		{
			if ( visible ){
				
				if ( index < elements.length ){
			
					elements[index].hide();
					index++;
					elements[index].show();
					this.buttonControl();
			
				}
			
			}
		}
		
		protected function prev( event: Event ):void
		{
			if ( visible ){
				
				if ( index > 0 ){
					
					elements[index].hide();
					index--;	
					elements[index].show();
					this.buttonControl();
					
				}			

			}
		}
		
		private function buttonControl():void
		{
    		var e: MyEvent;
        		
			if ( index == elements.length-1 ){
	    		e = new MyEvent( MyEvent.QUICK_HIDE );
	    		e.targetId = "nextImage";
	    		e.targetContId = controlMenu;
	    		Control.getInstance().dispatchEvent( e );
			} else{
	    		e = new MyEvent( MyEvent.QUICK_SHOW );
	    		e.targetId = "nextImage";
	    		e.targetContId = controlMenu;
	    		Control.getInstance().dispatchEvent( e );
			}
			
			if ( index == 0 ){
	    		e = new MyEvent( MyEvent.QUICK_HIDE );
	    		e.targetId = "prevImage";
	    		e.targetContId = controlMenu;
	    		Control.getInstance().dispatchEvent( e );
			}else{
	    		e = new MyEvent( MyEvent.QUICK_SHOW );
	    		e.targetId = "prevImage";
	    		e.targetContId = controlMenu;
	    		Control.getInstance().dispatchEvent( e );
			}
			
		}

		override protected function onConfigLoad(event:Event):void 
		{ 
		    
		    var loc2:* = loader.bytesLoaded;
		    var property:XML;
		    var xml:XML = XML(loader.data); 
			var i:Number = 0;
			
			var h:* = int(xml.nastr.@height);
			
			var w:* = int(xml.nastr.@width);

			ax = int(xml.nastr.@x);
			
			ay = int(xml.nastr.@y);
			
			controlMenu = String(xml.nastr.@controlMenu);
			
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
					 
				}
				
				i++;     
			} 
			
			elementsCount = elements.length;
			return;
			
		}        
		

		
		protected function getIndex():Number
		{
			return index;
		}
		
		protected function getElementsCount():Number
		{
			return elements.lenght;
		}

        override public function onStageResize(arg1:Number, arg2:Number):void
        {

			if ( ax != 0 ){

				var x1:Number = arg1/2-arg1/2;
				x = x1 + ax;
				
			}else{

				x = arg1/2-width/2;

			}

			if ( ay != 0 ){

				var y1:Number = arg2/2-arg2/2;
				y = y1 + ay;
				
			}else{

				y =  arg2/2-height/2;

			}
			
			var i: Number = 0;
			
			for ( i = 0; i <  elements.length; i++ ){
				
				elements[i].onStageResize( width, height );
				
			}
			
            return;
            
        }
        		
		override protected function addImage( property:XML ):void
		{
				
			elements.push( new SlideShowItem( property.image.@url ) ) ;
			
			var i: Number = elements.length - 1;
			
			addChild( elements[i] );

			if ( property.image.@visible != ""){
				
				elements[i].visible = property.image.@visible == "true" ? true : false;
			
			}
			
			if ( property.title.@text != "" ){
				
				elements[i].setTitle( property.title );
			
			}
			
			if ( property.image.@y != ""){
				
				elements[i].y = int(property.image.@y);
			
			}
	
			if ( property.image.@x != ""){
				
				elements[i].y = int(property.image.@x);
			
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
	
		protected var index: Number = 0;
		
		protected var controlMenu: String = "";
		

	}
		
}