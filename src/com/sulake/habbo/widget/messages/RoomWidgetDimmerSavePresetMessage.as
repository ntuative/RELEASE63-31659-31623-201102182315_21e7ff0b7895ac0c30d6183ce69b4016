package com.sulake.habbo.widget.messages
{
   public class RoomWidgetDimmerSavePresetMessage extends RoomWidgetMessage
   {
      
      public static const const_770:String = "RWSDPM_SAVE_PRESET";
       
      
      private var var_2222:int;
      
      private var var_2221:int;
      
      private var _color:uint;
      
      private var var_1036:int;
      
      private var var_2220:Boolean;
      
      public function RoomWidgetDimmerSavePresetMessage(param1:int, param2:int, param3:uint, param4:int, param5:Boolean)
      {
         super(const_770);
         this.var_2222 = param1;
         this.var_2221 = param2;
         this._color = param3;
         this.var_1036 = param4;
         this.var_2220 = param5;
      }
      
      public function get presetNumber() : int
      {
         return this.var_2222;
      }
      
      public function get effectTypeId() : int
      {
         return this.var_2221;
      }
      
      public function get color() : uint
      {
         return this._color;
      }
      
      public function get brightness() : int
      {
         return this.var_1036;
      }
      
      public function get apply() : Boolean
      {
         return this.var_2220;
      }
   }
}
