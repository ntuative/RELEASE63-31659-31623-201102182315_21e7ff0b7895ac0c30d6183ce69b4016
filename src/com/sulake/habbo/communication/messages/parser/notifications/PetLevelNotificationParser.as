package com.sulake.habbo.communication.messages.parser.notifications
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetLevelNotificationParser implements IMessageParser
   {
       
      
      private var var_1599:int;
      
      private var var_2299:String;
      
      private var var_1363:int;
      
      private var var_1096:int;
      
      private var var_1545:int;
      
      private var _color:String;
      
      public function PetLevelNotificationParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1599 = param1.readInteger();
         this.var_2299 = param1.readString();
         this.var_1363 = param1.readInteger();
         this.var_1096 = param1.readInteger();
         this.var_1545 = param1.readInteger();
         this._color = param1.readString();
         return true;
      }
      
      public function get petId() : int
      {
         return this.var_1599;
      }
      
      public function get petName() : String
      {
         return this.var_2299;
      }
      
      public function get level() : int
      {
         return this.var_1363;
      }
      
      public function get petType() : int
      {
         return this.var_1096;
      }
      
      public function get breed() : int
      {
         return this.var_1545;
      }
      
      public function get color() : String
      {
         return this._color;
      }
   }
}
