package com.sulake.habbo.communication.messages.parser.help
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class TutorialStatusMessageParser implements IMessageParser
   {
       
      
      private var var_1016:Boolean;
      
      private var var_1017:Boolean;
      
      private var var_1260:Boolean;
      
      public function TutorialStatusMessageParser()
      {
         super();
      }
      
      public function get hasChangedLooks() : Boolean
      {
         return this.var_1016;
      }
      
      public function get hasChangedName() : Boolean
      {
         return this.var_1017;
      }
      
      public function get hasCalledGuideBot() : Boolean
      {
         return this.var_1260;
      }
      
      public function flush() : Boolean
      {
         this.var_1016 = false;
         this.var_1017 = false;
         this.var_1260 = false;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1016 = param1.readBoolean();
         this.var_1017 = param1.readBoolean();
         this.var_1260 = param1.readBoolean();
         return true;
      }
   }
}
