package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ChargeInfo
   {
       
      
      private var var_2563:int;
      
      private var var_2710:int;
      
      private var var_1162:int;
      
      private var var_1163:int;
      
      private var var_1509:int;
      
      private var var_2709:int;
      
      public function ChargeInfo(param1:IMessageDataWrapper)
      {
         super();
         this.var_2563 = param1.readInteger();
         this.var_2710 = param1.readInteger();
         this.var_1162 = param1.readInteger();
         this.var_1163 = param1.readInteger();
         this.var_1509 = param1.readInteger();
         this.var_2709 = param1.readInteger();
      }
      
      public function get stuffId() : int
      {
         return this.var_2563;
      }
      
      public function get charges() : int
      {
         return this.var_2710;
      }
      
      public function get priceInCredits() : int
      {
         return this.var_1162;
      }
      
      public function get priceInActivityPoints() : int
      {
         return this.var_1163;
      }
      
      public function get chargePatchSize() : int
      {
         return this.var_2709;
      }
      
      public function get activityPointType() : int
      {
         return this.var_1509;
      }
   }
}
