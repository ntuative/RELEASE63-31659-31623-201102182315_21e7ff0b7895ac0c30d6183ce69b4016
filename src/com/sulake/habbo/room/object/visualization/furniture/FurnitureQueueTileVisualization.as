package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureQueueTileVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const ANIMATION_ID_ROLL:int = 3;
      
      private static const const_1332:int = 2;
      
      private static const const_1331:int = 1;
      
      private static const ANIMATION_DURATION:int = 15;
       
      
      private var var_279:Array;
      
      private var var_1165:int;
      
      public function FurnitureQueueTileVisualization()
      {
         this.var_279 = new Array();
         super();
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == const_1332)
         {
            this.var_279 = new Array();
            this.var_279.push(const_1331);
            this.var_1165 = ANIMATION_DURATION;
         }
         super.setAnimation(param1);
      }
      
      override protected function updateAnimation(param1:Number) : Array
      {
         if(this.var_1165 > 0)
         {
            --this.var_1165;
         }
         if(this.var_1165 == 0)
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
