package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ClubOfferData
   {
       
      
      private var _offerId:int;
      
      private var var_1713:String;
      
      private var var_1650:int;
      
      private var var_2443:Boolean;
      
      private var var_2446:Boolean;
      
      private var var_2442:int;
      
      private var var_2441:int;
      
      private var var_2447:int;
      
      private var var_2445:int;
      
      private var var_2444:int;
      
      public function ClubOfferData(param1:IMessageDataWrapper)
      {
         super();
         this._offerId = param1.readInteger();
         this.var_1713 = param1.readString();
         this.var_1650 = param1.readInteger();
         this.var_2443 = param1.readBoolean();
         this.var_2446 = param1.readBoolean();
         this.var_2442 = param1.readInteger();
         this.var_2441 = param1.readInteger();
         this.var_2447 = param1.readInteger();
         this.var_2445 = param1.readInteger();
         this.var_2444 = param1.readInteger();
      }
      
      public function get offerId() : int
      {
         return this._offerId;
      }
      
      public function get productCode() : String
      {
         return this.var_1713;
      }
      
      public function get price() : int
      {
         return this.var_1650;
      }
      
      public function get upgrade() : Boolean
      {
         return this.var_2443;
      }
      
      public function get vip() : Boolean
      {
         return this.var_2446;
      }
      
      public function get periods() : int
      {
         return this.var_2442;
      }
      
      public function get daysLeftAfterPurchase() : int
      {
         return this.var_2441;
      }
      
      public function get year() : int
      {
         return this.var_2447;
      }
      
      public function get month() : int
      {
         return this.var_2445;
      }
      
      public function get day() : int
      {
         return this.var_2444;
      }
   }
}
