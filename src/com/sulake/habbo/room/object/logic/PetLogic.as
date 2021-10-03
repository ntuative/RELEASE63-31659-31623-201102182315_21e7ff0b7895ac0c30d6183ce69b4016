package com.sulake.habbo.room.object.logic
{
   import com.sulake.habbo.room.events.RoomObjectMoveEvent;
   import com.sulake.habbo.room.messages.RoomObjectAvatarChatUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarExperienceUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarFigureUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarPetGestureUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarPostureUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarSelectedMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarSleepUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarUpdateMessage;
   import com.sulake.habbo.room.object.RoomObjectVariableEnum;
   import com.sulake.room.events.RoomObjectEvent;
   import com.sulake.room.events.RoomObjectMouseEvent;
   import com.sulake.room.events.RoomSpriteMouseEvent;
   import com.sulake.room.messages.RoomObjectUpdateMessage;
   import com.sulake.room.object.IRoomObjectModelController;
   import com.sulake.room.utils.IRoomGeometry;
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   import flash.events.MouseEvent;
   import flash.utils.getTimer;
   
   public class PetLogic extends MovingObjectLogic
   {
       
      
      private var var_1273:int = 0;
      
      private var var_1274:int = 0;
      
      private var var_1164:int = 0;
      
      private var var_200:Boolean = false;
      
      private var var_462:Vector3d = null;
      
      public function PetLogic()
      {
         super();
      }
      
      override public function dispose() : void
      {
         var _loc1_:* = null;
         if(this.var_200 && object != null)
         {
            if(eventDispatcher != null)
            {
               _loc1_ = new RoomObjectMoveEvent(RoomObjectMoveEvent.const_469,object.getId(),object.getType());
               eventDispatcher.dispatchEvent(_loc1_);
            }
         }
         super.dispose();
         this.var_462 = null;
      }
      
      override public function processUpdateMessage(param1:RoomObjectUpdateMessage) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         if(param1 == null || object == null)
         {
            return;
         }
         super.processUpdateMessage(param1);
         var _loc2_:IRoomObjectModelController = object.getModelController();
         if(param1 is RoomObjectAvatarPostureUpdateMessage)
         {
            _loc3_ = param1 as RoomObjectAvatarPostureUpdateMessage;
            _loc2_.setString(RoomObjectVariableEnum.const_341,_loc3_.postureType);
            return;
         }
         if(param1 is RoomObjectAvatarUpdateMessage)
         {
            _loc4_ = param1 as RoomObjectAvatarUpdateMessage;
            _loc2_.setNumber(RoomObjectVariableEnum.const_299,_loc4_.dirHead);
            return;
         }
         if(param1 is RoomObjectAvatarChatUpdateMessage)
         {
            _loc5_ = param1 as RoomObjectAvatarChatUpdateMessage;
            _loc2_.setNumber(RoomObjectVariableEnum.const_250,1);
            this.var_1273 = getTimer() + _loc5_.numberOfWords * 1000;
            return;
         }
         if(param1 is RoomObjectAvatarPetGestureUpdateMessage)
         {
            _loc6_ = param1 as RoomObjectAvatarPetGestureUpdateMessage;
            _loc2_.setString(RoomObjectVariableEnum.const_225,_loc6_.gesture);
            this.var_1274 = getTimer() + 3000;
            return;
         }
         if(param1 is RoomObjectAvatarSleepUpdateMessage)
         {
            _loc7_ = param1 as RoomObjectAvatarSleepUpdateMessage;
            _loc2_.setNumber(RoomObjectVariableEnum.const_367,Number(_loc7_.isSleeping));
            return;
         }
         if(param1 is RoomObjectAvatarSelectedMessage)
         {
            _loc8_ = param1 as RoomObjectAvatarSelectedMessage;
            this.var_200 = _loc8_.selected;
            this.var_462 = null;
            return;
         }
         if(param1 is RoomObjectAvatarExperienceUpdateMessage)
         {
            _loc9_ = param1 as RoomObjectAvatarExperienceUpdateMessage;
            _loc2_.setNumber(RoomObjectVariableEnum.const_850,Number(getTimer()));
            _loc2_.setNumber(RoomObjectVariableEnum.const_792,Number(_loc9_.gainedExperience));
            return;
         }
         if(param1 is RoomObjectAvatarFigureUpdateMessage)
         {
            _loc10_ = param1 as RoomObjectAvatarFigureUpdateMessage;
            _loc11_ = _loc2_.getString(RoomObjectVariableEnum.const_173);
            _loc2_.setString(RoomObjectVariableEnum.const_173,_loc10_.figure);
            _loc2_.setString(RoomObjectVariableEnum.const_1480,_loc10_.race);
            _loc2_.setNumber(RoomObjectVariableEnum.PET_PALETTE_INDEX,this.getPaletteIndex(_loc10_.figure));
            return;
         }
      }
      
      override public function mouseEvent(param1:RoomSpriteMouseEvent, param2:IRoomGeometry) : void
      {
         var _loc6_:int = 0;
         var _loc7_:* = null;
         var _loc8_:* = null;
         if(object == null || param1 == null)
         {
            return;
         }
         switch(param1.type)
         {
            case MouseEvent.CLICK:
               _loc6_ = object.getId();
               _loc7_ = object.getType();
               if(eventDispatcher != null)
               {
                  _loc8_ = new RoomObjectMouseEvent(RoomObjectMouseEvent.const_242,param1.eventId,_loc6_,_loc7_,param1.altKey,param1.ctrlKey,param1.shiftKey,param1.buttonDown);
                  eventDispatcher.dispatchEvent(_loc8_);
               }
         }
      }
      
      override public function update(param1:int) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         super.update(param1);
         if(this.var_200 && object != null)
         {
            if(eventDispatcher != null)
            {
               _loc2_ = object.getLocation();
               if(this.var_462 == null || this.var_462.x != _loc2_.x || this.var_462.y != _loc2_.y || this.var_462.z != _loc2_.z)
               {
                  if(this.var_462 == null)
                  {
                     this.var_462 = new Vector3d();
                  }
                  this.var_462.assign(_loc2_);
                  _loc3_ = new RoomObjectMoveEvent(RoomObjectMoveEvent.const_564,object.getId(),object.getType());
                  eventDispatcher.dispatchEvent(_loc3_);
               }
            }
         }
         if(object != null && object.getModelController() != null)
         {
            this.updateActions(param1,object.getModelController());
         }
      }
      
      private function updateActions(param1:int, param2:IRoomObjectModelController) : void
      {
         if(this.var_1274 > 0 && param1 > this.var_1274)
         {
            param2.setString(RoomObjectVariableEnum.const_225,null);
            this.var_1274 = 0;
         }
         if(this.var_1273 > 0)
         {
            if(param1 > this.var_1273)
            {
               param2.setNumber(RoomObjectVariableEnum.const_250,0);
               this.var_1273 = 0;
            }
         }
         if(this.var_1164 > 0 && param1 > this.var_1164)
         {
            param2.setNumber(RoomObjectVariableEnum.const_400,0);
            this.var_1164 = 0;
         }
      }
      
      private function getPaletteIndex(param1:String) : int
      {
         var _loc2_:* = null;
         if(param1 != null)
         {
            _loc2_ = param1.split(" ");
            if(_loc2_.length >= 2)
            {
               return parseInt(_loc2_[1]);
            }
         }
         return 0;
      }
   }
}
