package com.sulake.core.window.events
{
   import com.sulake.core.window.IWindow;
   import flash.events.Event;
   
   public class WindowEvent extends Event
   {
      
      public static const const_1366:String = "WE_CREATE";
      
      public static const const_1414:String = "WE_CREATED";
      
      public static const const_1550:String = "WE_DESTROY";
      
      public static const const_274:String = "WE_DESTROYED";
      
      public static const const_1362:String = "WE_OPEN";
      
      public static const const_1489:String = "WE_OPENED";
      
      public static const const_1643:String = "WE_CLOSE";
      
      public static const const_1635:String = "WE_CLOSED";
      
      public static const const_1376:String = "WE_FOCUS";
      
      public static const const_316:String = "WE_FOCUSED";
      
      public static const const_1447:String = "WE_UNFOCUS";
      
      public static const const_1400:String = "WE_UNFOCUSED";
      
      public static const const_1493:String = "WE_ACTIVATE";
      
      public static const const_1411:String = "WE_ACTIVATED";
      
      public static const const_1519:String = "WE_DEACTIVATE";
      
      public static const const_762:String = "WE_DEACTIVATED";
      
      public static const const_476:String = "WE_SELECT";
      
      public static const const_59:String = "WE_SELECTED";
      
      public static const const_844:String = "WE_UNSELECT";
      
      public static const const_887:String = "WE_UNSELECTED";
      
      public static const const_1868:String = "WE_ATTACH";
      
      public static const const_1888:String = "WE_ATTACHED";
      
      public static const const_1887:String = "WE_DETACH";
      
      public static const const_1787:String = "WE_DETACHED";
      
      public static const const_1555:String = "WE_LOCK";
      
      public static const const_1605:String = "WE_LOCKED";
      
      public static const const_1610:String = "WE_UNLOCK";
      
      public static const const_1592:String = "WE_UNLOCKED";
      
      public static const const_672:String = "WE_ENABLE";
      
      public static const const_289:String = "WE_ENABLED";
      
      public static const const_731:String = "WE_DISABLE";
      
      public static const const_257:String = "WE_DISABLED";
      
      public static const const_1650:String = "WE_RELOCATE";
      
      public static const const_396:String = "WE_RELOCATED";
      
      public static const const_1468:String = "WE_RESIZE";
      
      public static const const_49:String = "WE_RESIZED";
      
      public static const const_1458:String = "WE_MINIMIZE";
      
      public static const const_1449:String = "WE_MINIMIZED";
      
      public static const const_1505:String = "WE_MAXIMIZE";
      
      public static const const_1402:String = "WE_MAXIMIZED";
      
      public static const const_1398:String = "WE_RESTORE";
      
      public static const const_1515:String = "WE_RESTORED";
      
      public static const const_1925:String = "WE_ARRANGE";
      
      public static const const_1852:String = "WE_ARRANGED";
      
      public static const const_106:String = "WE_UPDATE";
      
      public static const const_1783:String = "WE_UPDATED";
      
      public static const const_1916:String = "WE_CHILD_RELOCATE";
      
      public static const const_570:String = "WE_CHILD_RELOCATED";
      
      public static const const_1728:String = "WE_CHILD_RESIZE";
      
      public static const const_291:String = "WE_CHILD_RESIZED";
      
      public static const const_1723:String = "WE_CHILD_REMOVE";
      
      public static const const_506:String = "WE_CHILD_REMOVED";
      
      public static const const_1782:String = "WE_PARENT_RELOCATE";
      
      public static const const_1830:String = "WE_PARENT_RELOCATED";
      
      public static const const_1889:String = "WE_PARENT_RESIZE";
      
      public static const const_1445:String = "WE_PARENT_RESIZED";
      
      public static const const_187:String = "WE_OK";
      
      public static const const_864:String = "WE_CANCEL";
      
      public static const const_107:String = "WE_CHANGE";
      
      public static const WINDOW_EVENT_MESSAGE:String = "WE_MESSAGE";
      
      public static const const_485:String = "WE_SCROLL";
      
      public static const const_160:String = "";
       
      
      protected var _type:String = "";
      
      protected var _window:IWindow;
      
      protected var var_1986:IWindow;
      
      protected var var_1987:Boolean;
      
      public function WindowEvent(param1:String, param2:IWindow, param3:IWindow, param4:Boolean = false, param5:Boolean = false)
      {
         this._type = param1;
         this._window = param2;
         this.var_1986 = param3;
         this.var_1987 = false;
         super(param1,param4,param5);
      }
      
      public function set type(param1:String) : void
      {
         this._type = param1;
      }
      
      override public function get type() : String
      {
         return this._type;
      }
      
      public function get window() : IWindow
      {
         return this._window;
      }
      
      public function get related() : IWindow
      {
         return this.var_1986;
      }
      
      override public function clone() : Event
      {
         return new WindowEvent(this._type,this.window,this.related,bubbles,cancelable);
      }
      
      public function preventWindowOperation() : void
      {
         if(cancelable)
         {
            this.var_1987 = true;
            stopImmediatePropagation();
            return;
         }
         throw new Error("Attempted to prevent window operation that is not canceable!");
      }
      
      public function isWindowOperationPrevented() : Boolean
      {
         return this.var_1987;
      }
      
      override public function toString() : String
      {
         return formatToString("WindowEvent","type","bubbles","cancelable","window");
      }
   }
}
