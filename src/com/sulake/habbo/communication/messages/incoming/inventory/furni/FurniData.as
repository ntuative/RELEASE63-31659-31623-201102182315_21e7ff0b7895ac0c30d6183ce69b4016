package com.sulake.habbo.communication.messages.incoming.inventory.furni
{
   public class FurniData
   {
       
      
      private var var_2164:int;
      
      private var var_1298:String;
      
      private var _objId:int;
      
      private var var_1593:int;
      
      private var _category:int;
      
      private var var_1980:String;
      
      private var var_2594:Boolean;
      
      private var var_2596:Boolean;
      
      private var var_2593:Boolean;
      
      private var var_2333:Boolean;
      
      private var var_2595:int;
      
      private var var_1334:int;
      
      private var var_1629:String = "";
      
      private var var_2534:int = -1;
      
      public function FurniData(param1:int, param2:String, param3:int, param4:int, param5:int, param6:String, param7:Boolean, param8:Boolean, param9:Boolean, param10:Boolean, param11:int)
      {
         super();
         this.var_2164 = param1;
         this.var_1298 = param2;
         this._objId = param3;
         this.var_1593 = param4;
         this._category = param5;
         this.var_1980 = param6;
         this.var_2594 = param7;
         this.var_2596 = param8;
         this.var_2593 = param9;
         this.var_2333 = param10;
         this.var_2595 = param11;
      }
      
      public function setExtraData(param1:String, param2:int) : void
      {
         this.var_1629 = param1;
         this.var_1334 = param2;
      }
      
      public function get stripId() : int
      {
         return this.var_2164;
      }
      
      public function get itemType() : String
      {
         return this.var_1298;
      }
      
      public function get objId() : int
      {
         return this._objId;
      }
      
      public function get classId() : int
      {
         return this.var_1593;
      }
      
      public function get category() : int
      {
         return this._category;
      }
      
      public function get stuffData() : String
      {
         return this.var_1980;
      }
      
      public function get isGroupable() : Boolean
      {
         return this.var_2594;
      }
      
      public function get isRecyclable() : Boolean
      {
         return this.var_2596;
      }
      
      public function get isTradeable() : Boolean
      {
         return this.var_2593;
      }
      
      public function get isSellable() : Boolean
      {
         return this.var_2333;
      }
      
      public function get expiryTime() : int
      {
         return this.var_2595;
      }
      
      public function get slotId() : String
      {
         return this.var_1629;
      }
      
      public function get songId() : int
      {
         return this.var_2534;
      }
      
      public function get extra() : int
      {
         return this.var_1334;
      }
   }
}
