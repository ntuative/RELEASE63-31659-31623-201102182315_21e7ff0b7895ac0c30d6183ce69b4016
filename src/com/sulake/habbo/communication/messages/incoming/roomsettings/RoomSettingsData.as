package com.sulake.habbo.communication.messages.incoming.roomsettings
{
   public class RoomSettingsData
   {
      
      public static const const_424:int = 0;
      
      public static const const_184:int = 1;
      
      public static const const_119:int = 2;
      
      public static const const_879:Array = ["open","closed","password"];
       
      
      private var _roomId:int;
      
      private var _name:String;
      
      private var var_1831:String;
      
      private var var_2009:int;
      
      private var var_1301:int;
      
      private var var_2174:int;
      
      private var var_2175:int;
      
      private var var_803:Array;
      
      private var var_2179:Array;
      
      private var var_2176:int;
      
      private var var_2014:Boolean;
      
      private var var_2178:Boolean;
      
      private var var_2177:Boolean;
      
      private var var_2180:Boolean;
      
      public function RoomSettingsData()
      {
         super();
      }
      
      public function get allowPets() : Boolean
      {
         return this.var_2014;
      }
      
      public function set allowPets(param1:Boolean) : void
      {
         this.var_2014 = param1;
      }
      
      public function get allowFoodConsume() : Boolean
      {
         return this.var_2178;
      }
      
      public function set allowFoodConsume(param1:Boolean) : void
      {
         this.var_2178 = param1;
      }
      
      public function get allowWalkThrough() : Boolean
      {
         return this.var_2177;
      }
      
      public function set allowWalkThrough(param1:Boolean) : void
      {
         this.var_2177 = param1;
      }
      
      public function get hideWalls() : Boolean
      {
         return this.var_2180;
      }
      
      public function set hideWalls(param1:Boolean) : void
      {
         this.var_2180 = param1;
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function set roomId(param1:int) : void
      {
         this._roomId = param1;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set name(param1:String) : void
      {
         this._name = param1;
      }
      
      public function get description() : String
      {
         return this.var_1831;
      }
      
      public function set description(param1:String) : void
      {
         this.var_1831 = param1;
      }
      
      public function get doorMode() : int
      {
         return this.var_2009;
      }
      
      public function set doorMode(param1:int) : void
      {
         this.var_2009 = param1;
      }
      
      public function get categoryId() : int
      {
         return this.var_1301;
      }
      
      public function set categoryId(param1:int) : void
      {
         this.var_1301 = param1;
      }
      
      public function get maximumVisitors() : int
      {
         return this.var_2174;
      }
      
      public function set maximumVisitors(param1:int) : void
      {
         this.var_2174 = param1;
      }
      
      public function get maximumVisitorsLimit() : int
      {
         return this.var_2175;
      }
      
      public function set maximumVisitorsLimit(param1:int) : void
      {
         this.var_2175 = param1;
      }
      
      public function get tags() : Array
      {
         return this.var_803;
      }
      
      public function set tags(param1:Array) : void
      {
         this.var_803 = param1;
      }
      
      public function get controllers() : Array
      {
         return this.var_2179;
      }
      
      public function set controllers(param1:Array) : void
      {
         this.var_2179 = param1;
      }
      
      public function get controllerCount() : int
      {
         return this.var_2176;
      }
      
      public function set controllerCount(param1:int) : void
      {
         this.var_2176 = param1;
      }
   }
}
