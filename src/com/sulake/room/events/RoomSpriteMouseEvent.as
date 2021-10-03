package com.sulake.room.events
{
   public class RoomSpriteMouseEvent
   {
       
      
      private var _type:String = "";
      
      private var var_1579:String = "";
      
      private var var_1905:String = "";
      
      private var var_2094:String = "";
      
      private var var_2097:Number = 0;
      
      private var var_2089:Number = 0;
      
      private var var_2093:Number = 0;
      
      private var var_2096:Number = 0;
      
      private var var_2091:Boolean = false;
      
      private var var_2092:Boolean = false;
      
      private var var_2090:Boolean = false;
      
      private var var_2095:Boolean = false;
      
      public function RoomSpriteMouseEvent(param1:String, param2:String, param3:String, param4:String, param5:Number, param6:Number, param7:Number = 0, param8:Number = 0, param9:Boolean = false, param10:Boolean = false, param11:Boolean = false, param12:Boolean = false)
      {
         super();
         this._type = param1;
         this.var_1579 = param2;
         this.var_1905 = param3;
         this.var_2094 = param4;
         this.var_2097 = param5;
         this.var_2089 = param6;
         this.var_2093 = param7;
         this.var_2096 = param8;
         this.var_2091 = param9;
         this.var_2092 = param10;
         this.var_2090 = param11;
         this.var_2095 = param12;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function get eventId() : String
      {
         return this.var_1579;
      }
      
      public function get canvasId() : String
      {
         return this.var_1905;
      }
      
      public function get spriteTag() : String
      {
         return this.var_2094;
      }
      
      public function get screenX() : Number
      {
         return this.var_2097;
      }
      
      public function get screenY() : Number
      {
         return this.var_2089;
      }
      
      public function get localX() : Number
      {
         return this.var_2093;
      }
      
      public function get localY() : Number
      {
         return this.var_2096;
      }
      
      public function get ctrlKey() : Boolean
      {
         return this.var_2091;
      }
      
      public function get altKey() : Boolean
      {
         return this.var_2092;
      }
      
      public function get shiftKey() : Boolean
      {
         return this.var_2090;
      }
      
      public function get buttonDown() : Boolean
      {
         return this.var_2095;
      }
   }
}
