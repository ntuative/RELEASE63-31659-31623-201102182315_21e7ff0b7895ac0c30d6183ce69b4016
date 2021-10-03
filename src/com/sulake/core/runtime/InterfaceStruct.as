package com.sulake.core.runtime
{
   import flash.utils.getQualifiedClassName;
   
   final class InterfaceStruct implements IDisposable
   {
       
      
      private var var_1315:IID;
      
      private var var_1624:String;
      
      private var var_112:IUnknown;
      
      private var var_695:uint;
      
      function InterfaceStruct(param1:IID, param2:IUnknown)
      {
         super();
         this.var_1315 = param1;
         this.var_1624 = getQualifiedClassName(this.var_1315);
         this.var_112 = param2;
         this.var_695 = 0;
      }
      
      public function get iid() : IID
      {
         return this.var_1315;
      }
      
      public function get iis() : String
      {
         return this.var_1624;
      }
      
      public function get unknown() : IUnknown
      {
         return this.var_112;
      }
      
      public function get references() : uint
      {
         return this.var_695;
      }
      
      public function get disposed() : Boolean
      {
         return this.var_112 == null;
      }
      
      public function dispose() : void
      {
         this.var_1315 = null;
         this.var_1624 = null;
         this.var_112 = null;
         this.var_695 = 0;
      }
      
      public function reserve() : uint
      {
         return ++this.var_695;
      }
      
      public function release() : uint
      {
         return this.references > 0 ? uint(--this.var_695) : uint(0);
      }
   }
}
