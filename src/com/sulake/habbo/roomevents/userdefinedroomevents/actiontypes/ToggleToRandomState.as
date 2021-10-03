package com.sulake.habbo.roomevents.userdefinedroomevents.actiontypes
{
   public class ToggleToRandomState extends DefaultActionType
   {
       
      
      public function ToggleToRandomState()
      {
         super();
      }
      
      override public function get code() : int
      {
         return ActionTypeCodes.var_1962;
      }
      
      override public function get requiresFurni() : Boolean
      {
         return true;
      }
   }
}
