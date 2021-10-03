package com.sulake.habbo.avatar
{
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.avatar.alias.AssetAliasCollection;
   import com.sulake.habbo.avatar.cache.AvatarImageCache;
   import com.sulake.habbo.avatar.enum.AvatarAction;
   import flash.display.BitmapData;
   
   public class PlaceholderAvatarImage extends AvatarImage
   {
      
      static var var_673:Map = new Map();
       
      
      public function PlaceholderAvatarImage(param1:AvatarStructure, param2:AssetAliasCollection, param3:AvatarFigureContainer, param4:String)
      {
         super(param1,param2,param3,param4);
      }
      
      override public function dispose() : void
      {
         var _loc1_:* = null;
         if(!var_732)
         {
            _structure = null;
            _assets = null;
            var_260 = null;
            var_269 = null;
            var_581 = null;
            var_530 = null;
            var_314 = null;
            if(!var_1227 && var_44)
            {
               var_44.dispose();
            }
            var_44 = null;
            _loc1_ = getCache();
            if(_loc1_)
            {
               _loc1_.dispose();
               _loc1_ = null;
            }
            var_686 = null;
            var_732 = true;
         }
      }
      
      override protected function getFullImage(param1:String) : BitmapData
      {
         return var_673[param1];
      }
      
      override protected function cacheFullImage(param1:String, param2:BitmapData) : void
      {
         var_673[param1] = param2;
      }
      
      override public function appendAction(param1:String, ... rest) : Boolean
      {
         var _loc3_:* = null;
         if(rest != null && rest.length > 0)
         {
            _loc3_ = rest[0];
         }
         switch(param1)
         {
            case AvatarAction.const_354:
               switch(_loc3_)
               {
                  case AvatarAction.const_656:
                  case AvatarAction.const_522:
                  case AvatarAction.const_381:
                  case AvatarAction.const_625:
                  case AvatarAction.const_340:
                  case AvatarAction.const_704:
                     super.appendAction.apply(null,[param1].concat(rest));
               }
               break;
            case AvatarAction.const_296:
            case AvatarAction.const_679:
            case AvatarAction.const_253:
            case AvatarAction.const_786:
            case AvatarAction.const_759:
            case AvatarAction.const_783:
               super.addActionData.apply(null,[param1].concat(rest));
         }
         return true;
      }
      
      override public function isPlaceholder() : Boolean
      {
         return true;
      }
   }
}
