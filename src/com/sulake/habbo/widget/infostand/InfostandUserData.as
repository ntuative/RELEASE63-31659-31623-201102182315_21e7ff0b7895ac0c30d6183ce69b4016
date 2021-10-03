package com.sulake.habbo.widget.infostand
{
   import com.sulake.habbo.widget.events.RoomWidgetUserInfoUpdateEvent;
   
   public class InfostandUserData
   {
       
      
      private var _userId:int = 0;
      
      private var _userName:String = "";
      
      private var var_242:Array;
      
      private var var_1600:Array;
      
      private var var_1474:int = 0;
      
      private var var_2231:String = "";
      
      private var _respectLeft:int = 0;
      
      private var var_2225:int = 0;
      
      private var var_2228:int = 0;
      
      private var _type:String;
      
      private var var_724:int = 0;
      
      public function InfostandUserData()
      {
         this.var_242 = [];
         this.var_1600 = [];
         super();
      }
      
      public function set userId(param1:int) : void
      {
         this._userId = param1;
      }
      
      public function set userName(param1:String) : void
      {
         this._userName = param1;
      }
      
      public function set badges(param1:Array) : void
      {
         this.var_242 = param1;
      }
      
      public function set groupId(param1:int) : void
      {
         this.var_1474 = param1;
      }
      
      public function set groupBadgeId(param1:String) : void
      {
         this.var_2231 = param1;
      }
      
      public function set respectLeft(param1:int) : void
      {
         this._respectLeft = param1;
      }
      
      public function set carryItem(param1:int) : void
      {
         this.var_2225 = param1;
      }
      
      public function set userRoomId(param1:int) : void
      {
         this.var_2228 = param1;
      }
      
      public function set type(param1:String) : void
      {
         this._type = param1;
      }
      
      public function set petRespectLeft(param1:int) : void
      {
         this.var_724 = param1;
      }
      
      public function set givableBadges(param1:Array) : void
      {
         this.var_1600 = param1;
      }
      
      public function get userId() : int
      {
         return this._userId;
      }
      
      public function get userName() : String
      {
         return this._userName;
      }
      
      public function get badges() : Array
      {
         return this.var_242.slice();
      }
      
      public function get groupId() : int
      {
         return this.var_1474;
      }
      
      public function get groupBadgeId() : String
      {
         return this.var_2231;
      }
      
      public function get respectLeft() : int
      {
         return this._respectLeft;
      }
      
      public function get carryItem() : int
      {
         return this.var_2225;
      }
      
      public function get userRoomId() : int
      {
         return this.var_2228;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function get petRespectLeft() : int
      {
         return this.var_724;
      }
      
      public function get givableBadges() : Array
      {
         return this.var_1600;
      }
      
      public function isBot() : Boolean
      {
         return this.type == RoomWidgetUserInfoUpdateEvent.BOT;
      }
      
      public function setData(param1:RoomWidgetUserInfoUpdateEvent) : void
      {
         this.userId = param1.webID;
         this.userName = param1.name;
         this.badges = param1.badges;
         this.givableBadges = param1.givableBadges;
         this.groupId = param1.groupId;
         this.groupBadgeId = param1.groupBadgeId;
         this.respectLeft = param1.respectLeft;
         this.carryItem = param1.carryItem;
         this.userRoomId = param1.userRoomId;
         this.type = param1.type;
      }
   }
}
