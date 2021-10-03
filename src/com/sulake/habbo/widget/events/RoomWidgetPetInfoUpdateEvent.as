package com.sulake.habbo.widget.events
{
   import flash.display.BitmapData;
   
   public class RoomWidgetPetInfoUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_105:String = "RWPIUE_PET_INFO";
       
      
      private var var_1363:int;
      
      private var var_2100:int;
      
      private var var_2106:int;
      
      private var var_2101:int;
      
      private var _energy:int;
      
      private var var_2103:int;
      
      private var _nutrition:int;
      
      private var var_2107:int;
      
      private var var_724:int;
      
      private var _petRespect:int;
      
      private var var_473:int;
      
      private var _name:String;
      
      private var _id:int;
      
      private var var_44:BitmapData;
      
      private var var_1096:int;
      
      private var var_2102:int;
      
      private var var_2104:Boolean;
      
      private var var_2105:int;
      
      private var _ownerName:String;
      
      private var _canOwnerBeKicked:Boolean;
      
      private var var_2099:int;
      
      public function RoomWidgetPetInfoUpdateEvent(param1:int, param2:int, param3:String, param4:int, param5:BitmapData, param6:Boolean, param7:int, param8:String, param9:int, param10:Boolean = false, param11:Boolean = false)
      {
         super(RoomWidgetPetInfoUpdateEvent.const_105,param10,param11);
         this.var_1096 = param1;
         this.var_2102 = param2;
         this._name = param3;
         this._id = param4;
         this.var_44 = param5;
         this.var_2104 = param6;
         this.var_2105 = param7;
         this._ownerName = param8;
         this.var_2099 = param9;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get image() : BitmapData
      {
         return this.var_44;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get petType() : int
      {
         return this.var_1096;
      }
      
      public function get petRace() : int
      {
         return this.var_2102;
      }
      
      public function get isOwnPet() : Boolean
      {
         return this.var_2104;
      }
      
      public function get ownerId() : int
      {
         return this.var_2105;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get canOwnerBeKicked() : Boolean
      {
         return this._canOwnerBeKicked;
      }
      
      public function get roomIndex() : int
      {
         return this.var_2099;
      }
      
      public function get age() : int
      {
         return this.var_473;
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
      
      public function get petRespectLeft() : int
      {
         return this.var_724;
      }
      
      public function get petRespect() : int
      {
         return this._petRespect;
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
      
      public function set petRespectLeft(param1:int) : void
      {
         this.var_724 = param1;
      }
      
      public function set canOwnerBeKicked(param1:Boolean) : void
      {
         this._canOwnerBeKicked = param1;
      }
      
      public function set petRespect(param1:int) : void
      {
         this._petRespect = param1;
      }
      
      public function set age(param1:int) : void
      {
         this.var_473 = param1;
      }
   }
}
