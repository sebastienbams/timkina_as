package {
	import flash.display.Sprite;
	import flash.events.*;
	import flash.system.*;
	
	import mx.core.Application;

	public class timkina_as extends Sprite
	{
		public function timkina_as()
		{
            super();
            flash.system.fscommand("showmenu", "false");
            addEventListener(flash.events.Event.ADDED_TO_STAGE, init, false, 0, true);
            return;
			
		}

        private function init(arg1:flash.events.Event):void
        {
            
            removeEventListener(flash.events.Event.ADDED_TO_STAGE, init);
            stage.align = flash.display.StageAlign.TOP_LEFT;
            stage.scaleMode = flash.display.StageScaleMode.NO_SCALE;
            stage.quality = flash.display.StageQuality.HIGH;
			
			            
            stage.stageFocusRect = false;
            stage.addEventListener(flash.events.Event.RESIZE, onStageResize);
            
            addChild(Control.getInstance());
            
            onStageResize();

        }

        private function onStageResize(arg1:flash.events.Event=null):void
        {
            Control.getInstance().onStageResize(stage.stageWidth, stage.stageHeight);
            return;
        }


	}
}
