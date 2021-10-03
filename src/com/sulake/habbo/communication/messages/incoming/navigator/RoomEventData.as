package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class RoomEventData implements IDisposable
   {
       
      
      private var var_1065:Boolean;
      
      private var var_2500:int;
      
      private var var_2497:String;
      
      private var var_374:int;
      
      private var var_2499:int;
      
      private var var_2275:String;
      
      private var var_2496:String;
      
      private var var_2498:String;
      
      private var var_803:Array;
      
      private var _disposed:Boolean;
      
      public function RoomEventData(param1:IMessageDataWrapper)
      {
         var _loc5_:* = null;
         this.var_803 = new Array();
         super();
         var _loc2_:String = param1.readString();
         if(_loc2_ == "-1")
         {
            Logger.log("Got null room event");
            this.var_1065 = false;
            return;
         }
         this.var_1065 = true;
         this.var_2500 = int(_loc2_);
         this.var_2497 = param1.readString();
         this.var_374 = int(param1.readString());
         this.var_2499 = param1.readInteger();
         this.var_2275 = param1.readString();
         this.var_2496 = param1.readString();
         this.var_2498 = param1.readString();
         var _loc3_:int = param1.readInteger();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = param1.readString();
            this.var_803.push(_loc5_);
            _loc4_++;
         }
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
         this.var_803 = null;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get ownerAvatarId() : int
      {
         return this.var_2500;
      }
      
      public function get ownerAvatarName() : String
      {
         return this.var_2497;
      }
      
      public function get flatId() : int
      {
         return this.var_374;
      }
      
      public function get eventType() : int
      {
         return this.var_2499;
      }
      
      public function get eventName() : String
      {
         return this.var_2275;
      }
      
      public function get eventDescription() : String
      {
         return this.var_2496;
      }
      
      public function get creationTime() : String
      {
         return this.var_2498;
      }
      
      public function get tags() : Array
      {
         return this.var_803;
      }
      
      public function get exists() : Boolean
      {
         return this.var_1065;
      }
   }
}
