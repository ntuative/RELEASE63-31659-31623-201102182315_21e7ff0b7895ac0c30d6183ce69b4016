package com.sulake.habbo.communication.messages.parser.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class GiftWrappingConfigurationParser implements IMessageParser
   {
       
      
      private var var_1992:Boolean;
      
      private var var_1993:int;
      
      private var var_1490:Array;
      
      private var var_737:Array;
      
      private var var_736:Array;
      
      public function GiftWrappingConfigurationParser()
      {
         super();
      }
      
      public function get isWrappingEnabled() : Boolean
      {
         return this.var_1992;
      }
      
      public function get wrappingPrice() : int
      {
         return this.var_1993;
      }
      
      public function get stuffTypes() : Array
      {
         return this.var_1490;
      }
      
      public function get boxTypes() : Array
      {
         return this.var_737;
      }
      
      public function get ribbonTypes() : Array
      {
         return this.var_736;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc2_:int = 0;
         this.var_1490 = [];
         this.var_737 = [];
         this.var_736 = [];
         this.var_1992 = param1.readBoolean();
         this.var_1993 = param1.readInteger();
         var _loc3_:int = param1.readInteger();
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            this.var_1490.push(param1.readInteger());
            _loc2_++;
         }
         _loc3_ = param1.readInteger();
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            this.var_737.push(param1.readInteger());
            _loc2_++;
         }
         _loc3_ = param1.readInteger();
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            this.var_736.push(param1.readInteger());
            _loc2_++;
         }
         return true;
      }
   }
}
