package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowParam;
   import flash.utils.Dictionary;
   
   public class ParamCodeTable extends WindowParam
   {
       
      
      public function ParamCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["null"] = const_193;
         param1["bound_to_parent_rect"] = const_93;
         param1["child_window"] = const_1037;
         param1["embedded_controller"] = const_983;
         param1["resize_to_accommodate_children"] = const_69;
         param1["input_event_processor"] = const_30;
         param1["internal_event_handling"] = const_689;
         param1["mouse_dragging_target"] = const_261;
         param1["mouse_dragging_trigger"] = const_390;
         param1["mouse_scaling_target"] = const_304;
         param1["mouse_scaling_trigger"] = const_475;
         param1["horizontal_mouse_scaling_trigger"] = const_263;
         param1["vertical_mouse_scaling_trigger"] = const_215;
         param1["observe_parent_input_events"] = const_1203;
         param1["optimize_region_to_layout_size"] = const_474;
         param1["parent_window"] = const_1053;
         param1["relative_horizontal_scale_center"] = const_191;
         param1["relative_horizontal_scale_fixed"] = const_140;
         param1["relative_horizontal_scale_move"] = const_382;
         param1["relative_horizontal_scale_strech"] = const_337;
         param1["relative_scale_center"] = const_1075;
         param1["relative_scale_fixed"] = const_621;
         param1["relative_scale_move"] = const_990;
         param1["relative_scale_strech"] = const_1205;
         param1["relative_vertical_scale_center"] = const_181;
         param1["relative_vertical_scale_fixed"] = const_153;
         param1["relative_vertical_scale_move"] = const_401;
         param1["relative_vertical_scale_strech"] = const_397;
         param1["on_resize_align_left"] = const_809;
         param1["on_resize_align_right"] = const_531;
         param1["on_resize_align_center"] = const_493;
         param1["on_resize_align_top"] = const_806;
         param1["on_resize_align_bottom"] = const_551;
         param1["on_resize_align_middle"] = const_534;
         param1["on_accommodate_align_left"] = const_1168;
         param1["on_accommodate_align_right"] = const_497;
         param1["on_accommodate_align_center"] = const_724;
         param1["on_accommodate_align_top"] = const_967;
         param1["on_accommodate_align_bottom"] = WINDOW_PARAM_ON_ACCOMMODATE_ALIGN_BOTTOM;
         param1["on_accommodate_align_middle"] = const_700;
         param1["route_input_events_to_parent"] = const_505;
         param1["use_parent_graphic_context"] = const_32;
         param1["draggable_with_mouse"] = const_1170;
         param1["scalable_with_mouse"] = const_1097;
         param1["reflect_horizontal_resize_to_parent"] = const_440;
         param1["reflect_vertical_resize_to_parent"] = const_530;
         param1["reflect_resize_to_parent"] = const_282;
         param1["force_clipping"] = WINDOW_PARAM_FORCE_CLIPPING;
         param1["inherit_caption"] = const_1050;
         if(param2 != null)
         {
            for(param2[param1[_loc3_]] in param1)
            {
            }
         }
      }
   }
}
