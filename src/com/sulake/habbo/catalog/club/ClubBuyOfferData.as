package com.sulake.habbo.catalog.club
{
   import com.sulake.habbo.catalog.IPurchasableOffer;
   import com.sulake.habbo.catalog.purse.Purse;
   import com.sulake.habbo.catalog.viewer.ICatalogPage;
   import com.sulake.habbo.catalog.viewer.IProductContainer;
   import com.sulake.habbo.catalog.viewer.Offer;
   
   public class ClubBuyOfferData implements IPurchasableOffer
   {
       
      
      private var _offerId:int;
      
      private var var_1713:String;
      
      private var var_1650:int;
      
      private var var_2443:Boolean;
      
      private var var_2446:Boolean;
      
      private var var_2442:int;
      
      private var var_2441:int;
      
      private var var_410:ICatalogPage;
      
      private var var_2447:int;
      
      private var var_2445:int;
      
      private var var_2444:int;
      
      private var var_2530:Boolean = false;
      
      public function ClubBuyOfferData(param1:int, param2:String, param3:int, param4:Boolean, param5:Boolean, param6:int, param7:int, param8:int, param9:int, param10:int)
      {
         super();
         this._offerId = param1;
         this.var_1713 = param2;
         this.var_1650 = param3;
         this.var_2443 = param4;
         this.var_2446 = param5;
         this.var_2442 = param6;
         this.var_2441 = param7;
         this.var_2447 = param8;
         this.var_2445 = param9;
         this.var_2444 = param10;
      }
      
      public function dispose() : void
      {
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
      
      public function get priceInActivityPoints() : int
      {
         return 0;
      }
      
      public function get activityPointType() : int
      {
         return Purse.const_179;
      }
      
      public function get priceInCredits() : int
      {
         return this.var_1650;
      }
      
      public function get page() : ICatalogPage
      {
         return this.var_410;
      }
      
      public function get priceType() : String
      {
         return Offer.const_741;
      }
      
      public function get productContainer() : IProductContainer
      {
         return null;
      }
      
      public function get localizationId() : String
      {
         return this.var_1713;
      }
      
      public function set page(param1:ICatalogPage) : void
      {
         this.var_410 = param1;
      }
      
      public function get upgradeHcPeriodToVip() : Boolean
      {
         return this.var_2530;
      }
      
      public function set upgradeHcPeriodToVip(param1:Boolean) : void
      {
         this.var_2530 = param1;
      }
   }
}
