package com.sulake.core.runtime
{
   class ComponentInterfaceQueue implements IDisposable
   {
       
      
      private var var_1778:IID;
      
      private var var_732:Boolean;
      
      private var var_1142:Array;
      
      function ComponentInterfaceQueue(param1:IID)
      {
         super();
         this.var_1778 = param1;
         this.var_1142 = new Array();
         this.var_732 = false;
      }
      
      public function get identifier() : IID
      {
         return this.var_1778;
      }
      
      public function get disposed() : Boolean
      {
         return this.var_732;
      }
      
      public function get receivers() : Array
      {
         return this.var_1142;
      }
      
      public function dispose() : void
      {
         if(!this.var_732)
         {
            this.var_732 = true;
            this.var_1778 = null;
            while(this.var_1142.length > 0)
            {
               this.var_1142.pop();
            }
            this.var_1142 = null;
         }
      }
   }
}
