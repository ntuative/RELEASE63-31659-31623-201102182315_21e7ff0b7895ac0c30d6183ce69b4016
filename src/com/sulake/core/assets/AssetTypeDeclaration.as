package com.sulake.core.assets
{
   public class AssetTypeDeclaration
   {
       
      
      private var var_2361:String;
      
      private var var_2362:Class;
      
      private var var_2363:Class;
      
      private var var_1671:Array;
      
      public function AssetTypeDeclaration(param1:String, param2:Class, param3:Class, ... rest)
      {
         super();
         this.var_2361 = param1;
         this.var_2362 = param2;
         this.var_2363 = param3;
         if(rest == null)
         {
            this.var_1671 = new Array();
         }
         else
         {
            this.var_1671 = rest;
         }
      }
      
      public function get mimeType() : String
      {
         return this.var_2361;
      }
      
      public function get assetClass() : Class
      {
         return this.var_2362;
      }
      
      public function get loaderClass() : Class
      {
         return this.var_2363;
      }
      
      public function get fileTypes() : Array
      {
         return this.var_1671;
      }
   }
}
