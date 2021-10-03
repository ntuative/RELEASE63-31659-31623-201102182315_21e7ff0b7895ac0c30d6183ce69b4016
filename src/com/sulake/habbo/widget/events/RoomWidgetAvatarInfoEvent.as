package com.sulake.habbo.widget.events
{
   public class RoomWidgetAvatarInfoEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_104:String = "RWAIE_AVATAR_INFO";
       
      
      private var _userId:int;
      
      private var _userName:String;
      
      private var var_2074:Boolean;
      
      public function RoomWidgetAvatarInfoEvent(param1:int, param2:String, param3:Boolean, param4:Boolean = false, param5:Boolean = false)
      {
         super(const_104,param4,param5);
         this._userId = param1;
         this._userName = param2;
         this.var_2074 = param3;
      }
      
      public function get userId() : int
      {
         return this._userId;
      }
      
      public function get userName() : String
      {
         return this._userName;
      }
      
      public function get allowNameChange() : Boolean
      {
         return this.var_2074;
      }
   }
}
