package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarPostureUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var var_1991:String;
      
      private var var_1423:String;
      
      public function RoomObjectAvatarPostureUpdateMessage(param1:String, param2:String = "")
      {
         super();
         this.var_1991 = param1;
         this.var_1423 = param2;
      }
      
      public function get postureType() : String
      {
         return this.var_1991;
      }
      
      public function get parameter() : String
      {
         return this.var_1423;
      }
   }
}
