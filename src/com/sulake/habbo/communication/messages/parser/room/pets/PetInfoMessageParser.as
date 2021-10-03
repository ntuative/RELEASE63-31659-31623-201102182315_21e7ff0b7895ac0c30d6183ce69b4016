package com.sulake.habbo.communication.messages.parser.room.pets
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetInfoMessageParser implements IMessageParser
   {
       
      
      private var var_1599:int;
      
      private var _name:String;
      
      private var var_1363:int;
      
      private var var_2240:int;
      
      private var var_2106:int;
      
      private var _energy:int;
      
      private var _nutrition:int;
      
      private var var_581:String;
      
      private var var_2242:int;
      
      private var var_2239:int;
      
      private var var_2241:int;
      
      private var var_2086:int;
      
      private var var_2105:int;
      
      private var _ownerName:String;
      
      private var var_473:int;
      
      public function PetInfoMessageParser()
      {
         super();
      }
      
      public function get petId() : int
      {
         return this.var_1599;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get level() : int
      {
         return this.var_1363;
      }
      
      public function get maxLevel() : int
      {
         return this.var_2240;
      }
      
      public function get experience() : int
      {
         return this.var_2106;
      }
      
      public function get energy() : int
      {
         return this._energy;
      }
      
      public function get nutrition() : int
      {
         return this._nutrition;
      }
      
      public function get figure() : String
      {
         return this.var_581;
      }
      
      public function get experienceRequiredToLevel() : int
      {
         return this.var_2242;
      }
      
      public function get maxEnergy() : int
      {
         return this.var_2239;
      }
      
      public function get maxNutrition() : int
      {
         return this.var_2241;
      }
      
      public function get respect() : int
      {
         return this.var_2086;
      }
      
      public function get ownerId() : int
      {
         return this.var_2105;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get age() : int
      {
         return this.var_473;
      }
      
      public function flush() : Boolean
      {
         this.var_1599 = -1;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         this.var_1599 = param1.readInteger();
         this._name = param1.readString();
         this.var_1363 = param1.readInteger();
         this.var_2240 = param1.readInteger();
         this.var_2106 = param1.readInteger();
         this.var_2242 = param1.readInteger();
         this._energy = param1.readInteger();
         this.var_2239 = param1.readInteger();
         this._nutrition = param1.readInteger();
         this.var_2241 = param1.readInteger();
         this.var_581 = param1.readString();
         this.var_2086 = param1.readInteger();
         this.var_2105 = param1.readInteger();
         this.var_473 = param1.readInteger();
         this._ownerName = param1.readString();
         return true;
      }
   }
}
