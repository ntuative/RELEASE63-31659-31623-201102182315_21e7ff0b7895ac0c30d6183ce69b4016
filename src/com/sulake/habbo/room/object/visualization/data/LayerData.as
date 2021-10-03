package com.sulake.habbo.room.object.visualization.data
{
   public class LayerData
   {
      
      public static const const_647:String = "";
      
      public static const const_430:int = 0;
      
      public static const const_449:int = 255;
      
      public static const const_839:Boolean = false;
      
      public static const const_575:int = 0;
      
      public static const const_502:int = 0;
      
      public static const const_563:int = 0;
      
      public static const const_1189:int = 1;
      
      public static const const_982:int = 2;
      
      public static const INK_DARKEN:int = 3;
       
      
      private var var_2005:String = "";
      
      private var var_1515:int = 0;
      
      private var var_2002:int = 255;
      
      private var var_2000:Boolean = false;
      
      private var var_2003:int = 0;
      
      private var var_2004:int = 0;
      
      private var var_2001:Number = 0;
      
      public function LayerData()
      {
         super();
      }
      
      public function set tag(param1:String) : void
      {
         this.var_2005 = param1;
      }
      
      public function get tag() : String
      {
         return this.var_2005;
      }
      
      public function set ink(param1:int) : void
      {
         this.var_1515 = param1;
      }
      
      public function get ink() : int
      {
         return this.var_1515;
      }
      
      public function set alpha(param1:int) : void
      {
         this.var_2002 = param1;
      }
      
      public function get alpha() : int
      {
         return this.var_2002;
      }
      
      public function set ignoreMouse(param1:Boolean) : void
      {
         this.var_2000 = param1;
      }
      
      public function get ignoreMouse() : Boolean
      {
         return this.var_2000;
      }
      
      public function set xOffset(param1:int) : void
      {
         this.var_2003 = param1;
      }
      
      public function get xOffset() : int
      {
         return this.var_2003;
      }
      
      public function set yOffset(param1:int) : void
      {
         this.var_2004 = param1;
      }
      
      public function get yOffset() : int
      {
         return this.var_2004;
      }
      
      public function set zOffset(param1:Number) : void
      {
         this.var_2001 = param1;
      }
      
      public function get zOffset() : Number
      {
         return this.var_2001;
      }
      
      public function copyValues(param1:LayerData) : void
      {
         if(param1 != null)
         {
            this.tag = param1.tag;
            this.ink = param1.ink;
            this.alpha = param1.alpha;
            this.ignoreMouse = param1.ignoreMouse;
            this.xOffset = param1.xOffset;
            this.yOffset = param1.yOffset;
            this.zOffset = param1.zOffset;
         }
      }
   }
}
