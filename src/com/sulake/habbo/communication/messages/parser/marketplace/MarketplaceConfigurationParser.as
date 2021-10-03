package com.sulake.habbo.communication.messages.parser.marketplace
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class MarketplaceConfigurationParser implements IMessageParser
   {
       
      
      private var var_1319:Boolean;
      
      private var var_2173:int;
      
      private var var_1574:int;
      
      private var var_1575:int;
      
      private var var_2168:int;
      
      private var var_2172:int;
      
      private var var_2169:int;
      
      private var var_2170:int;
      
      public function MarketplaceConfigurationParser()
      {
         super();
      }
      
      public function get isEnabled() : Boolean
      {
         return this.var_1319;
      }
      
      public function get commission() : int
      {
         return this.var_2173;
      }
      
      public function get tokenBatchPrice() : int
      {
         return this.var_1574;
      }
      
      public function get tokenBatchSize() : int
      {
         return this.var_1575;
      }
      
      public function get offerMinPrice() : int
      {
         return this.var_2172;
      }
      
      public function get offerMaxPrice() : int
      {
         return this.var_2168;
      }
      
      public function get expirationHours() : int
      {
         return this.var_2169;
      }
      
      public function get averagePricePeriod() : int
      {
         return this.var_2170;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1319 = param1.readBoolean();
         this.var_2173 = param1.readInteger();
         this.var_1574 = param1.readInteger();
         this.var_1575 = param1.readInteger();
         this.var_2172 = param1.readInteger();
         this.var_2168 = param1.readInteger();
         this.var_2169 = param1.readInteger();
         this.var_2170 = param1.readInteger();
         return true;
      }
   }
}
