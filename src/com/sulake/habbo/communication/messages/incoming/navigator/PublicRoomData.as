package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class PublicRoomData implements IDisposable
   {
       
      
      private var var_2336:String;
      
      private var var_2020:int;
      
      private var var_2029:int;
      
      private var var_2462:String;
      
      private var var_2501:int;
      
      private var var_1613:int;
      
      private var _disposed:Boolean;
      
      public function PublicRoomData(param1:IMessageDataWrapper)
      {
         super();
         this.var_2336 = param1.readString();
         this.var_2020 = param1.readInteger();
         this.var_2029 = param1.readInteger();
         this.var_2462 = param1.readString();
         this.var_2501 = param1.readInteger();
         this.var_1613 = param1.readInteger();
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get unitPropertySet() : String
      {
         return this.var_2336;
      }
      
      public function get unitPort() : int
      {
         return this.var_2020;
      }
      
      public function get worldId() : int
      {
         return this.var_2029;
      }
      
      public function get castLibs() : String
      {
         return this.var_2462;
      }
      
      public function get maxUsers() : int
      {
         return this.var_2501;
      }
      
      public function get nodeId() : int
      {
         return this.var_1613;
      }
   }
}
