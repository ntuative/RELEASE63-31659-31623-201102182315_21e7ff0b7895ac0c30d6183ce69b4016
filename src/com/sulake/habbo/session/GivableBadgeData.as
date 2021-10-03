package com.sulake.habbo.session
{
   public class GivableBadgeData
   {
       
      
      private var var_294:int;
      
      private var var_2551:String;
      
      public function GivableBadgeData(param1:int, param2:String)
      {
         super();
         this.var_294 = param1;
         this.var_2551 = param2;
      }
      
      public function get badgeId() : int
      {
         return this.var_294;
      }
      
      public function get achievementTypeName() : String
      {
         return this.var_2551;
      }
   }
}
