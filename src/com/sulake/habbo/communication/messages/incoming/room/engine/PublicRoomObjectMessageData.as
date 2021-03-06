package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class PublicRoomObjectMessageData
   {
       
      
      private var _name:String = "";
      
      private var _type:String = "";
      
      private var _x:Number = 0;
      
      private var var_155:Number = 0;
      
      private var var_156:Number = 0;
      
      private var var_263:int = 0;
      
      private var var_466:int = 0;
      
      private var var_566:int = 0;
      
      private var var_175:Boolean = false;
      
      public function PublicRoomObjectMessageData()
      {
         super();
      }
      
      public function setReadOnly() : void
      {
         this.var_175 = true;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function set type(param1:String) : void
      {
         if(!this.var_175)
         {
            this._type = param1;
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
      
      public function get sizeX() : int
      {
         return this.var_466;
      }
      
      public function set sizeX(param1:int) : void
      {
         if(!this.var_175)
         {
            this.var_466 = param1;
         }
      }
      
      public function get sizeY() : int
      {
         return this.var_566;
      }
      
      public function set sizeY(param1:int) : void
      {
         if(!this.var_175)
         {
            this.var_566 = param1;
         }
      }
   }
}
