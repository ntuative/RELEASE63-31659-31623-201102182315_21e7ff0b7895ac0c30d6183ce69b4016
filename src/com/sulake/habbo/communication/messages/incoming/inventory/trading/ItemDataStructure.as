package com.sulake.habbo.communication.messages.incoming.inventory.trading
{
   public class ItemDataStructure
   {
       
      
      private var var_2321:int;
      
      private var var_1298:String;
      
      private var var_2318:int;
      
      private var var_2319:int;
      
      private var _category:int;
      
      private var var_1980:String;
      
      private var var_1334:int;
      
      private var var_2325:int;
      
      private var var_2323:int;
      
      private var var_2322:int;
      
      private var var_2320:int;
      
      private var var_2324:Boolean;
      
      private var var_2802:int;
      
      public function ItemDataStructure(param1:int, param2:String, param3:int, param4:int, param5:int, param6:String, param7:int, param8:int, param9:int, param10:int, param11:int, param12:Boolean)
      {
         super();
         this.var_2321 = param1;
         this.var_1298 = param2;
         this.var_2318 = param3;
         this.var_2319 = param4;
         this._category = param5;
         this.var_1980 = param6;
         this.var_1334 = param7;
         this.var_2325 = param8;
         this.var_2323 = param9;
         this.var_2322 = param10;
         this.var_2320 = param11;
         this.var_2324 = param12;
      }
      
      public function get itemID() : int
      {
         return this.var_2321;
      }
      
      public function get itemType() : String
      {
         return this.var_1298;
      }
      
      public function get roomItemID() : int
      {
         return this.var_2318;
      }
      
      public function get itemTypeID() : int
      {
         return this.var_2319;
      }
      
      public function get category() : int
      {
         return this._category;
      }
      
      public function get stuffData() : String
      {
         return this.var_1980;
      }
      
      public function get extra() : int
      {
         return this.var_1334;
      }
      
      public function get timeToExpiration() : int
      {
         return this.var_2325;
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
      
      public function get groupable() : Boolean
      {
         return this.var_2324;
      }
      
      public function get songID() : int
      {
         return this.var_1334;
      }
   }
}
