package com.sulake.habbo.inventory.purse
{
   public class Purse
   {
       
      
      private var var_1891:int = 0;
      
      private var var_1892:int = 0;
      
      private var var_2247:int = 0;
      
      private var var_2248:Boolean = false;
      
      private var var_2039:Boolean = false;
      
      public function Purse()
      {
         super();
      }
      
      public function set clubDays(param1:int) : void
      {
         this.var_1891 = Math.max(0,param1);
      }
      
      public function set clubPeriods(param1:int) : void
      {
         this.var_1892 = Math.max(0,param1);
      }
      
      public function set clubPastPeriods(param1:int) : void
      {
         this.var_2247 = Math.max(0,param1);
      }
      
      public function set clubHasEverBeenMember(param1:Boolean) : void
      {
         this.var_2248 = param1;
      }
      
      public function set isVIP(param1:Boolean) : void
      {
         this.var_2039 = param1;
      }
      
      public function get clubDays() : int
      {
         return this.var_1891;
      }
      
      public function get clubPeriods() : int
      {
         return this.var_1892;
      }
      
      public function get clubPastPeriods() : int
      {
         return this.var_2247;
      }
      
      public function get clubHasEverBeenMember() : Boolean
      {
         return this.var_2248;
      }
      
      public function get isVIP() : Boolean
      {
         return this.var_2039;
      }
   }
}
