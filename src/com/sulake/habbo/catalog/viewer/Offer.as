package com.sulake.habbo.catalog.viewer
{
   import com.sulake.habbo.catalog.IPurchasableOffer;
   import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageMessageOfferData;
   import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageMessageProductData;
   import com.sulake.habbo.session.furniture.IFurnitureData;
   import com.sulake.habbo.session.product.IProductData;
   
   public class Offer implements IPurchasableOffer
   {
      
      public static const const_1618:String = "pricing_model_unknown";
      
      public static const const_451:String = "pricing_model_single";
      
      public static const const_455:String = "pricing_model_multi";
      
      public static const const_483:String = "pricing_model_bundle";
      
      public static const const_1551:String = "price_type_none";
      
      public static const const_741:String = "price_type_credits";
      
      public static const const_1088:String = "price_type_activitypoints";
      
      public static const const_1176:String = "price_type_credits_and_activitypoints";
       
      
      private var var_746:String;
      
      private var var_1161:String;
      
      private var _offerId:int;
      
      private var var_1814:String;
      
      private var var_1162:int;
      
      private var var_1163:int;
      
      private var var_1509:int;
      
      private var var_410:ICatalogPage;
      
      private var var_745:IProductContainer;
      
      private var var_2572:int;
      
      public function Offer(param1:CatalogPageMessageOfferData, param2:ICatalogPage)
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         super();
         this._offerId = param1.offerId;
         this.var_1814 = param1.localizationId;
         this.var_1162 = param1.priceInCredits;
         this.var_1163 = param1.priceInActivityPoints;
         this.var_1509 = param1.activityPointType;
         this.var_410 = param2;
         var _loc3_:Array = new Array();
         for each(_loc4_ in param1.products)
         {
            _loc5_ = param2.viewer.catalog.getProductData(param1.localizationId);
            _loc6_ = param2.viewer.catalog.getFurnitureData(_loc4_.furniClassId,_loc4_.productType);
            _loc7_ = new Product(_loc4_,_loc5_,_loc6_);
            _loc3_.push(_loc7_);
         }
         this.analyzePricingModel(_loc3_);
         this.analyzePriceType();
         this.createProductContainer(_loc3_);
      }
      
      public function get page() : ICatalogPage
      {
         return this.var_410;
      }
      
      public function get offerId() : int
      {
         return this._offerId;
      }
      
      public function get localizationId() : String
      {
         return this.var_1814;
      }
      
      public function get priceInCredits() : int
      {
         return this.var_1162;
      }
      
      public function get priceInActivityPoints() : int
      {
         return this.var_1163;
      }
      
      public function get activityPointType() : int
      {
         return this.var_1509;
      }
      
      public function get productContainer() : IProductContainer
      {
         return this.var_745;
      }
      
      public function get pricingModel() : String
      {
         return this.var_746;
      }
      
      public function get priceType() : String
      {
         return this.var_1161;
      }
      
      public function get previewCallbackId() : int
      {
         return this.var_2572;
      }
      
      public function set previewCallbackId(param1:int) : void
      {
         this.var_2572 = param1;
      }
      
      public function dispose() : void
      {
         this._offerId = 0;
         this.var_1814 = "";
         this.var_1162 = 0;
         this.var_1163 = 0;
         this.var_1509 = 0;
         this.var_410 = null;
         if(this.var_745 != null)
         {
            this.var_745.dispose();
            this.var_745 = null;
         }
      }
      
      private function createProductContainer(param1:Array) : void
      {
         switch(this.var_746)
         {
            case const_451:
               this.var_745 = new SingleProductContainer(this,param1);
               break;
            case const_455:
               this.var_745 = new MultiProductContainer(this,param1);
               break;
            case const_483:
               this.var_745 = new BundleProductContainer(this,param1);
               break;
            default:
               Logger.log("[Offer] Unknown pricing model" + this.var_746);
         }
      }
      
      private function analyzePricingModel(param1:Array) : void
      {
         var _loc2_:* = null;
         if(param1.length == 1)
         {
            _loc2_ = param1[0];
            if(_loc2_.productCount == 1)
            {
               this.var_746 = const_451;
            }
            else
            {
               this.var_746 = const_455;
            }
         }
         else if(param1.length > 1)
         {
            this.var_746 = const_483;
         }
         else
         {
            this.var_746 = const_1618;
         }
      }
      
      private function analyzePriceType() : void
      {
         if(this.var_1162 > 0 && this.var_1163 > 0)
         {
            this.var_1161 = const_1176;
         }
         else if(this.var_1162 > 0)
         {
            this.var_1161 = const_741;
         }
         else if(this.var_1163 > 0)
         {
            this.var_1161 = const_1088;
         }
         else
         {
            this.var_1161 = const_1551;
         }
      }
   }
}
