package viewsection.slideShow
{
	import flash.events.Event;
	import flash.text.*;
	
	import viewsection.scens.SceneBitmap;

	public class SlideShowItem extends SceneBitmap
	{
		public function SlideShowItem(url:String)
		{
			super( url );

            titleBlock =  new flash.text.TextField();

		}

		public function setTitle( title: XMLList ):void
		{
			
			titleBlock.text = title.@text;
			titleBlock.x = title.@x;
			titleBlock.y = 0;
			
			titleBlock.embedFonts = true;
			titleBlock.antiAliasType = AntiAliasType.ADVANCED;
			titleBlock.gridFitType = GridFitType.NONE;
			titleBlock.autoSize = TextFieldAutoSize.LEFT;;
			
			format = new TextFormat( Control.getInstance().getMyFont().fontName, 14 ); 
 			format.color = 0xFFFFFF;
 			format.size = 12;
			
			titleBlock.setTextFormat( format );
			
			titleBlock.alpha = 1;
			
			addChild( titleBlock );
		
		}
		
		override public function onStageResize(arg1:Number, arg2:Number):void
        {

				x = arg1/2-width/2;

				y =  arg2/2-(bitmap.height)/2;
				
				titleBlock.y = bitmap.height + 10  ;
				
				bitmap.x = width/2-bitmap.width/2; 
				
				addChild( titleBlock );
            
        }

		private var titleBlock: flash.text.TextField;
		
		private var  format: TextFormat;
	
	}
	
}