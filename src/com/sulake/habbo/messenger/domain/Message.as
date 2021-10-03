package com.sulake.habbo.messenger.domain
{
   public class Message
   {
      
      public static const const_694:int = 1;
      
      public static const const_853:int = 2;
      
      public static const const_788:int = 3;
      
      public static const const_1074:int = 4;
      
      public static const const_849:int = 5;
      
      public static const const_975:int = 6;
       
      
      private var _type:int;
      
      private var var_1194:int;
      
      private var var_2266:String;
      
      private var var_2267:String;
      
      public function Message(param1:int, param2:int, param3:String, param4:String)
      {
         super();
         this._type = param1;
         this.var_1194 = param2;
         this.var_2266 = param3;
         this.var_2267 = param4;
      }
      
      public function get messageText() : String
      {
         return this.var_2266;
      }
      
      public function get time() : String
      {
         return this.var_2267;
      }
      
      public function get senderId() : int
      {
         return this.var_1194;
      }
      
      public function get type() : int
      {
         return this._type;
      }
   }
}
