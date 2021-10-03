package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class UserUpdateMessageData
   {
       
      
      private var _id:int = 0;
      
      private var _x:Number = 0;
      
      private var var_155:Number = 0;
      
      private var var_156:Number = 0;
      
      private var var_2255:Number = 0;
      
      private var var_2252:Number = 0;
      
      private var var_2256:Number = 0;
      
      private var var_2251:Number = 0;
      
      private var var_263:int = 0;
      
      private var var_2253:int = 0;
      
      private var var_314:Array;
      
      private var var_2254:Boolean = false;
      
      public function UserUpdateMessageData(param1:int, param2:Number, param3:Number, param4:Number, param5:Number, param6:int, param7:int, param8:Number, param9:Number, param10:Number, param11:Boolean, param12:Array)
      {
         this.var_314 = [];
         super();
         this._id = param1;
         this._x = param2;
         this.var_155 = param3;
         this.var_156 = param4;
         this.var_2255 = param5;
         this.var_263 = param6;
         this.var_2253 = param7;
         this.var_2252 = param8;
         this.var_2256 = param9;
         this.var_2251 = param10;
         this.var_2254 = param11;
         this.var_314 = param12;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get x() : Number
      {
         return this._x;
      }
      
      public function get y() : Number
      {
         return this.var_155;
      }
      
      public function get z() : Number
      {
         return this.var_156;
      }
      
      public function get localZ() : Number
      {
         return this.var_2255;
      }
      
      public function get targetX() : Number
      {
         return this.var_2252;
      }
      
      public function get targetY() : Number
      {
         return this.var_2256;
      }
      
      public function get targetZ() : Number
      {
         return this.var_2251;
      }
      
      public function get dir() : int
      {
         return this.var_263;
      }
      
      public function get dirHead() : int
      {
         return this.var_2253;
      }
      
      public function get isMoving() : Boolean
      {
         return this.var_2254;
      }
      
      public function get actions() : Array
      {
         return this.var_314.slice();
      }
   }
}
