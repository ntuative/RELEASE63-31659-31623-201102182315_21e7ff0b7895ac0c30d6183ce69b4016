package com.sulake.habbo.widget.messages
{
   public class RoomWidgetOpenInventoryMessage extends RoomWidgetMessage
   {
      
      public static const const_889:String = "RWGOI_MESSAGE_OPEN_INVENTORY";
      
      public static const const_1012:String = "inventory_effects";
      
      public static const const_1003:String = "inventory_badges";
      
      public static const const_1397:String = "inventory_clothes";
      
      public static const const_1513:String = "inventory_furniture";
       
      
      private var var_2198:String;
      
      public function RoomWidgetOpenInventoryMessage(param1:String)
      {
         super(const_889);
         this.var_2198 = param1;
      }
      
      public function get inventoryType() : String
      {
         return this.var_2198;
      }
   }
}
