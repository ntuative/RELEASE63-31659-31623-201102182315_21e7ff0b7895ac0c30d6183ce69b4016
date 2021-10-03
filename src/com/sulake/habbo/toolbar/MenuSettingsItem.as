package com.sulake.habbo.toolbar
{
   public class MenuSettingsItem
   {
       
      
      private var var_2056:String;
      
      private var var_2057:Array;
      
      private var var_2055:Boolean;
      
      public function MenuSettingsItem(param1:String, param2:Array = null, param3:Boolean = false)
      {
         super();
         this.var_2056 = param1;
         this.var_2057 = param2;
         this.var_2055 = param3;
      }
      
      public function get menuId() : String
      {
         return this.var_2056;
      }
      
      public function get yieldList() : Array
      {
         return this.var_2057;
      }
      
      public function get lockToIcon() : Boolean
      {
         return this.var_2055;
      }
   }
}
