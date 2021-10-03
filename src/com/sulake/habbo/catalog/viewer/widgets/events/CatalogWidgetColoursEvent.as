package com.sulake.habbo.catalog.viewer.widgets.events
{
   import flash.events.Event;
   
   public class CatalogWidgetColoursEvent extends Event
   {
       
      
      private var var_965:Array;
      
      private var var_2425:String;
      
      private var var_2424:String;
      
      private var var_2423:String;
      
      public function CatalogWidgetColoursEvent(param1:Array, param2:String, param3:String, param4:String, param5:Boolean = false, param6:Boolean = false)
      {
         super(WidgetEvent.CWE_COLOUR_ARRAY,param5,param6);
         this.var_965 = param1;
         this.var_2425 = param2;
         this.var_2424 = param3;
         this.var_2423 = param4;
      }
      
      public function get colours() : Array
      {
         return this.var_965;
      }
      
      public function get backgroundAssetName() : String
      {
         return this.var_2425;
      }
      
      public function get colourAssetName() : String
      {
         return this.var_2424;
      }
      
      public function get chosenColourAssetName() : String
      {
         return this.var_2423;
      }
   }
}
