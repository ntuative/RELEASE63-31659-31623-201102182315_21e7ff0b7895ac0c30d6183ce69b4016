package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CfhChatlogData
   {
       
      
      private var var_1644:int;
      
      private var var_2296:int;
      
      private var var_1300:int;
      
      private var var_2022:int;
      
      private var var_110:RoomChatlogData;
      
      public function CfhChatlogData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1644 = param1.readInteger();
         this.var_2296 = param1.readInteger();
         this.var_1300 = param1.readInteger();
         this.var_2022 = param1.readInteger();
         this.var_110 = new RoomChatlogData(param1);
         Logger.log("READ CFHCHATLOGDATA: callId: " + this.var_1644);
      }
      
      public function get callId() : int
      {
         return this.var_1644;
      }
      
      public function get callerUserId() : int
      {
         return this.var_2296;
      }
      
      public function get reportedUserId() : int
      {
         return this.var_1300;
      }
      
      public function get chatRecordId() : int
      {
         return this.var_2022;
      }
      
      public function get room() : RoomChatlogData
      {
         return this.var_110;
      }
   }
}
