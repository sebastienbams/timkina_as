package viewsection
{
	import flash.events.Event;

	public class MyEvent extends Event
	{
		public function MyEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
		public var targetId:String = "";
		
		public var targetContId:String = "";
		
		public  static var NEXT_IMAGE:String="nextImage";
		
		public static var PREV_IMAGE:String="prevImage";
		
		public static var LEFT_END:String="leftEnd";
		
		public static var RIGHT_END:String="rightEnd";
		
		public static var QUICK_HIDE:String="QUICK_HIDE";
		
		public static var QUICK_SHOW:String="QUICK_SHOW";
		
		public static var SELECT:String="SELECT";
		
		public static var SCROLL_UP:String="SCROLL_UP";
		
		public static var SCROLL_DOWN:String="SCROLL_DOWN";
		

	}
}