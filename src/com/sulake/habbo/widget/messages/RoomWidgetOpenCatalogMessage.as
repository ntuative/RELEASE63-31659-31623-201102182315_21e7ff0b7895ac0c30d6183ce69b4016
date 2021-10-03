package com.sulake.habbo.widget.messages
{
   public class RoomWidgetOpenCatalogMessage extends RoomWidgetMessage
   {
      
      public static const const_351:String = "RWGOI_MESSAGE_OPEN_CATALOG";
      
      public static const const_1034:String = "RWOCM_CLUB_MAIN";
      
      public static const const_1013:String = "RWOCM_PIXELS";
      
      public static const const_1197:String = "RWOCM_CREDITS";
       
      
      private var var_2395:String = "";
      
      public function RoomWidgetOpenCatalogMessage(param1:String)
      {
         super(const_351);
         this.var_2395 = param1;
      }
      
      public function get pageKey() : String
      {
         return this.var_2395;
      }
   }
}
