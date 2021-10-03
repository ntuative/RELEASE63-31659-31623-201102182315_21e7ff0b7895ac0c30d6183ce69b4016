package com.sulake.habbo.roomevents.userdefinedroomevents.triggerconfs
{
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.habbo.communication.messages.incoming.userdefinedroomevents.Triggerable;
   import com.sulake.habbo.roomevents.HabboUserDefinedRoomEvents;
   
   public class AvatarEntersStuff implements TriggerConf
   {
       
      
      public function AvatarEntersStuff()
      {
         super();
      }
      
      public function get code() : int
      {
         return TriggerConfCodes.var_1954;
      }
      
      public function get requiresFurni() : Boolean
      {
         return true;
      }
      
      public function get hasStateSnapshot() : Boolean
      {
         return false;
      }
      
      public function readIntParamsFromForm(param1:IWindowContainer) : Array
      {
         return new Array();
      }
      
      public function readStringParamFromForm(param1:IWindowContainer) : String
      {
         return "";
      }
      
      public function onInit(param1:IWindowContainer, param2:HabboUserDefinedRoomEvents) : void
      {
      }
      
      public function onEditStart(param1:IWindowContainer, param2:Triggerable) : void
      {
      }
      
      public function get hasSpecialInputs() : Boolean
      {
         return false;
      }
   }
}
