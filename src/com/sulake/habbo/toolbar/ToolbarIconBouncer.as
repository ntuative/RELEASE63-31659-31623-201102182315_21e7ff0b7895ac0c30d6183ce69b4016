package com.sulake.habbo.toolbar
{
   public class ToolbarIconBouncer
   {
       
      
      private var var_2331:Number;
      
      private var var_1922:Number;
      
      private var var_874:Number;
      
      private var var_873:Number = 0;
      
      public function ToolbarIconBouncer(param1:Number, param2:Number)
      {
         super();
         this.var_2331 = param1;
         this.var_1922 = param2;
      }
      
      public function reset(param1:int) : void
      {
         this.var_874 = param1;
         this.var_873 = 0;
      }
      
      public function update() : void
      {
         this.var_874 += this.var_1922;
         this.var_873 += this.var_874;
         if(this.var_873 > 0)
         {
            this.var_873 = 0;
            this.var_874 = this.var_2331 * -1 * this.var_874;
         }
      }
      
      public function get location() : Number
      {
         return this.var_873;
      }
   }
}
