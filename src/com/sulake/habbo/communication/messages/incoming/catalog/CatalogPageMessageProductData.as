package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CatalogPageMessageProductData
   {
      
      public static const const_82:String = "i";
      
      public static const const_90:String = "s";
      
      public static const const_214:String = "e";
       
      
      private var var_1860:String;
      
      private var var_2117:int;
      
      private var var_1439:String;
      
      private var var_1438:int;
      
      private var var_1862:int;
      
      public function CatalogPageMessageProductData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1860 = param1.readString();
         this.var_2117 = param1.readInteger();
         this.var_1439 = param1.readString();
         this.var_1438 = param1.readInteger();
         this.var_1862 = param1.readInteger();
      }
      
      public function get productType() : String
      {
         return this.var_1860;
      }
      
      public function get furniClassId() : int
      {
         return this.var_2117;
      }
      
      public function get extraParam() : String
      {
         return this.var_1439;
      }
      
      public function get productCount() : int
      {
         return this.var_1438;
      }
      
      public function get expiration() : int
      {
         return this.var_1862;
      }
   }
}
