package com.sulake.habbo.room.object.visualization.data
{
   public class AnimationStateData
   {
       
      
      private var var_1917:int = -1;
      
      private var var_2712:int = 0;
      
      private var var_1915:Boolean = false;
      
      private var var_555:int = 0;
      
      private var _frames:Array;
      
      private var var_977:Array;
      
      private var var_978:Array;
      
      private var var_643:int = 0;
      
      public function AnimationStateData()
      {
         this._frames = [];
         this.var_977 = [];
         this.var_978 = [];
         super();
      }
      
      public function get animationOver() : Boolean
      {
         return this.var_1915;
      }
      
      public function set animationOver(param1:Boolean) : void
      {
         this.var_1915 = param1;
      }
      
      public function get frameCounter() : int
      {
         return this.var_555;
      }
      
      public function set frameCounter(param1:int) : void
      {
         this.var_555 = param1;
      }
      
      public function get animationId() : int
      {
         return this.var_1917;
      }
      
      public function set animationId(param1:int) : void
      {
         if(param1 != this.var_1917)
         {
            this.var_1917 = param1;
            this.resetAnimationFrames(false);
         }
      }
      
      public function get animationAfterTransitionId() : int
      {
         return this.var_2712;
      }
      
      public function set animationAfterTransitionId(param1:int) : void
      {
         this.var_2712 = param1;
      }
      
      public function dispose() : void
      {
         this._frames = null;
         this.var_977 = null;
         this.var_978 = null;
      }
      
      public function setLayerCount(param1:int) : void
      {
         this.var_643 = param1;
         this.resetAnimationFrames();
      }
      
      public function resetAnimationFrames(param1:Boolean = true) : void
      {
         var _loc3_:* = null;
         if(param1 || this._frames == null)
         {
            this._frames = [];
         }
         this.var_977 = [];
         this.var_978 = [];
         this.var_1915 = false;
         this.var_555 = 0;
         var _loc2_:int = 0;
         while(_loc2_ < this.var_643)
         {
            if(param1 || this._frames.length <= _loc2_)
            {
               this._frames[_loc2_] = null;
            }
            else
            {
               _loc3_ = this._frames[_loc2_];
               if(_loc3_ != null)
               {
                  this._frames[_loc2_] = new AnimationFrame(_loc3_.id,_loc3_.x,_loc3_.y,_loc3_.repeats,0,_loc3_.isLastFrame);
               }
            }
            this.var_977[_loc2_] = false;
            this.var_978[_loc2_] = false;
            _loc2_++;
         }
      }
      
      public function getFrame(param1:int) : AnimationFrame
      {
         if(param1 >= 0 && param1 < this.var_643)
         {
            return this._frames[param1];
         }
         return null;
      }
      
      public function setFrame(param1:int, param2:AnimationFrame) : void
      {
         if(param1 >= 0 && param1 < this.var_643)
         {
            this._frames[param1] = param2;
         }
      }
      
      public function getAnimationPlayed(param1:int) : Boolean
      {
         if(param1 >= 0 && param1 < this.var_643)
         {
            return this.var_978[param1];
         }
         return true;
      }
      
      public function setAnimationPlayed(param1:int, param2:Boolean) : void
      {
         if(param1 >= 0 && param1 < this.var_643)
         {
            this.var_978[param1] = param2;
         }
      }
      
      public function getLastFramePlayed(param1:int) : Boolean
      {
         if(param1 >= 0 && param1 < this.var_643)
         {
            return this.var_977[param1];
         }
         return true;
      }
      
      public function setLastFramePlayed(param1:int, param2:Boolean) : void
      {
         if(param1 >= 0 && param1 < this.var_643)
         {
            this.var_977[param1] = param2;
         }
      }
   }
}
