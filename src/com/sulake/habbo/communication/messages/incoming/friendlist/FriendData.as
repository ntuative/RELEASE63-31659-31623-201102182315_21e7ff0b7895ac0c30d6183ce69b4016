package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class FriendData
   {
       
      
      private var _id:int;
      
      private var _name:String;
      
      private var var_860:int;
      
      private var var_755:Boolean;
      
      private var var_1504:Boolean;
      
      private var var_581:String;
      
      private var var_1301:int;
      
      private var var_1505:String;
      
      private var var_1502:String;
      
      private var var_1503:String;
      
      public function FriendData(param1:IMessageDataWrapper)
      {
         super();
         this._id = param1.readInteger();
         this._name = param1.readString();
         this.var_860 = param1.readInteger();
         this.var_755 = param1.readBoolean();
         this.var_1504 = param1.readBoolean();
         this.var_581 = param1.readString();
         this.var_1301 = param1.readInteger();
         this.var_1505 = param1.readString();
         this.var_1502 = param1.readString();
         this.var_1503 = param1.readString();
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get gender() : int
      {
         return this.var_860;
      }
      
      public function get online() : Boolean
      {
         return this.var_755;
      }
      
      public function get followingAllowed() : Boolean
      {
         return this.var_1504;
      }
      
      public function get figure() : String
      {
         return this.var_581;
      }
      
      public function get categoryId() : int
      {
         return this.var_1301;
      }
      
      public function get motto() : String
      {
         return this.var_1505;
      }
      
      public function get lastAccess() : String
      {
         return this.var_1502;
      }
      
      public function get realName() : String
      {
         return this.var_1503;
      }
   }
}
