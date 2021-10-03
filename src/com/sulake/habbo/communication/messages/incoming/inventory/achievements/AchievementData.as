package com.sulake.habbo.communication.messages.incoming.inventory.achievements
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class AchievementData
   {
       
      
      private var _type:int;
      
      private var var_1363:int;
      
      private var var_294:String;
      
      private var var_2434:int;
      
      private var var_2162:int;
      
      private var var_1746:int;
      
      private var var_2433:int;
      
      public function AchievementData(param1:IMessageDataWrapper)
      {
         super();
         this._type = param1.readInteger();
         this.var_1363 = param1.readInteger();
         this.var_294 = param1.readString();
         this.var_2434 = param1.readInteger();
         this.var_2162 = param1.readInteger();
         this.var_1746 = param1.readInteger();
         this.var_2433 = param1.readInteger();
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get badgeId() : String
      {
         return this.var_294;
      }
      
      public function get level() : int
      {
         return this.var_1363;
      }
      
      public function get scoreLimit() : int
      {
         return this.var_2434;
      }
      
      public function get levelRewardPoints() : int
      {
         return this.var_2162;
      }
      
      public function get levelRewardPointType() : int
      {
         return this.var_1746;
      }
      
      public function get currentPoints() : int
      {
         return this.var_2433;
      }
   }
}
