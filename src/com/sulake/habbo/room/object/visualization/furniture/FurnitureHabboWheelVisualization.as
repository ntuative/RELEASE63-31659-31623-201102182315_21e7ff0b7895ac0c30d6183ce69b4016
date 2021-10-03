package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureHabboWheelVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_914:int = 10;
      
      private static const const_589:int = 20;
      
      private static const const_1241:int = 31;
      
      private static const ANIMATION_ID_ROLL:int = 32;
       
      
      private var var_279:Array;
      
      private var var_774:Boolean = false;
      
      public function FurnitureHabboWheelVisualization()
      {
         this.var_279 = new Array();
         super();
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == -1)
         {
            if(!this.var_774)
            {
               this.var_774 = true;
               this.var_279 = new Array();
               this.var_279.push(const_1241);
               this.var_279.push(ANIMATION_ID_ROLL);
               return;
            }
         }
         if(param1 > 0 && param1 <= const_914)
         {
            if(this.var_774)
            {
               this.var_774 = false;
               this.var_279 = new Array();
               this.var_279.push(const_914 + param1);
               this.var_279.push(const_589 + param1);
               this.var_279.push(param1);
               return;
            }
            super.setAnimation(param1);
         }
      }
      
      override protected function updateAnimation(param1:Number) : Array
      {
         if(super.getLastFramePlayed(1) && super.getLastFramePlayed(2) && super.getLastFramePlayed(3))
         {
            if(this.var_279.length > 0)
            {
               super.setAnimation(this.var_279.shift());
            }
         }
         return super.updateAnimation(param1);
      }
   }
}
