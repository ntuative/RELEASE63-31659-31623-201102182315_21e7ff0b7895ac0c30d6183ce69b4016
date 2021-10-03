package com.sulake.habbo.catalog.purse
{
   import flash.utils.Dictionary;
   
   public class Purse implements IPurse
   {
      
      public static const const_179:int = 0;
       
      
      private var var_2365:int = 0;
      
      private var var_1452:Dictionary;
      
      private var var_1891:int = 0;
      
      private var var_1892:int = 0;
      
      private var var_2039:Boolean = false;
      
      private var var_2036:int = 0;
      
      private var var_2038:int = 0;
      
      public function Purse()
      {
         this.var_1452 = new Dictionary();
         super();
      }
      
      public function get credits() : int
      {
         return this.var_2365;
      }
      
      public function set credits(param1:int) : void
      {
         this.var_2365 = param1;
      }
      
      public function get clubDays() : int
      {
         return this.var_1891;
      }
      
      public function set clubDays(param1:int) : void
      {
         this.var_1891 = param1;
      }
      
      public function get clubPeriods() : int
      {
         return this.var_1892;
      }
      
      public function set clubPeriods(param1:int) : void
      {
         this.var_1892 = param1;
      }
      
      public function get hasClubLeft() : Boolean
      {
         return this.var_1891 > 0 || this.var_1892 > 0;
      }
      
      public function get isVIP() : Boolean
      {
         return this.var_2039;
      }
      
      public function set isVIP(param1:Boolean) : void
      {
         this.var_2039 = param1;
      }
      
      public function get pastClubDays() : int
      {
         return this.var_2036;
      }
      
      public function set pastClubDays(param1:int) : void
      {
         this.var_2036 = param1;
      }
      
      public function get pastVipDays() : int
      {
         return this.var_2038;
      }
      
      public function set pastVipDays(param1:int) : void
      {
         this.var_2038 = param1;
      }
      
      public function get activityPoints() : Dictionary
      {
         return this.var_1452;
      }
      
      public function set activityPoints(param1:Dictionary) : void
      {
         this.var_1452 = param1;
      }
      
      public function getActivityPointsForType(param1:int) : int
      {
         return this.var_1452[param1];
      }
   }
}
