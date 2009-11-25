package com.google.maps.wrappers 
{
    public class WrappedListenerCache extends Object
    {
        public function WrappedListenerCache(arg1:Object)
        {
            super();
            callbackMap = {};
            this.target = arg1;
            return;
        }

        public function removeListener(arg1:Function, arg2:String, arg3:Function, arg4:Boolean=false):void
        {
            var loc1:*;
            loc1 = null;
            var loc2:*;
            loc2 = 0;
            if (loc1 = this.callbackMap[arg2])
            {
                loc2 = (loc1.length - 1);
                while (loc2 >= 0) 
                {
                    if (arg3 == loc1[loc2].original && arg4 == loc1[loc2].useCapture)
                    {
                        arg1(arg2, loc1[loc2].wrapped, arg4);
                        loc1.splice(loc2, 1);
                    }
                    loc2 = (loc2 - 1);
                }
            }
            return;
        }

        public function addListener(arg1:Function, arg2:String, arg3:Function, arg4:Boolean=false, arg5:int=0, arg6:Boolean=false):void
        {
            var loc1:*;
            loc1 = null;
            var loc2:*;
            loc2 = null;
            var loc3:*;
            loc3 = null;
            loc1 = com.google.maps.wrappers.Wrapper.instance().wrapEventHandler(arg3, target);
            loc2 = {"original":arg3, "wrapped":loc1, "useCapture":arg4};
            if ((loc3 = this.callbackMap[arg2]) == null)
            {
                this.callbackMap[arg2] = [loc2];
            }
            else 
            {
                loc3.push(loc2);
            }
            arg1(arg2, loc1, arg4, arg5, arg6);
            return;
        }

        private var target:Object;

        private var callbackMap:Object;
    }
}
