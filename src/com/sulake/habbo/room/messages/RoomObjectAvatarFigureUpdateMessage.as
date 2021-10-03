package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarFigureUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var var_581:String;
      
      private var var_2264:String;
      
      private var var_860:String;
      
      public function RoomObjectAvatarFigureUpdateMessage(param1:String, param2:String = null, param3:String = null)
      {
         super();
         this.var_581 = param1;
         this.var_860 = param2;
         this.var_2264 = param3;
      }
      
      public function get figure() : String
      {
         return this.var_581;
      }
      
      public function get race() : String
      {
         return this.var_2264;
      }
      
      public function get gender() : String
      {
         return this.var_860;
      }
   }
}
