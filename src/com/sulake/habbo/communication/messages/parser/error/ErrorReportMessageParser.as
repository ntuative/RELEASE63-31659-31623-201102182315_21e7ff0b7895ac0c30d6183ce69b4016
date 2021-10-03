package com.sulake.habbo.communication.messages.parser.error
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class ErrorReportMessageParser implements IMessageParser
   {
       
      
      private var var_1734:int;
      
      private var var_1841:int;
      
      private var var_1840:String;
      
      public function ErrorReportMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1841 = param1.readInteger();
         this.var_1734 = param1.readInteger();
         this.var_1840 = param1.readString();
         return true;
      }
      
      public function flush() : Boolean
      {
         this.var_1734 = 0;
         this.var_1841 = 0;
         this.var_1840 = null;
         return true;
      }
      
      public function get errorCode() : int
      {
         return this.var_1734;
      }
      
      public function get messageId() : int
      {
         return this.var_1841;
      }
      
      public function get timestamp() : String
      {
         return this.var_1840;
      }
   }
}
