package com.sulake.habbo.communication.messages.incoming.marketplace
{
   public class MarketPlaceOffer
   {
       
      
      private var _offerId:int;
      
      private var _furniId:int;
      
      private var var_2122:int;
      
      private var var_1980:String;
      
      private var var_1650:int;
      
      private var var_378:int;
      
      private var var_2121:int = -1;
      
      private var var_2120:int;
      
      private var var_1651:int;
      
      public function MarketPlaceOffer(param1:int, param2:int, param3:int, param4:String, param5:int, param6:int, param7:int, param8:int, param9:int = -1)
      {
         super();
         this._offerId = param1;
         this._furniId = param2;
         this.var_2122 = param3;
         this.var_1980 = param4;
         this.var_1650 = param5;
         this.var_378 = param6;
         this.var_2121 = param7;
         this.var_2120 = param8;
         this.var_1651 = param9;
      }
      
      public function get offerId() : int
      {
         return this._offerId;
      }
      
      public function get furniId() : int
      {
         return this._furniId;
      }
      
      public function get furniType() : int
      {
         return this.var_2122;
      }
      
      public function get stuffData() : String
      {
         return this.var_1980;
      }
      
      public function get price() : int
      {
         return this.var_1650;
      }
      
      public function get status() : int
      {
         return this.var_378;
      }
      
      public function get timeLeftMinutes() : int
      {
         return this.var_2121;
      }
      
      public function get averagePrice() : int
      {
         return this.var_2120;
      }
      
      public function get offerCount() : int
      {
         return this.var_1651;
      }
   }
}
