package com.sulake.habbo.inventory.items
{
   public class FloorItem implements IItem
   {
       
      
      protected var _id:int;
      
      protected var _ref:int;
      
      protected var _category:int;
      
      protected var _type:int;
      
      protected var var_1980:String;
      
      protected var var_1334:Number;
      
      protected var var_2743:Boolean;
      
      protected var var_2741:Boolean;
      
      protected var var_2324:Boolean;
      
      protected var var_2137:Boolean;
      
      protected var var_2742:int;
      
      protected var var_2323:int;
      
      protected var var_2322:int;
      
      protected var var_2320:int;
      
      protected var var_1629:String;
      
      protected var var_2534:int;
      
      protected var var_907:Boolean;
      
      public function FloorItem(param1:int, param2:int, param3:int, param4:int, param5:Boolean, param6:Boolean, param7:Boolean, param8:Boolean, param9:String, param10:Number, param11:int, param12:int, param13:int, param14:int, param15:String, param16:int)
      {
         super();
         this._id = param1;
         this._type = param2;
         this._ref = param3;
         this._category = param4;
         this.var_2324 = param5;
         this.var_2741 = param6;
         this.var_2743 = param7;
         this.var_2137 = param8;
         this.var_1980 = param9;
         this.var_1334 = param10;
         this.var_2742 = param11;
         this.var_2323 = param12;
         this.var_2322 = param13;
         this.var_2320 = param14;
         this.var_1629 = param15;
         this.var_2534 = param16;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get ref() : int
      {
         return this._ref;
      }
      
      public function get category() : int
      {
         return this._category;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get stuffData() : String
      {
         return this.var_1980;
      }
      
      public function get extra() : Number
      {
         return this.var_1334;
      }
      
      public function get recyclable() : Boolean
      {
         return this.var_2743;
      }
      
      public function get tradeable() : Boolean
      {
         return this.var_2741;
      }
      
      public function get groupable() : Boolean
      {
         return this.var_2324;
      }
      
      public function get sellable() : Boolean
      {
         return this.var_2137;
      }
      
      public function get expires() : int
      {
         return this.var_2742;
      }
      
      public function get creationDay() : int
      {
         return this.var_2323;
      }
      
      public function get creationMonth() : int
      {
         return this.var_2322;
      }
      
      public function get creationYear() : int
      {
         return this.var_2320;
      }
      
      public function get slotId() : String
      {
         return this.var_1629;
      }
      
      public function get songId() : int
      {
         return this.var_2534;
      }
      
      public function set locked(param1:Boolean) : void
      {
         this.var_907 = param1;
      }
      
      public function get locked() : Boolean
      {
         return this.var_907;
      }
   }
}
