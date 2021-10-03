package com.sulake.habbo.communication.messages.parser.handshake
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class UserRightsMessageParser implements IMessageParser
   {
       
      
      private var var_1121:Boolean;
      
      private var var_902:Array = null;
      
      private var var_2140:int;
      
      private var var_1732:int;
      
      public function UserRightsMessageParser()
      {
         super();
         this.var_902 = [];
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc2_:Boolean = param1.readBoolean();
         if(_loc2_)
         {
            this.var_902 = [];
            _loc3_ = param1.readInteger();
            _loc4_ = 0;
            while(_loc4_ < _loc3_)
            {
               this.var_902.push(param1.readString());
               _loc4_++;
            }
            this.var_1121 = false;
         }
         else
         {
            this.var_2140 = param1.readInteger();
            this.var_1732 = param1.readInteger();
            this.var_1121 = true;
         }
         return true;
      }
      
      public function get simpleSecurity() : Boolean
      {
         return this.var_1121;
      }
      
      public function get rights() : Array
      {
         return this.var_902.slice();
      }
      
      public function get clubLevel() : int
      {
         return this.var_2140;
      }
      
      public function get securityLevel() : int
      {
         return this.var_1732;
      }
   }
}
