package com.sulake.habbo.avatar.animation
{
   public class AddDataContainer
   {
       
      
      private var _id:String;
      
      private var var_1871:String;
      
      private var _base:String;
      
      private var var_1515:String;
      
      private var var_679:Number = 1;
      
      public function AddDataContainer(param1:XML)
      {
         super();
         this._id = String(param1.@id);
         this.var_1871 = String(param1.@align);
         this._base = String(param1.@base);
         this.var_1515 = String(param1.@ink);
         var _loc2_:String = String(param1.@blend);
         if(_loc2_.length > 0)
         {
            this.var_679 = Number(_loc2_);
            if(this.var_679 > 1)
            {
               this.var_679 /= 100;
            }
         }
      }
      
      public function get id() : String
      {
         return this._id;
      }
      
      public function get align() : String
      {
         return this.var_1871;
      }
      
      public function get base() : String
      {
         return this._base;
      }
      
      public function get ink() : String
      {
         return this.var_1515;
      }
      
      public function get blend() : Number
      {
         return this.var_679;
      }
      
      public function get isBlended() : Boolean
      {
         return this.var_679 != 1;
      }
   }
}
