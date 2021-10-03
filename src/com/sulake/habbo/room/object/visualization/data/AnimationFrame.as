package com.sulake.habbo.room.object.visualization.data
{
   public class AnimationFrame
   {
      
      public static const const_516:int = -1;
      
      public static const const_1011:int = -1;
       
      
      private var _id:int = 0;
      
      private var _x:int = 0;
      
      private var var_155:int = 0;
      
      private var var_2401:int = 1;
      
      private var var_891:int = 1;
      
      private var var_1694:int = 1;
      
      private var var_2406:int = -1;
      
      private var var_2407:int = 0;
      
      private var var_2405:Boolean = false;
      
      public function AnimationFrame(param1:int, param2:int, param3:int, param4:int, param5:int, param6:Boolean, param7:int = -1, param8:int = 0)
      {
         super();
         this._id = param1;
         this._x = param2;
         this.var_155 = param3;
         this.var_2405 = param6;
         if(param4 < 1)
         {
            param4 = 1;
         }
         this.var_2401 = param4;
         if(param5 < 0)
         {
            param5 = const_516;
         }
         this.var_891 = param5;
         this.var_1694 = param5;
         if(param7 >= 0)
         {
            this.var_2406 = param7;
            this.var_2407 = param8;
         }
      }
      
      public function get id() : int
      {
         if(this._id >= 0)
         {
            return this._id;
         }
         return -this._id * Math.random();
      }
      
      public function get x() : int
      {
         return this._x;
      }
      
      public function get y() : int
      {
         return this.var_155;
      }
      
      public function get repeats() : int
      {
         return this.var_2401;
      }
      
      public function get frameRepeats() : int
      {
         return this.var_891;
      }
      
      public function get isLastFrame() : Boolean
      {
         return this.var_2405;
      }
      
      public function get remainingFrameRepeats() : int
      {
         if(this.var_891 < 0)
         {
            return const_516;
         }
         return this.var_1694;
      }
      
      public function set remainingFrameRepeats(param1:int) : void
      {
         if(param1 < 0)
         {
            param1 = 0;
         }
         if(this.var_891 > 0 && param1 > this.var_891)
         {
            param1 = this.var_891;
         }
         this.var_1694 = param1;
      }
      
      public function get activeSequence() : int
      {
         return this.var_2406;
      }
      
      public function get activeSequenceOffset() : int
      {
         return this.var_2407;
      }
   }
}
