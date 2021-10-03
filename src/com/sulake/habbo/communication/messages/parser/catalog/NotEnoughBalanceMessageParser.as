package com.sulake.habbo.communication.messages.parser.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class NotEnoughBalanceMessageParser implements IMessageParser
   {
       
      
      private var var_1684:int = 0;
      
      private var var_1683:int = 0;
      
      private var var_1509:int = 0;
      
      public function NotEnoughBalanceMessageParser()
      {
         super();
      }
      
      public function get notEnoughCredits() : int
      {
         return this.var_1684;
      }
      
      public function get notEnoughActivityPoints() : int
      {
         return this.var_1683;
      }
      
      public function get activityPointType() : int
      {
         return this.var_1509;
      }
      
      public function flush() : Boolean
      {
         this.var_1684 = 0;
         this.var_1683 = 0;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1684 = param1.readInteger();
         this.var_1683 = param1.readInteger();
         this.var_1509 = param1.readInteger();
         return true;
      }
   }
}
