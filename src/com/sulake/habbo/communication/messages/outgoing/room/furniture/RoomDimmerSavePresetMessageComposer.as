package com.sulake.habbo.communication.messages.outgoing.room.furniture
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class RoomDimmerSavePresetMessageComposer implements IMessageComposer
   {
       
      
      private var _roomId:int = 0;
      
      private var _roomCategory:int = 0;
      
      private var var_2222:int;
      
      private var var_2221:int;
      
      private var var_2421:String;
      
      private var var_2420:int;
      
      private var var_2422:Boolean;
      
      public function RoomDimmerSavePresetMessageComposer(param1:int, param2:int, param3:String, param4:int, param5:Boolean, param6:int = 0, param7:int = 0)
      {
         super();
         this._roomId = param6;
         this._roomCategory = param7;
         this.var_2222 = param1;
         this.var_2221 = param2;
         this.var_2421 = param3;
         this.var_2420 = param4;
         this.var_2422 = param5;
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_2222,this.var_2221,this.var_2421,this.var_2420,int(this.var_2422)];
      }
      
      public function dispose() : void
      {
      }
   }
}
