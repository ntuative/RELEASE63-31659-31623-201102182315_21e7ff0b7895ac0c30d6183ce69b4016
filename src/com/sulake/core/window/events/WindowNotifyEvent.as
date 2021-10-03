package com.sulake.core.window.events
{
   import com.sulake.core.window.IWindow;
   import flash.events.Event;
   
   public class WindowNotifyEvent extends WindowEvent
   {
      
      public static const const_1511:String = "WN_CRETAE";
      
      public static const const_1443:String = "WN_CREATED";
      
      public static const const_1004:String = "WN_DESTROY";
      
      public static const const_1121:String = "WN_DESTROYED";
      
      public static const const_1002:String = "WN_OPEN";
      
      public static const const_1001:String = "WN_OPENED";
      
      public static const const_1174:String = "WN_CLOSE";
      
      public static const const_1164:String = "WN_CLOSED";
      
      public static const const_1068:String = "WN_FOCUS";
      
      public static const const_999:String = "WN_FOCUSED";
      
      public static const const_1169:String = "WN_UNFOCUS";
      
      public static const const_1006:String = "WN_UNFOCUSED";
      
      public static const const_1199:String = "WN_ACTIVATE";
      
      public static const const_407:String = "WN_ACTVATED";
      
      public static const const_1092:String = "WN_DEACTIVATE";
      
      public static const const_1083:String = "WN_DEACTIVATED";
      
      public static const const_479:String = "WN_SELECT";
      
      public static const const_365:String = "WN_SELECTED";
      
      public static const const_718:String = "WN_UNSELECT";
      
      public static const const_767:String = "WN_UNSELECTED";
      
      public static const const_1096:String = "WN_LOCK";
      
      public static const const_1073:String = "WN_LOCKED";
      
      public static const const_1029:String = "WN_UNLOCK";
      
      public static const const_1204:String = "WN_UNLOCKED";
      
      public static const const_1025:String = "WN_ENABLE";
      
      public static const const_682:String = "WN_ENABLED";
      
      public static const const_1087:String = "WN_DISABLE";
      
      public static const const_727:String = "WN_DISABLED";
      
      public static const const_733:String = "WN_RESIZE";
      
      public static const const_180:String = "WN_RESIZED";
      
      public static const const_1093:String = "WN_RELOCATE";
      
      public static const const_529:String = "WN_RELOCATED";
      
      public static const const_1070:String = "WN_MINIMIZE";
      
      public static const const_1183:String = "WN_MINIMIZED";
      
      public static const const_1021:String = "WN_MAXIMIZE";
      
      public static const const_973:String = "WN_MAXIMIZED";
      
      public static const const_1191:String = "WN_RESTORE";
      
      public static const const_1149:String = "WN_RESTORED";
      
      public static const const_1802:String = "WN_ARRANGE";
      
      public static const const_1861:String = "WN_ARRANGED";
      
      public static const const_1844:String = "WN_UPDATE";
      
      public static const const_1858:String = "WN_UPDATED";
      
      public static const const_383:String = "WN_CHILD_ADDED";
      
      public static const const_699:String = "WN_CHILD_REMOVED";
      
      public static const const_293:String = "WN_CHILD_RESIZED";
      
      public static const const_287:String = "WN_CHILD_RELOCATED";
      
      public static const const_216:String = "WN_CHILD_ACTIVATED";
      
      public static const const_569:String = "WN_PARENT_ADDED";
      
      public static const const_1185:String = "WN_PARENT_REMOVED";
      
      public static const const_547:String = "WN_PARENT_RESIZED";
      
      public static const const_1020:String = "WN_PARENT_RELOCATED";
      
      public static const const_880:String = "WN_PARENT_ACTIVATED";
      
      public static const const_549:String = "WN_STATE_UPDATED";
      
      public static const const_499:String = "WN_STYLE_UPDATED";
      
      public static const const_448:String = "WN_PARAM_UPDATED";
      
      public static const const_1726:String = "";
       
      
      public function WindowNotifyEvent(param1:String, param2:IWindow, param3:IWindow, param4:Boolean = false)
      {
         super(param1,param2,param3,false,param4);
      }
      
      override public function clone() : Event
      {
         return new WindowNotifyEvent(type,_window,var_1986,cancelable);
      }
      
      override public function toString() : String
      {
         return formatToString("WindowNotifyEvent","type","cancelable");
      }
   }
}
