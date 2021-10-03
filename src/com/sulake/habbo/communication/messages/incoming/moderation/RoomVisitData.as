package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class RoomVisitData
   {
       
      
      private var var_1556:Boolean;
      
      private var _roomId:int;
      
      private var var_896:String;
      
      private var var_2489:int;
      
      private var var_2488:int;
      
      public function RoomVisitData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1556 = param1.readBoolean();
         this._roomId = param1.readInteger();
         this.var_896 = param1.readString();
         this.var_2489 = param1.readInteger();
         this.var_2488 = param1.readInteger();
      }
      
      public function get isPublic() : Boolean
      {
         return this.var_1556;
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function get roomName() : String
      {
         return this.var_896;
      }
      
      public function get enterHour() : int
      {
         return this.var_2489;
      }
      
      public function get enterMinute() : int
      {
         return this.var_2488;
      }
   }
}
