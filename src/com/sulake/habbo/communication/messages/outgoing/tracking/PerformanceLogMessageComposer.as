package com.sulake.habbo.communication.messages.outgoing.tracking
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class PerformanceLogMessageComposer implements IMessageComposer
   {
       
      
      private var var_2068:int = 0;
      
      private var var_1445:String = "";
      
      private var var_1881:String = "";
      
      private var var_2376:String = "";
      
      private var var_2375:String = "";
      
      private var var_1677:int = 0;
      
      private var var_2373:int = 0;
      
      private var var_2377:int = 0;
      
      private var var_1448:int = 0;
      
      private var var_2374:int = 0;
      
      private var var_1447:int = 0;
      
      public function PerformanceLogMessageComposer(param1:int, param2:String, param3:String, param4:String, param5:String, param6:Boolean, param7:int, param8:int, param9:int, param10:int, param11:int)
      {
         super();
         this.var_2068 = param1;
         this.var_1445 = param2;
         this.var_1881 = param3;
         this.var_2376 = param4;
         this.var_2375 = param5;
         if(param6)
         {
            this.var_1677 = 1;
         }
         else
         {
            this.var_1677 = 0;
         }
         this.var_2373 = param7;
         this.var_2377 = param8;
         this.var_1448 = param9;
         this.var_2374 = param10;
         this.var_1447 = param11;
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_2068,this.var_1445,this.var_1881,this.var_2376,this.var_2375,this.var_1677,this.var_2373,this.var_2377,this.var_1448,this.var_2374,this.var_1447];
      }
   }
}
