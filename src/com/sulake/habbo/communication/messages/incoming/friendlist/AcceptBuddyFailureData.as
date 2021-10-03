package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class AcceptBuddyFailureData
   {
       
      
      private var var_970:String;
      
      private var var_1734:int;
      
      public function AcceptBuddyFailureData(param1:IMessageDataWrapper)
      {
         super();
         this.var_970 = param1.readString();
         this.var_1734 = param1.readInteger();
      }
      
      public function get senderName() : String
      {
         return this.var_970;
      }
      
      public function get errorCode() : int
      {
         return this.var_1734;
      }
   }
}
