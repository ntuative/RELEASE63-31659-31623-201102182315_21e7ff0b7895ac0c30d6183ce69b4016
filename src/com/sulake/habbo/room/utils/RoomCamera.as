package com.sulake.habbo.room.utils
{
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class RoomCamera
   {
      
      private static const const_950:int = 3;
       
      
      private var var_2645:int = -1;
      
      private var var_2641:int = -2;
      
      private var var_362:Vector3d = null;
      
      private var var_417:Vector3d = null;
      
      private var var_2638:Boolean = false;
      
      private var var_2643:Boolean = false;
      
      private var var_2647:Boolean = false;
      
      private var var_2642:Boolean = false;
      
      private var var_2640:int = 0;
      
      private var var_2646:int = 0;
      
      private var var_2644:int = 0;
      
      private var var_2639:int = 0;
      
      private var var_1429:int = 0;
      
      public function RoomCamera()
      {
         super();
      }
      
      public function get location() : IVector3d
      {
         return this.var_417;
      }
      
      public function get targetId() : int
      {
         return this.var_2645;
      }
      
      public function get targetCategory() : int
      {
         return this.var_2641;
      }
      
      public function get limitedLocationX() : Boolean
      {
         return this.var_2638;
      }
      
      public function get limitedLocationY() : Boolean
      {
         return this.var_2643;
      }
      
      public function get centeredLocX() : Boolean
      {
         return this.var_2647;
      }
      
      public function get centeredLocY() : Boolean
      {
         return this.var_2642;
      }
      
      public function get screenWd() : int
      {
         return this.var_2640;
      }
      
      public function get screenHt() : int
      {
         return this.var_2646;
      }
      
      public function get roomWd() : int
      {
         return this.var_2644;
      }
      
      public function get roomHt() : int
      {
         return this.var_2639;
      }
      
      public function set targetId(param1:int) : void
      {
         this.var_2645 = param1;
      }
      
      public function set targetCategory(param1:int) : void
      {
         this.var_2641 = param1;
      }
      
      public function set limitedLocationX(param1:Boolean) : void
      {
         this.var_2638 = param1;
      }
      
      public function set limitedLocationY(param1:Boolean) : void
      {
         this.var_2643 = param1;
      }
      
      public function set centeredLocX(param1:Boolean) : void
      {
         this.var_2647 = param1;
      }
      
      public function set centeredLocY(param1:Boolean) : void
      {
         this.var_2642 = param1;
      }
      
      public function set screenWd(param1:int) : void
      {
         this.var_2640 = param1;
      }
      
      public function set screenHt(param1:int) : void
      {
         this.var_2646 = param1;
      }
      
      public function set roomWd(param1:int) : void
      {
         this.var_2644 = param1;
      }
      
      public function set roomHt(param1:int) : void
      {
         this.var_2639 = param1;
      }
      
      public function set target(param1:IVector3d) : void
      {
         if(this.var_362 == null)
         {
            this.var_362 = new Vector3d();
         }
         if(this.var_362.x != param1.x || this.var_362.y != param1.y || this.var_362.z != param1.z)
         {
            this.var_362.assign(param1);
            this.var_1429 = 0;
         }
      }
      
      public function dispose() : void
      {
         this.var_362 = null;
         this.var_417 = null;
      }
      
      public function initializeLocation(param1:IVector3d) : void
      {
         if(this.var_417 != null)
         {
            return;
         }
         this.var_417 = new Vector3d();
         this.var_417.assign(param1);
      }
      
      public function update(param1:uint, param2:Number, param3:Number) : void
      {
         var _loc4_:* = null;
         if(this.var_362 != null && this.var_417 != null)
         {
            ++this.var_1429;
            _loc4_ = Vector3d.dif(this.var_362,this.var_417);
            if(_loc4_.length <= param2)
            {
               this.var_417 = this.var_362;
               this.var_362 = null;
            }
            else
            {
               _loc4_.div(_loc4_.length);
               if(_loc4_.length < param2 * (const_950 + 1))
               {
                  _loc4_.mul(param2);
               }
               else if(this.var_1429 <= const_950)
               {
                  _loc4_.mul(param2);
               }
               else
               {
                  _loc4_.mul(param3);
               }
               this.var_417 = Vector3d.sum(this.var_417,_loc4_);
            }
         }
      }
   }
}
