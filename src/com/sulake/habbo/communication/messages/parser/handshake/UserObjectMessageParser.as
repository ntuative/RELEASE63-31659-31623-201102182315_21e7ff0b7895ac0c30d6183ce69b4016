package com.sulake.habbo.communication.messages.parser.handshake
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class UserObjectMessageParser implements IMessageParser
   {
       
      
      private var _id:int;
      
      private var _name:String;
      
      private var var_581:String;
      
      private var var_908:String;
      
      private var var_2368:String;
      
      private var var_1503:String;
      
      private var var_2367:int;
      
      private var var_2366:String;
      
      private var var_2369:int;
      
      private var var_2370:int;
      
      private var var_2371:int;
      
      private var _respectLeft:int;
      
      private var var_724:int;
      
      public function UserObjectMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._id = int(param1.readString());
         this._name = param1.readString();
         this.var_581 = param1.readString();
         this.var_908 = param1.readString();
         this.var_2368 = param1.readString();
         this.var_1503 = param1.readString();
         this.var_2367 = param1.readInteger();
         this.var_2366 = param1.readString();
         this.var_2369 = param1.readInteger();
         this.var_2370 = param1.readInteger();
         this.var_2371 = param1.readInteger();
         this._respectLeft = param1.readInteger();
         this.var_724 = param1.readInteger();
         return true;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get figure() : String
      {
         return this.var_581;
      }
      
      public function get sex() : String
      {
         return this.var_908;
      }
      
      public function get customData() : String
      {
         return this.var_2368;
      }
      
      public function get realName() : String
      {
         return this.var_1503;
      }
      
      public function get method_12() : int
      {
         return this.var_2367;
      }
      
      public function get poolFigure() : String
      {
         return this.var_2366;
      }
      
      public function get photoFilm() : int
      {
         return this.var_2369;
      }
      
      public function get directMail() : int
      {
         return this.var_2370;
      }
      
      public function get respectTotal() : int
      {
         return this.var_2371;
      }
      
      public function get respectLeft() : int
      {
         return this._respectLeft;
      }
      
      public function get petRespectLeft() : int
      {
         return this.var_724;
      }
   }
}
