package viewsection.siteloader
{
    import com.gskinner.motion.*;
    
    import flash.display.*;
    import flash.events.*;
    import flash.geom.Rectangle;
    
    import mx.effects.easing.*;

	public class Siteloader extends Sprite
	{
		public function Siteloader()
		{
			 
			super();
            init();
            visible = false;
            return;
		}
		
        private function init():void
        {
            
            logo = new flash.display.Sprite();
            logo.addChild(new viewsection.siteloader.Siteloader_logoAsset());
            logo.y = int(logo.height * -0.5);
            logo.x = int(logo.width * -0.5);
			logo.alpha = 1;
            
			addChild(logo);
			
            logo1 = new flash.display.Sprite();
            logo1.addChild(new viewsection.siteloader.Siteloader_logoAsset1());
            logo1.y = int(logo1.height * -0.5);
            logo1.x = int(logo1.width * -0.5);
			logo1.alpha = 	1;
			var rect:Rectangle = new Rectangle( 0, 0, logo1.width, logo1.height );
			logo1.scrollRect = rect;
			addChild(logo1);
			
            alpha = 0;
            
            return;
            
        }		
		
        public function show():void
        {
            this.addEventListener(flash.events.Event.ENTER_FRAME, process);
            var loc1:*;
            loc1 = 0.2;
            hideTween = new com.gskinner.motion.GTween(this, loc1, {"alpha":1}, {"ease":mx.effects.easing.Quadratic.easeOut});
            return;
        }		

        public function onStageResize(arg1:Number, arg2:Number):void
        {
            x = arg1 * 0.5;
            y = arg2 * 0.5;
            return;
        }


        private function process(arg1:flash.events.Event):void
        {
            var loc1:*;
            
            loc1 = ( progressSound + Control.getInstance().getProgress() ) / 2;
            
            if ( loc1 < 1 && loc1 > 0 )
            {
                var rect:Rectangle = logo1.scrollRect;
                rect.height = logo.height - logo.height*loc1;
                logo1.scrollRect = rect;
            }
            
            if (loc1 >= 1)
            {
                this.removeEventListener(flash.events.Event.ENTER_FRAME, process);
                stage.dispatchEvent(new flash.events.Event(viewsection.siteloader.Siteloader.ALL_LOAD));
                
            }
            return;
        }

        public function setProgressScens(arg1:Number):void
        {
            progressScens = arg1;
            return;
        }
        
        public function setProgressSound(arg1:Number):void
        {
            progressSound = arg1;
            return;
        }        
        
        public function hide():void
        {
            var loc1:*;
            loc1 = 0.6;
            hideTween = new com.gskinner.motion.GTween(this, loc1, {"alpha":0}, {"ease":mx.effects.easing.Quadratic.easeOut, "completeListener":onHideComplete});
            return;
        }

        public function onHideComplete(arg1:flash.events.Event):void
        {
            
            visible = false;
            stage.dispatchEvent(new flash.events.Event(HIDE));
            return;
        }

        private var progressCollectionWomen:Number=0;

        private var hideTween:com.gskinner.motion.GTween;

        private var progressGender:Number=0;

        private var bar:flash.display.Sprite;

        private var barHeight:int=17;

        private var progressSound:Number=0;

        private var progressCollectionMen:Number=0;

        private var logo:flash.display.Sprite;

        private var logo1:flash.display.Sprite;

        private var logoZast:flash.display.Sprite;

        private var barWidth:int=184;

        private var progressScens:Number=0;
        
        public static var ALL_LOAD:String="ALL_LOAD";
        
        public static var HIDE:String="HIDE";

	}
}