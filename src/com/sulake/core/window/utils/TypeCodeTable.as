package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowType;
   import flash.utils.Dictionary;
   
   public class TypeCodeTable extends WindowType
   {
       
      
      public function TypeCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["background"] = const_892;
         param1["bitmap"] = const_872;
         param1["border"] = const_843;
         param1["border_notify"] = const_1401;
         param1["button"] = const_543;
         param1["button_thick"] = const_686;
         param1["button_icon"] = const_1577;
         param1["button_group_left"] = const_893;
         param1["button_group_center"] = const_757;
         param1["button_group_right"] = const_650;
         param1["canvas"] = const_734;
         param1["checkbox"] = const_765;
         param1["closebutton"] = const_1143;
         param1["container"] = const_361;
         param1["container_button"] = const_665;
         param1["display_object_wrapper"] = const_834;
         param1["dropmenu"] = const_420;
         param1["dropmenu_item"] = const_439;
         param1["frame"] = const_356;
         param1["frame_notify"] = const_1394;
         param1["header"] = const_824;
         param1["html"] = const_977;
         param1["icon"] = const_1103;
         param1["itemgrid"] = const_1206;
         param1["itemgrid_horizontal"] = const_511;
         param1["itemgrid_vertical"] = const_692;
         param1["itemlist"] = const_1163;
         param1["itemlist_horizontal"] = const_355;
         param1["itemlist_vertical"] = const_385;
         param1["label"] = WINDOW_TYPE_LABEL;
         param1["maximizebox"] = const_1596;
         param1["menu"] = const_1485;
         param1["menu_item"] = const_1581;
         param1["submenu"] = const_1059;
         param1["minimizebox"] = const_1502;
         param1["notify"] = const_1562;
         param1["null"] = const_671;
         param1["password"] = const_730;
         param1["radiobutton"] = const_711;
         param1["region"] = const_728;
         param1["restorebox"] = const_1639;
         param1["scaler"] = const_691;
         param1["scaler_horizontal"] = const_1567;
         param1["scaler_vertical"] = const_1514;
         param1["scrollbar_horizontal"] = const_558;
         param1["scrollbar_vertical"] = const_808;
         param1["scrollbar_slider_button_up"] = const_1107;
         param1["scrollbar_slider_button_down"] = const_1116;
         param1["scrollbar_slider_button_left"] = const_1113;
         param1["scrollbar_slider_button_right"] = const_1146;
         param1["scrollbar_slider_bar_horizontal"] = const_996;
         param1["scrollbar_slider_bar_vertical"] = const_1152;
         param1["scrollbar_slider_track_horizontal"] = const_1028;
         param1["scrollbar_slider_track_vertical"] = const_1200;
         param1["scrollable_itemlist"] = const_1617;
         param1["scrollable_itemlist_vertical"] = const_501;
         param1["scrollable_itemlist_horizontal"] = const_978;
         param1["selector"] = const_693;
         param1["selector_list"] = const_885;
         param1["submenu"] = const_1059;
         param1["tab_button"] = const_541;
         param1["tab_container_button"] = const_1030;
         param1["tab_context"] = const_335;
         param1["tab_content"] = const_1106;
         param1["tab_selector"] = const_668;
         param1["text"] = const_426;
         param1["input"] = const_690;
         param1["toolbar"] = const_1585;
         param1["tooltip"] = const_402;
         if(param2 != null)
         {
            for(param2[param1[_loc3_]] in param1)
            {
            }
         }
      }
   }
}
