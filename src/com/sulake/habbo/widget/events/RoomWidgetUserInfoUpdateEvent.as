package com.sulake.habbo.widget.events
{
   import flash.display.BitmapData;
   
   public class RoomWidgetUserInfoUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_116:String = "RWUIUE_OWN_USER";
      
      public static const BOT:String = "RWUIUE_BOT";
      
      public static const const_150:String = "RWUIUE_PEER";
      
      public static const TRADE_REASON_OK:int = 0;
      
      public static const const_1082:int = 2;
      
      public static const const_1172:int = 3;
      
      public static const const_1424:String = "BOT";
       
      
      private var _name:String = "";
      
      private var var_1505:String = "";
      
      private var var_2223:int;
      
      private var var_2237:int = 0;
      
      private var var_2227:int = 0;
      
      private var var_581:String = "";
      
      private var var_44:BitmapData = null;
      
      private var var_242:Array;
      
      private var var_1600:Array;
      
      private var var_1474:int = 0;
      
      private var var_2231:String = "";
      
      private var var_2225:int = 0;
      
      private var var_2228:int = 0;
      
      private var var_1680:Boolean = false;
      
      private var var_1503:String = "";
      
      private var var_2234:Boolean = false;
      
      private var var_2233:Boolean = true;
      
      private var _respectLeft:int = 0;
      
      private var var_2226:Boolean = false;
      
      private var var_2235:Boolean = false;
      
      private var var_2229:Boolean = false;
      
      private var var_2232:Boolean = false;
      
      private var var_2236:Boolean = false;
      
      private var var_2224:Boolean = false;
      
      private var var_2230:int = 0;
      
      private var var_1678:Boolean = false;
      
      public function RoomWidgetUserInfoUpdateEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         this.var_242 = [];
         this.var_1600 = [];
         super(param1,param2,param3);
      }
      
      public function set name(param1:String) : void
      {
         this._name = param1;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set motto(param1:String) : void
      {
         this.var_1505 = param1;
      }
      
      public function get motto() : String
      {
         return this.var_1505;
      }
      
      public function set achievementScore(param1:int) : void
      {
         this.var_2223 = param1;
      }
      
      public function get achievementScore() : int
      {
         return this.var_2223;
      }
      
      public function set webID(param1:int) : void
      {
         this.var_2237 = param1;
      }
      
      public function get webID() : int
      {
         return this.var_2237;
      }
      
      public function set xp(param1:int) : void
      {
         this.var_2227 = param1;
      }
      
      public function get xp() : int
      {
         return this.var_2227;
      }
      
      public function set figure(param1:String) : void
      {
         this.var_581 = param1;
      }
      
      public function get figure() : String
      {
         return this.var_581;
      }
      
      public function set image(param1:BitmapData) : void
      {
         this.var_44 = param1;
      }
      
      public function get image() : BitmapData
      {
         return this.var_44;
      }
      
      public function set badges(param1:Array) : void
      {
         this.var_242 = param1;
      }
      
      public function get badges() : Array
      {
         return this.var_242;
      }
      
      public function get givableBadges() : Array
      {
         return this.var_1600;
      }
      
      public function set givableBadges(param1:Array) : void
      {
         this.var_1600 = param1;
      }
      
      public function set groupId(param1:int) : void
      {
         this.var_1474 = param1;
      }
      
      public function get groupId() : int
      {
         return this.var_1474;
      }
      
      public function set groupBadgeId(param1:String) : void
      {
         this.var_2231 = param1;
      }
      
      public function get groupBadgeId() : String
      {
         return this.var_2231;
      }
      
      public function set canBeAskedAsFriend(param1:Boolean) : void
      {
         this.var_2234 = param1;
      }
      
      public function get canBeAskedAsFriend() : Boolean
      {
         return this.var_2234;
      }
      
      public function set respectLeft(param1:int) : void
      {
         this._respectLeft = param1;
      }
      
      public function get respectLeft() : int
      {
         return this._respectLeft;
      }
      
      public function set isIgnored(param1:Boolean) : void
      {
         this.var_2226 = param1;
      }
      
      public function get isIgnored() : Boolean
      {
         return this.var_2226;
      }
      
      public function set amIOwner(param1:Boolean) : void
      {
         this.var_2235 = param1;
      }
      
      public function get amIOwner() : Boolean
      {
         return this.var_2235;
      }
      
      public function set amIController(param1:Boolean) : void
      {
         this.var_2229 = param1;
      }
      
      public function get amIController() : Boolean
      {
         return this.var_2229;
      }
      
      public function set amIAnyRoomController(param1:Boolean) : void
      {
         this.var_2232 = param1;
      }
      
      public function get amIAnyRoomController() : Boolean
      {
         return this.var_2232;
      }
      
      public function set hasFlatControl(param1:Boolean) : void
      {
         this.var_2236 = param1;
      }
      
      public function get hasFlatControl() : Boolean
      {
         return this.var_2236;
      }
      
      public function set canTrade(param1:Boolean) : void
      {
         this.var_2224 = param1;
      }
      
      public function get canTrade() : Boolean
      {
         return this.var_2224;
      }
      
      public function set canTradeReason(param1:int) : void
      {
         this.var_2230 = param1;
      }
      
      public function get canTradeReason() : int
      {
         return this.var_2230;
      }
      
      public function set canBeKicked(param1:Boolean) : void
      {
         this.var_2233 = param1;
      }
      
      public function get canBeKicked() : Boolean
      {
         return this.var_2233;
      }
      
      public function set isRoomOwner(param1:Boolean) : void
      {
         this.var_1678 = param1;
      }
      
      public function get isRoomOwner() : Boolean
      {
         return this.var_1678;
      }
      
      public function set carryItem(param1:int) : void
      {
         this.var_2225 = param1;
      }
      
      public function get carryItem() : int
      {
         return this.var_2225;
      }
      
      public function set userRoomId(param1:int) : void
      {
         this.var_2228 = param1;
      }
      
      public function get userRoomId() : int
      {
         return this.var_2228;
      }
      
      public function set isSpectatorMode(param1:Boolean) : void
      {
         this.var_1680 = param1;
      }
      
      public function get isSpectatorMode() : Boolean
      {
         return this.var_1680;
      }
      
      public function set realName(param1:String) : void
      {
         this.var_1503 = param1;
      }
      
      public function get realName() : String
      {
         return this.var_1503;
      }
   }
}
