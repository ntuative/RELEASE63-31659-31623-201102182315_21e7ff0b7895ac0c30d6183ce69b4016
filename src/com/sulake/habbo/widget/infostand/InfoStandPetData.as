package com.sulake.habbo.widget.infostand
{
   import com.sulake.habbo.widget.events.RoomWidgetPetInfoUpdateEvent;
   import flash.display.BitmapData;
   
   public class InfoStandPetData
   {
       
      
      private var var_1363:int;
      
      private var var_2100:int;
      
      private var var_2106:int;
      
      private var var_2101:int;
      
      private var _energy:int;
      
      private var var_2103:int;
      
      private var _nutrition:int;
      
      private var var_2107:int;
      
      private var _petRespect:int;
      
      private var _name:String = "";
      
      private var var_1599:int = -1;
      
      private var _type:int;
      
      private var var_2264:int;
      
      private var var_44:BitmapData;
      
      private var var_2104:Boolean;
      
      private var var_2105:int;
      
      private var _ownerName:String;
      
      private var _canOwnerBeKicked:Boolean;
      
      private var var_2099:int;
      
      private var var_473:int;
      
      public function InfoStandPetData()
      {
         super();
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get id() : int
      {
         return this.var_1599;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get race() : int
      {
         return this.var_2264;
      }
      
      public function get image() : BitmapData
      {
         return this.var_44;
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
      
      public function get petRespect() : int
      {
         return this._petRespect;
      }
      
      public function get roomIndex() : int
      {
         return this.var_2099;
      }
      
      public function setData(param1:RoomWidgetPetInfoUpdateEvent) : void
      {
         this._name = param1.name;
         this.var_1599 = param1.id;
         this._type = param1.petType;
         this.var_2264 = param1.petRace;
         this.var_44 = param1.image;
         this.var_2104 = param1.isOwnPet;
         this.var_2105 = param1.ownerId;
         this._ownerName = param1.ownerName;
         this._canOwnerBeKicked = param1.canOwnerBeKicked;
         this.var_1363 = param1.level;
         this.var_2100 = param1.levelMax;
         this.var_2106 = param1.experience;
         this.var_2101 = param1.experienceMax;
         this._energy = param1.energy;
         this.var_2103 = param1.energyMax;
         this._nutrition = param1.nutrition;
         this.var_2107 = param1.nutritionMax;
         this._petRespect = param1.petRespect;
         this.var_2099 = param1.roomIndex;
         this.var_473 = param1.age;
      }
   }
}
