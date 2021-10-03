package com.sulake.habbo.communication.messages.parser.notifications
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class HabboAchievementNotificationMessageParser implements IMessageParser
   {
       
      
      private var _type:int;
      
      private var var_1363:int;
      
      private var var_1699:int;
      
      private var var_2162:int;
      
      private var var_1746:int;
      
      private var var_1364:int;
      
      private var var_2161:String = "";
      
      private var var_2163:String = "";
      
      private var var_2160:int;
      
      public function HabboAchievementNotificationMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._type = param1.readInteger();
         this.var_1363 = param1.readInteger();
         this.var_2161 = param1.readString();
         this.var_1699 = param1.readInteger();
         this.var_2162 = param1.readInteger();
         this.var_1746 = param1.readInteger();
         this.var_1364 = param1.readInteger();
         this.var_2160 = param1.readInteger();
         this.var_2163 = param1.readString();
         return true;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get level() : int
      {
         return this.var_1363;
      }
      
      public function get points() : int
      {
         return this.var_1699;
      }
      
      public function get levelRewardPoints() : int
      {
         return this.var_2162;
      }
      
      public function get levelRewardPointType() : int
      {
         return this.var_1746;
      }
      
      public function get bonusPoints() : int
      {
         return this.var_1364;
      }
      
      public function get badgeID() : String
      {
         return this.var_2161;
      }
      
      public function get achievementID() : int
      {
         return this.var_2160;
      }
      
      public function get removedBadgeID() : String
      {
         return this.var_2163;
      }
   }
}
