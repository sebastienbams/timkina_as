package
{
	import data.*;
	
	import flash.display.*;
	import flash.events.*;
	import flash.net.*;
	import flash.text.Font;
	import flash.system.*;
	
	import viewsection.MyEvent;
	import viewsection.menu.*;
	import viewsection.scens.*;
	import viewsection.siteloader.*;
	import viewsection.sound.*;	

    
	public class Control extends flash.display.Sprite
	{
        public function Control(arg1:Function=null)
        {
            super();
            if (arg1 != Control.getInstance)
            {
                throw new Error("*Control is a singleton, use getInstance()");
            }
            if (Control.instance != null)
            {
                throw new Error("*Control is a singleton, only instantiate once");
            }
            instance = this;
            init();
            return;
        }
        
        public static function getInstance():Control
        {
            if (Control.instance == null)
            {
                Control.instance = new Control(arguments.callee);
            }
            return instance;
        }


        private function init():void
        {
            
            graphics.beginBitmapFill(new BkgImage().bitmapData);
			graphics.drawRect(0, 0, 1920, 1200);            
            
            loader = new flash.net.URLLoader(new flash.net.URLRequest("data/scens.xml"));
            
            loader.addEventListener(flash.events.Event.COMPLETE, onConfigLoad);
            
			
			fontLoader = new Loader();
			addChild(fontLoader);
			
			// Параметры, передаваемые loader-у
			var req:URLRequest = new URLRequest("data/Arial.swf");
			
			fontLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, completeHandler);
            fontLoader.load(req);
            
        }
        
		private function completeHandler(event:Event):void
		{
			trace("loader.contentLoaderInfo.applicationDomain == " + fontLoader.contentLoaderInfo.applicationDomain);
			
			// Возьмем класс Arial (который мы указали при создании символа шрифта)
			// из текущего домена. 
			MyFontClass = fontLoader.contentLoaderInfo.applicationDomain.getDefinition("ArialFontClass") as Class;
			Font.registerFont( MyFontClass );
			myFont  = new MyFontClass();
			
			// Можно посмотреть весь список шрифтов
			// var fonts:Array = Font.enumerateFonts(true);
			// for each (var font:Font in fonts)
			// {
			//	trace(font.fontName);
			// }
			
			trace("arialFont.fontName: " + myFont.fontName);
		}
		
		public function getMyFont():Font
		{
			return myFont;
		}
       	
       	public function getMaxHeight():Number
       	{
       		return maxHeight;
       	} 
       
       	public function getMaxWidth():Number
       	{
       		return maxWidth;
       	} 

        private function onConfigLoad( event: Event ):void
        {
		    var loc2:* = loader.bytesLoaded;
		    var property:XML;
		    var xml:XML = XML(loader.data); 
			var i:Number = 0;
			
			if ( xml.nastr.@showMenu == "1" ){
				flash.system.fscommand("showmenu", "true");
			}
			maxHeight = int(xml.nastr.@height);
			
			maxWidth = int(xml.nastr.@width);

			for each (property in xml.item) 
			{
				var s:viewsection.scens.SceneController;
				
				var onTop:Boolean;
				onTop = property.@onTop == "1" ? true : false;
				
				s = new viewsection.scens.SceneController( property.@url, onTop );
				
				var id:String;
				
				id = property.@id;
				
				addChild( s ).name =  id;
				
				scens.push( id );
				
				var a:Boolean;
				var b:Boolean;
				
				a = property.@autoLoad == "1" ? true : false;
				b = property.@autoShow == "1" ? true : false;
				
				if ( a ){
					scensToLoad.push( id );
				}

				if ( b ){
					scensToShow.push( id );
				}
				
			} 

			siteloader = new viewsection.siteloader.Siteloader();
            addChild(siteloader);
            
            sounds = new viewsection.sound.SoundController();
            onStageResize(stageWidth, stageHeight);
            
            _sceneProc(null);

        }
        
        private function processHideScene(event: Event):void
        {
			var element:*;	
			var loc:Number = 0;
			
			for each ( element in scensToHide ) 
			{
				var t:* = viewsection.scens.SceneController(getChildByName( element )).visible;
				var t1:* = viewsection.scens.SceneController(getChildByName( element )).getProgress()
				loc += ( t &&  t1 == 1 ) ? 0 : 1;
			} 
			
			if ( loc / scensToHide.length == 1 ){
				
				this.removeEventListener(flash.events.Event.ENTER_FRAME, processHideScene);
				this.dispatchEvent(new flash.events.Event(Control.ALL_HIDE));
			}
			
            return;
        }

		public function getSiteloader():viewsection.siteloader.Siteloader
		{
			return siteloader;
		}
        
        public function getDelta():Number
        {
        	return delta;
        }
        
        public function getStageWidth():Number
        {
        	return stageWidth;
        }
 
        public function getStageHeight():Number
        {
        	return stageHeight;
        }
        
                
        public function onStageResize(arg1:Number, arg2:Number):void
        {
            var loc1:*;
            loc1 = null;
            
            var deltaX:Number = arg1 / stageWidth ; 
            var deltaY:Number = arg2 / stageHeight ;
			
			delta = ( Math.abs( 1-deltaX) > Math.abs(1-deltaY) ? deltaX : deltaY );
	
            stageWidth = arg1;
            
            stageHeight = arg2;
            
            if (siteloader)
            {
                siteloader.onStageResize(stageWidth, stageHeight);
            }
            
			var element:String;
			var i:Number = 0;
			var progress:Number = 0;
			
			for each ( element in scens ) 
			{
				var t:viewsection.scens.SceneController;
								
				if ( viewsection.scens.SceneController(getChildByName(element)).getProgress() == 1 ){
					viewsection.scens.Resize(getChildByName(element)).onStageResize(stageWidth, stageHeight);	
				}
			}

            return;
        }        
		
		
		
        public function menuEvent( arg1: String ):void
        {
        	
        	var e:MyEvent;
        	
        	switch ( arg1 ){
        		
        		case "rus":

					scensToHide.push( "intro" );
					
					_showHideScene( "mainmenu", false, "ru" );
					_showHideScene( "intro", false, "ru" );
					
					_showHideScene("gal", true, "en");
					_showHideScene("gal_pw", true, "en");
					
					_menuGalProc_en("");
					
        			break;

        		case "eng":
					
					scensToHide.push( "intro" );

					_showHideScene( "mainmenu", false, "en" );
					_showHideScene( "intro", false, "en" );
					
					_showHideScene( "gal", true, "ru" );
					_showHideScene( "gal_pw", true, "ru" );

					_menuGalProc_ru( "" );

        			break;

        	case "publ_ru":
			
					_showHideScene( "publics", false, "ru" );
					
					_showHideScene( "about", true, "ru" );
					_showHideScene( "intro", true, "ru" );
					_showHideScene( "gal", true, "ru" );
					_showHideScene("gal_pw", true, "ru");
					_menuGalProc_ru( "" );
					
        			_eventSend( MyEvent.SELECT, "publ_ru", "menu1" );
					
        		break;
        	
        	case "about_ru":

					_showHideScene( "about", false, "ru" );
					
					_showHideScene( "publics", true, "ru" );
					_showHideScene( "intro", true, "ru" );
					_showHideScene( "gal", true, "ru" );
					_showHideScene("gal_pw", true, "ru");
					_menuGalProc_ru( "" );
					
        			_eventSend( MyEvent.SELECT, "about_ru", "menu1" );
					
        		break;
        		
       		case "gal_ru":
       			
       			_showHideScene("gal", false, "ru");
       			_showHideScene("gal_pw", false, "ru");
       			
       			_showHideScene( "publics", true, "ru" );
       			_showHideScene("about", true, "ru");
       			_showHideScene("intro", true, "ru");

       			_eventSend( MyEvent.SELECT, "gal_ru", "menu1" );
        		
        		break;

       		case "gal_en":
       			_showHideScene("gal", false, "en" );
       			_showHideScene("gal_pw", false, "en");
       			
       			_showHideScene("intro", true, "ru");
       			_showHideScene( "publics", true, "ru" );
       			_showHideScene("about", true, "en");
       			_showHideScene("intro", true, "en");
       			
       			_eventSend( MyEvent.SELECT, "gal_en", "menu1_en" );
        		break;

       		case "portrait_ru":
       		case "natute_ru":
       		case "landscape_ru":
       		case "compo_ru":
       		case "book_ru":
       		case "ris_ru":
        		_showHideScene("gal_pw", true, "ru");
        		_menuGalProc_ru( arg1 );
        		break;
        		
       		case "portrait_en":
       		case "natute_en":
       		case "landscape_en":
       		case "compo_en":
       		case "book_en":
       		case "ris_en":
        		_showHideScene("gal_pw", true, "en");
        		_menuGalProc_en( arg1 );
        		break;

       		case "nextImage":
       		case "prevImage":
       		
        		e = new MyEvent( arg1 );
        		e.targetId = "1";
        		this.dispatchEvent( e );
        		
        		break;
			
        	} 
        	_sceneProc(null);
        }
        
        
        private function _showHideScene ( scene: String, isHide: Boolean, lang: String ):void
        {
			if ( !isHide ){
			
				scensToShow.push( scene+_languages[lang] );
				
				if ( viewsection.scens.SceneController(getChildByName( scene+_languages[lang] )).getProgress() != 1 ){
					scensToLoad.push( scene+_languages[lang] );	
				}
				
				for ( var key:* in _languages ){
					
					if ( key != lang ){ 
						scensToHide.push( scene + _languages[key] );
					}
					
				}
			
			}else{
				
				scensToHide.push( scene+_languages[lang] );
			
			}
			
	    	return;    	
        }
        
        private function _eventSend( _mes: String, _to: String, _cont: String ):void
        {
    		var e:MyEvent;
    		e = new MyEvent( _mes );
    		e.targetId = _to;
			e.targetContId = _cont;
			this.dispatchEvent( e );
        }
        
        private function _menuGalProc_ru( arg1: String ):void
        {
			var toShow:String = "";
			
			var loc1:* = {"portrait_ru": 	"gal_portets_ru",
						  "landscape_ru": 	"gal_pez_ru", 
						  "natute_ru": 		"gal_natur_ru", 
						  "compo_ru": 		"gal_compo_ru",
						  "book_ru": 		"gal_book_ru", 
						  "ris_ru": 		"gal_ris_ru"
						 }; 
			
			for ( var key:* in loc1 ){
				
				if ( key != arg1 ) {
					scensToHide.push( loc1[key] );
				}
				 
			}
			
			toShow = loc1[arg1] != null ? loc1[arg1] : "" ; 
			
			if ( toShow != "" ){
				scensToShow.push( toShow );
				
				if ( viewsection.scens.SceneController(getChildByName( toShow )).getProgress() != 1 )
				{
					scensToLoad.push( toShow );	
				}
			}
    		
    		_eventSend ( MyEvent.SELECT, arg1, "gal_menu_ru" ); 

        	return;
        }

        private function _menuGalProc_en( arg1: String ):void
        {
			var toShow:String = "";
			
			var loc1:* = {"portrait_en": 	"gal_portets_en",
						  "landscape_en": 	"gal_pez_en", 
						  "natute_en": 		"gal_natur_en", 
						  "compo_en": 		"gal_compo_en",
						  "book_en": 		"gal_book_en", 
						  "ris_en": 		"gal_ris_en"
						 }; 
			
			for ( var key:* in loc1 ){
				
				if ( key != arg1 ) {
					scensToHide.push( loc1[key] );
				}
				 
			}
			
			toShow = loc1[arg1] != null ? loc1[arg1] : "" ; 
			
			if ( toShow != "" ){
				scensToShow.push( toShow );
				
				if ( viewsection.scens.SceneController(getChildByName( toShow )).getProgress() != 1 )
				{
					scensToLoad.push( toShow );	
				}
			}
    		
    		_eventSend ( MyEvent.SELECT, arg1, "gal_menu_en" ); 

        	return;
        }

        
        private function _sceneProc(arg1:flash.events.Event):void
        {
        	var element:*;
        	
        	if ( arg1 != null ){
        		if ( arg1.type == Control.ALL_HIDE ){
        			scensToHide = new Array();
        		}
        	}
        	
        	if ( scensToHide.length != 0 ) // нужно скрыть сцены
        	{
				this.addEventListener(flash.events.Event.ENTER_FRAME, processHideScene);
				this.addEventListener(Control.ALL_HIDE, _sceneProc);

				for each ( element in scensToHide ) 
				{
					if ( viewsection.scens.SceneController(getChildByName( element )).getProgress() == 1 ){
						viewsection.scens.SceneController(getChildByName( element )).hide();	
					} 
					
				} 
				
				return;
        	}

        	if ( scensToLoad.length != 0 && !siteloader.visible && scensToHide.length == 0 ) // нужна загрузка
        	{
	        	scensToHide = new Array();
	        	stage.addEventListener(viewsection.siteloader.Siteloader.ALL_LOAD, _sceneProc);
	        	siteloader.show();
	        	for each ( element in scensToLoad ){
	        		viewsection.scens.SceneController(getChildByName( element )).load();
	        	}
	        	return;
        	}

        	if ( scensToLoad.length != 0 && siteloader.visible && scensToHide.length == 0 ) // закончена загрузка
        	{
        		scensToLoad = new Array();
        		stage.addEventListener(viewsection.siteloader.Siteloader.HIDE, _sceneProc);
        		siteloader.hide();
        		return;
        	}
        	
        	if ( scensToShow.length != 0 && scensToLoad.length == 0 && scensToHide.length == 0  && !siteloader.visible ) // закончена загрузка
        	{
	        	for each ( element in scensToShow ){
	        		
	        		if ( viewsection.scens.SceneController(getChildByName( element )).isOnTop() ){
	        			var j:Number = getChildIndex(getChildByName( "gal_ru" ));
	        			
	        			setChildIndex( viewsection.scens.SceneController(getChildByName( element )), 1 );
	        		}
	        		
	        		viewsection.scens.SceneController(getChildByName( element )).show();
	        		
	        	}

	        	for each ( element in scens ){
	        		
	        		if ( viewsection.scens.SceneController(getChildByName( element )).isOnTop() ){
	        			
	        			addChild(getChildByName( element ));
	        		}
	        		
	        	}

	        	scensToShow = new Array();
	        	onStageResize(stageWidth, stageHeight);

	        	return;
        	
        	}
        	
        }
        
        public function getProgress():Number 
        {
			var element:String;
			var i:Number = 0;
			var progress:Number = 0;
			
			for each (element in scensToLoad) 
			{
				progress += viewsection.scens.SceneController(getChildByName( element )).getProgress(); 
			} 
			
			return progress / scensToLoad.length;
        }

		private var siteloader:viewsection.siteloader.Siteloader;
		
		private var scens:Array = new Array(); 
		
        private var stageHeight:Number;

        private var stageWidth:Number;		
        
        private var sounds:viewsection.sound.SoundController;

		private static var instance:Control;
		
		private var delta:Number;
		
		private var loader: flash.net.URLLoader;
		
		private var fontLoader: Loader;
		
		private var progress: Number = 0;
		
		private var scensToLoad: Array = new Array();
		
		private var scensToShow: Array = new Array();
		
		private var scensToHide: Array = new Array();
		
		public static var ALL_HIDE:String="ALL_HIDE";
		
		private var maxWidth:Number = 0;
		
		private var maxHeight:Number = 0;
		
		private var MyFontClass:Class;
		
		private var myFont: Font;
		
		private var _languages: * = {"ru": "_ru", "en": "_en"};
		
	}
}