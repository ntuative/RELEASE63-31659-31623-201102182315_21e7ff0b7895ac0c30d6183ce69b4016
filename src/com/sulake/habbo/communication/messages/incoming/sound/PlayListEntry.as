package com.sulake.habbo.communication.messages.incoming.sound
{
   public class PlayListEntry
   {
       
      
      private var var_2534:int;
      
      private var var_2535:int;
      
      private var var_2532:String;
      
      private var var_2536:String;
      
      private var var_2533:int = 0;
      
      public function PlayListEntry(param1:int, param2:int, param3:String, param4:String)
      {
         super();
         this.var_2534 = param1;
         this.var_2535 = param2;
         this.var_2532 = param3;
         this.var_2536 = param4;
      }
      
      public function get id() : int
      {
         return this.var_2534;
      }
      
      public function get length() : int
      {
         return this.var_2535;
      }
      
      public function get name() : String
      {
         return this.var_2532;
      }
      
      public function get creator() : String
      {
         return this.var_2536;
      }
      
      public function get startPlayHeadPos() : int
      {
         return this.var_2533;
      }
      
      public function set startPlayHeadPos(param1:int) : void
      {
         this.var_2533 = param1;
      }
   }
}
