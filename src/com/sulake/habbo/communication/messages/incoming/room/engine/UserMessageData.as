package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class UserMessageData
   {
      
      public static const const_1018:String = "M";
      
      public static const const_1636:String = "F";
       
      
      private var _id:int = 0;
      
      private var _x:Number = 0;
      
      private var var_155:Number = 0;
      
      private var var_156:Number = 0;
      
      private var var_263:int = 0;
      
      private var _name:String = "";
      
      private var _userType:int = 0;
      
      private var var_908:String = "";
      
      private var var_581:String = "";
      
      private var var_2430:String = "";
      
      private var var_2223:int;
      
      private var var_2237:int = 0;
      
      private var var_2428:String = "";
      
      private var var_2427:int = 0;
      
      private var var_2227:int = 0;
      
      private var var_2429:String = "";
      
      private var var_175:Boolean = false;
      
      public function UserMessageData(param1:int)
      {
         super();
         this._id = param1;
      }
      
      public function setReadOnly() : void
      {
         this.var_175 = true;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get x() : Number
      {
         return this._x;
      }
      
      public function set x(param1:Number) : void
      {
         if(!this.var_175)
         {
            this._x = param1;
         }
      }
      
      public function get y() : Number
      {
         return this.var_155;
      }
      
      public function set y(param1:Number) : void
      {
         if(!this.var_175)
         {
            this.var_155 = param1;
         }
      }
      
      public function get z() : Number
      {
         return this.var_156;
      }
      
      public function set z(param1:Number) : void
      {
         if(!this.var_175)
         {
            this.var_156 = param1;
         }
      }
      
      public function get dir() : int
      {
         return this.var_263;
      }
      
      public function set dir(param1:int) : void
      {
         if(!this.var_175)
         {
            this.var_263 = param1;
         }
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set name(param1:String) : void
      {
         if(!this.var_175)
         {
            this._name = param1;
         }
      }
      
      public function get userType() : int
      {
         return this._userType;
      }
      
      public function set userType(param1:int) : void
      {
         if(!this.var_175)
         {
            this._userType = param1;
         }
      }
      
      public function get sex() : String
      {
         return this.var_908;
      }
      
      public function set sex(param1:String) : void
      {
         if(!this.var_175)
         {
            this.var_908 = param1;
         }
      }
      
      public function get figure() : String
      {
         return this.var_581;
      }
      
      public function set figure(param1:String) : void
      {
         if(!this.var_175)
         {
            this.var_581 = param1;
         }
      }
      
      public function get custom() : String
      {
         return this.var_2430;
      }
      
      public function set custom(param1:String) : void
      {
         if(!this.var_175)
         {
            this.var_2430 = param1;
         }
      }
      
      public function get achievementScore() : int
      {
         return this.var_2223;
      }
      
      public function set achievementScore(param1:int) : void
      {
         if(!this.var_175)
         {
            this.var_2223 = param1;
         }
      }
      
      public function get webID() : int
      {
         return this.var_2237;
      }
      
      public function set webID(param1:int) : void
      {
         if(!this.var_175)
         {
            this.var_2237 = param1;
         }
      }
      
      public function get groupID() : String
      {
         return this.var_2428;
      }
      
      public function set groupID(param1:String) : void
      {
         if(!this.var_175)
         {
            this.var_2428 = param1;
         }
      }
      
      public function get groupStatus() : int
      {
         return this.var_2427;
      }
      
      public function set groupStatus(param1:int) : void
      {
         if(!this.var_175)
         {
            this.var_2427 = param1;
         }
      }
      
      public function get xp() : int
      {
         return this.var_2227;
      }
      
      public function set xp(param1:int) : void
      {
         if(!this.var_175)
         {
            this.var_2227 = param1;
         }
      }
      
      public function get subType() : String
      {
         return this.var_2429;
      }
      
      public function set subType(param1:String) : void
      {
         if(!this.var_175)
         {
            this.var_2429 = param1;
         }
      }
   }
}
