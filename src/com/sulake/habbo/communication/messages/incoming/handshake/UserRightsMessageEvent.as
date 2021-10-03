package com.sulake.habbo.communication.messages.incoming.handshake
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import com.sulake.habbo.communication.messages.parser.handshake.UserRightsMessageParser;
   
   public class UserRightsMessageEvent extends MessageEvent implements IMessageEvent
   {
       
      
      public function UserRightsMessageEvent(param1:Function)
      {
         super(param1,UserRightsMessageParser);
      }
      
      public function get simpleSecurity() : Boolean
      {
         return (this.var_10 as UserRightsMessageParser).simpleSecurity;
      }
      
      public function get rights() : Array
      {
         return (this.var_10 as UserRightsMessageParser).rights;
      }
      
      public function get clubLevel() : int
      {
         return (this.var_10 as UserRightsMessageParser).clubLevel;
      }
      
      public function get securityLevel() : int
      {
         return (this.var_10 as UserRightsMessageParser).securityLevel;
      }
   }
}
