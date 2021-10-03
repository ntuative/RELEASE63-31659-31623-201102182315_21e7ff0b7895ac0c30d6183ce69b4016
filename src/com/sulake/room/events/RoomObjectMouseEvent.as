package com.sulake.room.events
{
   public class RoomObjectMouseEvent extends RoomObjectEvent
   {
      
      public static const const_242:String = "ROE_MOUSE_CLICK";
      
      public static const const_1931:String = "ROE_MOUSE_ENTER";
      
      public static const const_513:String = "ROE_MOUSE_MOVE";
      
      public static const const_1819:String = "ROE_MOUSE_LEAVE";
      
      public static const const_1800:String = "ROE_MOUSE_DOUBLE_CLICK";
      
      public static const const_433:String = "ROE_MOUSE_DOWN";
       
      
      private var var_1579:String = "";
      
      private var var_2092:Boolean;
      
      private var var_2091:Boolean;
      
      private var var_2090:Boolean;
      
      private var var_2095:Boolean;
      
      public function RoomObjectMouseEvent(param1:String, param2:String, param3:int, param4:String, param5:Boolean = false, param6:Boolean = false, param7:Boolean = false, param8:Boolean = false, param9:Boolean = false, param10:Boolean = false)
      {
         super(param1,param3,param4,param9,param10);
         this.var_1579 = param2;
         this.var_2092 = param5;
         this.var_2091 = param6;
         this.var_2090 = param7;
         this.var_2095 = param8;
      }
      
      public function get eventId() : String
      {
         return this.var_1579;
      }
      
      public function get altKey() : Boolean
      {
         return this.var_2092;
      }
      
      public function get ctrlKey() : Boolean
      {
         return this.var_2091;
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
