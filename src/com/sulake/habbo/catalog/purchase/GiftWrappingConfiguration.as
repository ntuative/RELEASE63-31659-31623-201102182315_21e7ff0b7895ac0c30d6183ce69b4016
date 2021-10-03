package com.sulake.habbo.catalog.purchase
{
   import com.sulake.habbo.communication.messages.incoming.catalog.GiftWrappingConfigurationEvent;
   import com.sulake.habbo.communication.messages.parser.catalog.GiftWrappingConfigurationParser;
   
   public class GiftWrappingConfiguration
   {
       
      
      private var var_1319:Boolean = false;
      
      private var var_1650:int;
      
      private var var_1490:Array;
      
      private var var_737:Array;
      
      private var var_736:Array;
      
      public function GiftWrappingConfiguration(param1:GiftWrappingConfigurationEvent)
      {
         super();
         if(param1 == null)
         {
            return;
         }
         var _loc2_:GiftWrappingConfigurationParser = param1.getParser();
         if(_loc2_ == null)
         {
            return;
         }
         this.var_1319 = _loc2_.isWrappingEnabled;
         this.var_1650 = _loc2_.wrappingPrice;
         this.var_1490 = _loc2_.stuffTypes;
         this.var_737 = _loc2_.boxTypes;
         this.var_736 = _loc2_.ribbonTypes;
      }
      
      public function get isEnabled() : Boolean
      {
         return this.var_1319;
      }
      
      public function get price() : int
      {
         return this.var_1650;
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
   }
}
