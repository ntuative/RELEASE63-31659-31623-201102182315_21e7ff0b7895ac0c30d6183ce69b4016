package com.sulake.habbo.session
{
   public class PetInfo implements IPetInfo
   {
       
      
      private var var_1599:int;
      
      private var var_1363:int;
      
      private var var_2100:int;
      
      private var var_2106:int;
      
      private var var_2101:int;
      
      private var _energy:int;
      
      private var var_2103:int;
      
      private var _nutrition:int;
      
      private var var_2107:int;
      
      private var var_2105:int;
      
      private var _ownerName:String;
      
      private var var_2086:int;
      
      private var var_473:int;
      
      public function PetInfo()
      {
         super();
      }
      
      public function get petId() : int
      {
         return this.var_1599;
      }
      
      public function get level() : int
      {
         return this.var_1363;
      }
      
      public function get levelMax() : int
      {
         return this.var_2100;
      }
      
      public function get experience() : int
      {
         return this.var_2106;
      }
      
      public function get experienceMax() : int
      {
         return this.var_2101;
      }
      
      public function get energy() : int
      {
         return this._energy;
      }
      
      public function get energyMax() : int
      {
         return this.var_2103;
      }
      
      public function get nutrition() : int
      {
         return this._nutrition;
      }
      
      public function get nutritionMax() : int
      {
         return this.var_2107;
      }
      
      public function get ownerId() : int
      {
         return this.var_2105;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get respect() : int
      {
         return this.var_2086;
      }
      
      public function get age() : int
      {
         return this.var_473;
      }
      
      public function set petId(param1:int) : void
      {
         this.var_1599 = param1;
      }
      
      public function set level(param1:int) : void
      {
         this.var_1363 = param1;
      }
      
      public function set levelMax(param1:int) : void
      {
         this.var_2100 = param1;
      }
      
      public function set experience(param1:int) : void
      {
         this.var_2106 = param1;
      }
      
      public function set experienceMax(param1:int) : void
      {
         this.var_2101 = param1;
      }
      
      public function set energy(param1:int) : void
      {
         this._energy = param1;
      }
      
      public function set energyMax(param1:int) : void
      {
         this.var_2103 = param1;
      }
      
      public function set nutrition(param1:int) : void
      {
         this._nutrition = param1;
      }
      
      public function set nutritionMax(param1:int) : void
      {
         this.var_2107 = param1;
      }
      
      public function set ownerId(param1:int) : void
      {
         this.var_2105 = param1;
      }
      
      public function set ownerName(param1:String) : void
      {
         this._ownerName = param1;
      }
      
      public function set respect(param1:int) : void
      {
         this.var_2086 = param1;
      }
      
      public function set age(param1:int) : void
      {
         this.var_473 = param1;
      }
   }
}
