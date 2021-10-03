package com.sulake.habbo.communication.messages.parser.users
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class ScrSendUserInfoMessageParser implements IMessageParser
   {
      
      public static const const_1725:int = 1;
      
      public static const const_1506:int = 2;
       
      
      private var var_972:String;
      
      private var var_2032:int;
      
      private var var_2034:int;
      
      private var var_2037:int;
      
      private var var_2040:int;
      
      private var var_2033:Boolean;
      
      private var var_2039:Boolean;
      
      private var var_2036:int;
      
      private var var_2038:int;
      
      private var var_2035:Boolean;
      
      private var var_2030:int;
      
      private var var_2031:int;
      
      public function ScrSendUserInfoMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_972 = param1.readString();
         this.var_2032 = param1.readInteger();
         this.var_2034 = param1.readInteger();
         this.var_2037 = param1.readInteger();
         this.var_2040 = param1.readInteger();
         this.var_2033 = param1.readBoolean();
         this.var_2039 = param1.readBoolean();
         this.var_2036 = param1.readInteger();
         this.var_2038 = param1.readInteger();
         this.var_2035 = param1.readBoolean();
         this.var_2030 = param1.readInteger();
         this.var_2031 = param1.readInteger();
         return true;
      }
      
      public function get productName() : String
      {
         return this.var_972;
      }
      
      public function get daysToPeriodEnd() : int
      {
         return this.var_2032;
      }
      
      public function get memberPeriods() : int
      {
         return this.var_2034;
      }
      
      public function get periodsSubscribedAhead() : int
      {
         return this.var_2037;
      }
      
      public function get responseType() : int
      {
         return this.var_2040;
      }
      
      public function get hasEverBeenMember() : Boolean
      {
         return this.var_2033;
      }
      
      public function get isVIP() : Boolean
      {
         return this.var_2039;
      }
      
      public function get pastClubDays() : int
      {
         return this.var_2036;
      }
      
      public function get pastVipDays() : int
      {
         return this.var_2038;
      }
      
      public function get isShowBasicPromo() : Boolean
      {
         return this.var_2035;
      }
      
      public function get basicNormalPrice() : int
      {
         return this.var_2030;
      }
      
      public function get basicPromoPrice() : int
      {
         return this.var_2031;
      }
   }
}
