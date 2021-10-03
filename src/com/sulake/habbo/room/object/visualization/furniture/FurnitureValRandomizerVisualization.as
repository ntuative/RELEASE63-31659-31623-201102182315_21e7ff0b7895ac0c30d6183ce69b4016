package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureValRandomizerVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_914:int = 20;
      
      private static const const_589:int = 10;
      
      private static const const_1241:int = 31;
      
      private static const ANIMATION_ID_ROLL:int = 32;
      
      private static const ANIMATION_ID_OFF:int = 30;
       
      
      private var var_279:Array;
      
      private var var_774:Boolean = false;
      
      public function FurnitureValRandomizerVisualization()
      {
         this.var_279 = new Array();
         super();
         super.setAnimation(ANIMATION_ID_OFF);
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == 0)
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
         if(param1 > 0 && param1 <= const_589)
         {
            if(this.var_774)
            {
               this.var_774 = false;
               this.var_279 = new Array();
               if(_direction == 2)
               {
                  this.var_279.push(const_914 + 5 - param1);
                  this.var_279.push(const_589 + 5 - param1);
               }
               else
               {
                  this.var_279.push(const_914 + param1);
                  this.var_279.push(const_589 + param1);
               }
               this.var_279.push(ANIMATION_ID_OFF);
               return;
            }
            super.setAnimation(ANIMATION_ID_OFF);
         }
      }
      
      override protected function updateAnimation(param1:Number) : Array
      {
         if(super.getLastFramePlayed(11))
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
