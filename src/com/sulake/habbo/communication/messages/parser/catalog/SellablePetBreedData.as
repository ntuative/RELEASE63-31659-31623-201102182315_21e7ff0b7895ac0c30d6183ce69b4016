package com.sulake.habbo.communication.messages.parser.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class SellablePetBreedData
   {
       
      
      private var _type:int;
      
      private var var_1545:int;
      
      private var var_2137:Boolean;
      
      private var var_2136:Boolean;
      
      public function SellablePetBreedData(param1:IMessageDataWrapper)
      {
         super();
         this._type = param1.readInteger();
         this.var_1545 = param1.readInteger();
         this.var_2137 = param1.readBoolean();
         this.var_2136 = param1.readBoolean();
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get breed() : int
      {
         return this.var_1545;
      }
      
      public function get sellable() : Boolean
      {
         return this.var_2137;
      }
      
      public function get rare() : Boolean
      {
         return this.var_2136;
      }
   }
}
