package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ModeratorUserInfoData
   {
       
      
      private var _userId:int;
      
      private var _userName:String;
      
      private var var_2518:int;
      
      private var var_2521:int;
      
      private var var_755:Boolean;
      
      private var var_2517:int;
      
      private var var_2520:int;
      
      private var var_2519:int;
      
      private var var_2522:int;
      
      public function ModeratorUserInfoData(param1:IMessageDataWrapper)
      {
         super();
         this._userId = param1.readInteger();
         this._userName = param1.readString();
         this.var_2518 = param1.readInteger();
         this.var_2521 = param1.readInteger();
         this.var_755 = param1.readBoolean();
         this.var_2517 = param1.readInteger();
         this.var_2520 = param1.readInteger();
         this.var_2519 = param1.readInteger();
         this.var_2522 = param1.readInteger();
      }
      
      public function get userId() : int
      {
         return this._userId;
      }
      
      public function get userName() : String
      {
         return this._userName;
      }
      
      public function get minutesSinceRegistration() : int
      {
         return this.var_2518;
      }
      
      public function get minutesSinceLastLogin() : int
      {
         return this.var_2521;
      }
      
      public function get online() : Boolean
      {
         return this.var_755;
      }
      
      public function get cfhCount() : int
      {
         return this.var_2517;
      }
      
      public function get abusiveCfhCount() : int
      {
         return this.var_2520;
      }
      
      public function get cautionCount() : int
      {
         return this.var_2519;
      }
      
      public function get banCount() : int
      {
         return this.var_2522;
      }
   }
}
