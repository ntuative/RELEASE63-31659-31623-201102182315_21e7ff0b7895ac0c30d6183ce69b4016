package com.sulake.habbo.room
{
   import com.sulake.core.Core;
   import com.sulake.core.assets.AssetLibrary;
   import com.sulake.core.assets.AssetLibraryCollection;
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.utils.LibraryLoader;
   import com.sulake.core.utils.LibraryLoaderEvent;
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.room.object.RoomObjectCategoryEnum;
   import com.sulake.habbo.room.object.RoomObjectLogicEnum;
   import com.sulake.habbo.room.object.RoomObjectVisualizationEnum;
   import com.sulake.habbo.room.utils.PublicRoomData;
   import com.sulake.habbo.session.ISessionDataManager;
   import com.sulake.habbo.session.furniture.IFurniDataListener;
   import com.sulake.habbo.session.furniture.IFurnitureData;
   import com.sulake.room.IRoomContentLoader;
   import com.sulake.room.events.RoomContentLoadedEvent;
   import com.sulake.room.object.IRoomObjectVisualizationFactory;
   import com.sulake.room.object.visualization.utils.IGraphicAssetCollection;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.net.URLRequest;
   import flash.utils.Dictionary;
   
   public class RoomContentLoader implements IRoomContentLoader, IFurniDataListener, IDisposable
   {
      
      public static const const_812:String = "RCL_LOADER_READY";
      
      private static const const_326:String = "RCL_PUBLICROOM_";
      
      private static const const_1666:int = 0;
      
      private static const const_905:int = 1;
      
      private static const name_3:int = 2;
      
      private static const const_413:String = "place_holder";
      
      private static const const_583:String = "wall_place_holder";
      
      private static const const_584:String = "pet_place_holder";
      
      private static const PLACE_HOLDER_DEFAULT:String = const_413;
      
      private static const const_585:String = "room";
      
      private static const TILE_CURSOR:String = "tile_cursor";
      
      private static const const_906:String = "selection_arrow";
       
      
      private var var_452:Map = null;
      
      private var _events:Map = null;
      
      private var _assetLibrary:AssetLibrary = null;
      
      private var var_665:Map = null;
      
      private var var_383:Map = null;
      
      private var var_506:IRoomObjectVisualizationFactory = null;
      
      private var _state:int = 0;
      
      private var _stateEvents:IEventDispatcher = null;
      
      private var var_732:Boolean = false;
      
      private var var_2076:Boolean = false;
      
      private var var_548:Map = null;
      
      private var var_322:Dictionary;
      
      private var var_549:Map = null;
      
      private var _wallItems:Dictionary;
      
      private var var_819:Map = null;
      
      private var var_384:Dictionary;
      
      private var var_820:Map = null;
      
      private var var_189:PublicRoomData = null;
      
      private var var_1259:Map = null;
      
      private var var_550:Map = null;
      
      private var var_453:Map = null;
      
      private var var_454:Map = null;
      
      private var var_666:Map = null;
      
      private var var_2075:String;
      
      private var var_2077:String;
      
      private var var_2078:String;
      
      private var _publicRoomLoadNameTemplate:String;
      
      private var var_2079:Array;
      
      private var _publicRoomVisualTypeList:Array;
      
      private var var_1525:Boolean = false;
      
      private var var_404:ISessionDataManager;
      
      public function RoomContentLoader()
      {
         this.var_322 = new Dictionary();
         this._wallItems = new Dictionary();
         this.var_384 = new Dictionary();
         this.var_2079 = ["hh_people_pool","hh_people_pool_calippo","hh_paalu","hh_people_paalu"];
         this._publicRoomVisualTypeList = ["room_public","room_public_park","room_public_pool"];
         super();
         this.var_452 = new Map();
         this._events = new Map();
         this._assetLibrary = new AssetLibrary("room_engine");
         this.var_548 = new Map();
         this.var_549 = new Map();
         this.var_819 = new Map();
         this.initPetData();
         this.var_666 = new Map();
         this.var_550 = new Map();
         this.var_453 = new Map();
         this.var_454 = new Map();
         this.var_383 = new Map();
         this.var_665 = new Map();
         this.var_1259 = new Map();
      }
      
      public function set sessionDataManager(param1:ISessionDataManager) : void
      {
         this.var_404 = param1;
         if(this.var_1525)
         {
            this.var_1525 = false;
            this.initFurnitureData();
         }
      }
      
      public function get disposed() : Boolean
      {
         return this.var_732;
      }
      
      public function set visualizationFactory(param1:IRoomObjectVisualizationFactory) : void
      {
         this.var_506 = param1;
      }
      
      public function initialize(param1:IEventDispatcher, param2:IHabboConfigurationManager) : void
      {
         if(this._state >= const_905)
         {
            return;
         }
         this._stateEvents = param1;
         this.var_2075 = param2.getKey("flash.dynamic.download.url","furniture/");
         this.var_2077 = param2.getKey("flash.dynamic.download.name.template","%typeid%.swf");
         this.var_2078 = param2.getKey("public.room.dynamic.download.url","");
         this._publicRoomLoadNameTemplate = param2.getKey("public.room.dynamic.download.name.template","%typeid%.swf");
         this._state = const_905;
         this.initFurnitureData();
      }
      
      private function initPetData() : void
      {
         var _loc3_:* = null;
         var _loc1_:* = ["spider","turtle","chicken","frog","dragon","monster"];
         var _loc2_:int = 8;
         for each(_loc3_ in _loc1_)
         {
            this.var_384[_loc3_] = _loc2_;
            this.var_819.add(_loc2_,_loc3_);
            _loc2_++;
         }
         this.var_820 = new Map();
      }
      
      private function initFurnitureData() : void
      {
         if(this.var_404 == null)
         {
            this.var_1525 = true;
            return;
         }
         var _loc1_:Array = this.var_404.getFurniData(this);
         if(_loc1_ == null)
         {
            return;
         }
         this.populateFurniData(_loc1_);
         this.var_2076 = true;
         this.continueInitilization();
      }
      
      public function dispose() : void
      {
         var _loc1_:* = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc5_:* = null;
         if(this.var_452 != null)
         {
            _loc2_ = this.var_452.length;
            _loc3_ = 0;
            while(_loc3_ < _loc2_)
            {
               _loc4_ = this.var_452.getWithIndex(_loc3_) as AssetLibrary;
               if(_loc4_ != null)
               {
                  _loc4_.dispose();
               }
               _loc3_++;
            }
            this.var_452.dispose();
            this.var_452 = null;
         }
         if(this._events != null)
         {
            this._events.dispose();
            this._events = null;
         }
         if(this.var_548 != null)
         {
            this.var_548.dispose();
            this.var_548 = null;
         }
         if(this.var_549 != null)
         {
            this.var_549.dispose();
            this.var_549 = null;
         }
         if(this.var_819 != null)
         {
            this.var_819.dispose();
            this.var_819 = null;
         }
         if(this.var_820 != null)
         {
            this.var_820.dispose();
            this.var_820 = null;
         }
         if(this._assetLibrary != null)
         {
            this._assetLibrary.dispose();
            this._assetLibrary = null;
         }
         if(this.var_550 != null)
         {
            this.var_550.dispose();
            this.var_550 = null;
         }
         if(this.var_453 != null)
         {
            this.var_453.dispose();
            this.var_453 = null;
         }
         if(this.var_454 != null)
         {
            this.var_454.dispose();
            this.var_454 = null;
         }
         if(this.var_666 != null)
         {
            this.var_666.dispose();
            this.var_666 = null;
         }
         if(this.var_383 != null)
         {
            _loc2_ = this.var_383.length;
            _loc3_ = 0;
            while(_loc3_ < _loc2_)
            {
               _loc5_ = this.var_383.getWithIndex(_loc3_) as IGraphicAssetCollection;
               if(_loc5_ != null)
               {
                  _loc5_.dispose();
               }
               _loc3_++;
            }
            this.var_383.dispose();
            this.var_383 = null;
         }
         if(this.var_665 != null)
         {
            this.var_665.dispose();
            this.var_665 = null;
         }
         if(this.var_322 != null)
         {
            for(_loc1_ in this.var_322)
            {
               delete this.var_322[_loc1_];
            }
            this.var_322 = null;
         }
         if(this._wallItems != null)
         {
            for(_loc1_ in this._wallItems)
            {
               delete this._wallItems[_loc1_];
            }
            this._wallItems = null;
         }
         if(this.var_384 != null)
         {
            for(_loc1_ in this.var_384)
            {
               delete this.var_384[_loc1_];
            }
            this.var_384 = null;
         }
         this._stateEvents = null;
         this.var_404 = null;
         this.var_732 = true;
      }
      
      private function populateFurniData(param1:Array) : void
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc5_:int = 0;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:int = 0;
         for each(_loc2_ in param1)
         {
            _loc3_ = _loc2_.id;
            _loc4_ = _loc2_.name;
            if(_loc2_.colourIndex > 0)
            {
               _loc4_ = _loc4_ + "*" + _loc2_.colourIndex;
            }
            _loc5_ = _loc2_.revision;
            _loc6_ = _loc2_.adUrl;
            if(_loc6_.length > 0)
            {
               this.var_666.add(_loc4_,_loc6_);
            }
            _loc7_ = _loc2_.name;
            if(_loc2_.type == "s")
            {
               this.var_548.add(_loc3_,_loc4_);
               if(this.var_322[_loc7_] == null)
               {
                  this.var_322[_loc7_] = 1;
               }
            }
            else if(_loc2_.type == "i")
            {
               if(_loc4_ == "post.it")
               {
                  _loc4_ = "post_it";
                  _loc7_ = "post_it";
               }
               if(_loc4_ == "post.it.vd")
               {
                  _loc4_ = "post_it_vd";
                  _loc7_ = "post_it_vd";
               }
               this.var_549.add(_loc3_,_loc4_);
               if(this._wallItems[_loc7_] == null)
               {
                  this._wallItems[_loc7_] = 1;
               }
            }
            _loc8_ = this.var_550.getValue(_loc7_);
            if(_loc5_ > _loc8_)
            {
               this.var_550.remove(_loc7_);
               this.var_550.add(_loc7_,_loc5_);
            }
         }
      }
      
      private function continueInitilization() : void
      {
         if(this.var_2076)
         {
            this._state = name_3;
            if(this._stateEvents != null)
            {
               this._stateEvents.dispatchEvent(new Event(const_812));
            }
         }
      }
      
      public function setRoomObjectAlias(param1:String, param2:String) : void
      {
         if(this.var_453 != null)
         {
            this.var_453.remove(param1);
            this.var_453.add(param1,param2);
         }
         if(this.var_454 != null)
         {
            this.var_454.remove(param2);
            this.var_454.add(param2,param1);
         }
      }
      
      private function getRoomObjectAlias(param1:String) : String
      {
         var _loc2_:* = null;
         if(this.var_453 != null)
         {
            _loc2_ = this.var_453.getValue(param1) as String;
         }
         if(_loc2_ == null)
         {
            _loc2_ = param1;
         }
         return _loc2_;
      }
      
      private function getRoomObjectOriginalName(param1:String) : String
      {
         var _loc2_:* = null;
         if(this.var_454 != null)
         {
            _loc2_ = this.var_454.getValue(param1) as String;
         }
         if(_loc2_ == null)
         {
            _loc2_ = param1;
         }
         return _loc2_;
      }
      
      public function getObjectCategory(param1:String) : int
      {
         if(param1 == null)
         {
            return RoomObjectCategoryEnum.const_167;
         }
         if(this.var_322[param1] != null)
         {
            return RoomObjectCategoryEnum.OBJECT_CATEGORY_FURNITURE;
         }
         if(this._wallItems[param1] != null)
         {
            return RoomObjectCategoryEnum.const_27;
         }
         if(this.var_384[param1] != null)
         {
            return RoomObjectCategoryEnum.OBJECT_CATEGORY_USER;
         }
         if(param1.indexOf("poster") == 0)
         {
            return RoomObjectCategoryEnum.const_27;
         }
         if(this.var_189 != null && (this.var_189.type == param1 || this.var_189.hasWorldType(param1)))
         {
            return RoomObjectCategoryEnum.const_78;
         }
         if(param1 == "room")
         {
            return RoomObjectCategoryEnum.const_78;
         }
         if(param1 == "user")
         {
            return RoomObjectCategoryEnum.OBJECT_CATEGORY_USER;
         }
         if(param1 == "pet")
         {
            return RoomObjectCategoryEnum.OBJECT_CATEGORY_USER;
         }
         if(param1 == "bot")
         {
            return RoomObjectCategoryEnum.OBJECT_CATEGORY_USER;
         }
         if(param1 == "tile_cursor" || param1 == "selection_arrow")
         {
            return RoomObjectCategoryEnum.const_295;
         }
         return RoomObjectCategoryEnum.const_167;
      }
      
      public function getPlaceHolderType(param1:String) : String
      {
         if(this.var_322[param1] != null)
         {
            return const_413;
         }
         if(this._wallItems[param1] != null)
         {
            return const_583;
         }
         if(this.var_384[param1] != null)
         {
            return const_584;
         }
         if(this.var_189 != null && (this.var_189.type == param1 || this.var_189.hasWorldType(param1)))
         {
            return const_585;
         }
         return PLACE_HOLDER_DEFAULT;
      }
      
      public function getPlaceHolderTypes() : Array
      {
         return [const_413,const_583,const_584,const_585,TILE_CURSOR,const_906];
      }
      
      public function getActiveObjectType(param1:int) : String
      {
         var _loc2_:String = this.var_548.getValue(param1) as String;
         return this.getObjectType(_loc2_);
      }
      
      public function getWallItemType(param1:int, param2:String = null) : String
      {
         var _loc3_:String = this.var_549.getValue(param1) as String;
         if(_loc3_ == "poster" && param2 != null)
         {
            _loc3_ += param2;
         }
         return this.getObjectType(_loc3_);
      }
      
      public function getPetType(param1:int) : String
      {
         return this.var_819.getValue(param1) as String;
      }
      
      public function getPetColor(param1:int, param2:int) : PetColorResult
      {
         var _loc3_:Map = this.var_820[param1];
         if(_loc3_ != null)
         {
            return _loc3_[param2] as PetColorResult;
         }
         return null;
      }
      
      public function getActiveObjectColorIndex(param1:int) : int
      {
         var _loc2_:String = this.var_548.getValue(param1) as String;
         return this.getObjectColorIndex(_loc2_);
      }
      
      public function getWallItemColorIndex(param1:int) : int
      {
         var _loc2_:String = this.var_549.getValue(param1) as String;
         return this.getObjectColorIndex(_loc2_);
      }
      
      public function getRoomObjectAdURL(param1:String) : String
      {
         if(this.var_666.getValue(param1) != null)
         {
            return this.var_666.getValue(param1);
         }
         return "";
      }
      
      private function getObjectType(param1:String) : String
      {
         if(param1 == null)
         {
            return null;
         }
         var _loc2_:int = param1.indexOf("*");
         if(_loc2_ >= 0)
         {
            param1 = param1.substr(0,_loc2_);
         }
         return param1;
      }
      
      private function getObjectColorIndex(param1:String) : int
      {
         if(param1 == null)
         {
            return -1;
         }
         var _loc2_:int = 0;
         var _loc3_:int = param1.indexOf("*");
         if(_loc3_ >= 0)
         {
            _loc2_ = int(param1.substr(_loc3_ + 1));
         }
         return _loc2_;
      }
      
      public function getContentType(param1:String) : String
      {
         if(param1.indexOf("@shadow") > -1)
         {
            if(param1.indexOf("@shadow") == param1.length - 7)
            {
               param1 = param1.substr(0,param1.length - 7);
            }
         }
         return param1;
      }
      
      public function getPublicRoomContentType(param1:String) : String
      {
         if(this.var_189 != null && this.var_189.hasWorldType(const_326 + param1))
         {
            return this.var_189.type;
         }
         return param1;
      }
      
      public function hasInternalContent(param1:String) : Boolean
      {
         if(param1 == RoomObjectVisualizationEnum.const_176 || param1 == RoomObjectVisualizationEnum.const_63 || param1 == RoomObjectVisualizationEnum.BOT)
         {
            return true;
         }
         return false;
      }
      
      private function getObjectRevision(param1:String) : int
      {
         var _loc3_:int = 0;
         var _loc2_:int = this.getObjectCategory(param1);
         if(_loc2_ == RoomObjectCategoryEnum.OBJECT_CATEGORY_FURNITURE || _loc2_ == RoomObjectCategoryEnum.const_27)
         {
            if(param1.indexOf("poster") == 0)
            {
               param1 = "poster";
            }
            return int(this.var_550.getValue(param1));
         }
         return 0;
      }
      
      private function getObjectContentURLs(param1:String) : Array
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:int = 0;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:int = 0;
         var _loc10_:* = null;
         _loc2_ = this.getContentType(param1);
         Logger.log("Getting content URL for object type: " + param1);
         switch(_loc2_)
         {
            case const_413:
               return ["PlaceHolderFurniture.swf"];
            case const_583:
               return ["PlaceHolderWallItem.swf"];
            case const_584:
               return ["PlaceHolderPet.swf"];
            case const_585:
               return ["HabboRoomContent.swf"];
            case TILE_CURSOR:
               return ["TileCursor.swf"];
            case const_906:
               return ["SelectionArrow.swf"];
            default:
               _loc3_ = this.getObjectCategory(_loc2_);
               if(_loc3_ == RoomObjectCategoryEnum.OBJECT_CATEGORY_FURNITURE || _loc3_ == RoomObjectCategoryEnum.const_27)
               {
                  _loc4_ = this.getRoomObjectAlias(_loc2_);
                  _loc5_ = this.var_2077;
                  _loc5_ = _loc5_.replace(/%typeid%/,_loc4_);
                  _loc6_ = this.getObjectRevision(_loc2_);
                  _loc5_ = _loc5_.replace(/%revision%/,_loc6_);
                  return [this.var_2075 + _loc5_];
               }
               if(_loc3_ == RoomObjectCategoryEnum.OBJECT_CATEGORY_USER)
               {
                  return [_loc2_ + ".swf"];
               }
               _loc7_ = _loc2_.split(",");
               _loc8_ = [];
               _loc9_ = 0;
               while(_loc9_ < _loc7_.length)
               {
                  _loc10_ = this._publicRoomLoadNameTemplate;
                  _loc10_ = _loc10_.replace(/%typeid%/,_loc7_[_loc9_]);
                  _loc8_.push(this.var_2078 + _loc10_);
                  _loc9_++;
               }
               return _loc8_;
         }
      }
      
      public function insertObjectContent(param1:int, param2:int, param3:IAssetLibrary) : Boolean
      {
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc4_:String = this.getAssetLibraryType(param3);
         switch(param2)
         {
            case RoomObjectCategoryEnum.OBJECT_CATEGORY_FURNITURE:
               this.var_548[param1] = _loc4_;
               break;
            case RoomObjectCategoryEnum.const_27:
               this.var_549[param1] = _loc4_;
               break;
            default:
               throw new Error("Registering content library for unsupported category " + param2 + "!");
         }
         var _loc5_:AssetLibraryCollection = this.addAssetLibraryCollection(_loc4_,null) as AssetLibraryCollection;
         if(_loc5_)
         {
            _loc5_.addAssetLibrary(param3);
            if(this.initializeGraphicAssetCollection(_loc4_,param3))
            {
               switch(param2)
               {
                  case RoomObjectCategoryEnum.OBJECT_CATEGORY_FURNITURE:
                     if(this.var_322[_loc4_] == null)
                     {
                        this.var_322[_loc4_] = 1;
                     }
                     break;
                  case RoomObjectCategoryEnum.const_27:
                     if(this._wallItems[_loc4_] == null)
                     {
                        this._wallItems[_loc4_] = 1;
                     }
                     break;
                  default:
                     throw new Error("Registering content library for unsupported category " + param2 + "!");
               }
               _loc6_ = new RoomContentLoadedEvent(RoomContentLoadedEvent.const_398,_loc4_);
               _loc7_ = this.getAssetLibraryEventDispatcher(_loc4_,true);
               if(_loc7_)
               {
                  _loc7_.dispatchEvent(_loc6_);
               }
               return true;
            }
         }
         return false;
      }
      
      public function loadObjectContent(param1:String, param2:IEventDispatcher) : Boolean
      {
         var _loc5_:* = null;
         var _loc6_:int = 0;
         var _loc7_:* = null;
         var _loc3_:* = null;
         if(param1.indexOf(",") >= 0)
         {
            _loc3_ = param1;
            param1 = _loc3_.split(",")[0];
         }
         if(this.var_1259.getValue(param1) != null)
         {
            this.var_189 = this.var_1259.getValue(param1) as PublicRoomData;
         }
         if(this.getAssetLibrary(param1) != null || this.getAssetLibraryEventDispatcher(param1) != null)
         {
            return false;
         }
         var _loc4_:AssetLibraryCollection = this.addAssetLibraryCollection(param1,param2) as AssetLibraryCollection;
         if(_loc4_ == null)
         {
            return false;
         }
         if(_loc3_ != null)
         {
            _loc5_ = this.getObjectContentURLs(_loc3_);
         }
         else
         {
            _loc5_ = this.getObjectContentURLs(param1);
         }
         if(_loc5_ != null && _loc5_.length > 0)
         {
            _loc4_.addEventListener(AssetLibrary.const_637,this.onContentLoaded);
            _loc6_ = 0;
            while(_loc6_ < _loc5_.length)
            {
               _loc7_ = new LibraryLoader();
               _loc7_.load(new URLRequest(_loc5_[_loc6_]));
               _loc4_.loadFromFile(_loc7_,true);
               _loc7_.addEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_ERROR,this.onContentLoadError);
               _loc6_++;
            }
            return true;
         }
         return false;
      }
      
      public function loadLegacyContent(param1:String, param2:IEventDispatcher) : Array
      {
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc3_:Array = param1.split(",");
         var _loc4_:Array = new Array();
         var _loc5_:int = 0;
         while(_loc5_ < _loc3_.length)
         {
            if(_loc3_[_loc5_].toString().length > 0 && this.var_2079.indexOf(_loc3_[_loc5_]) == -1)
            {
               _loc6_ = _loc3_[_loc5_].toString();
               while(_loc6_.indexOf(" ") >= 0)
               {
                  if(_loc6_.indexOf(" ") == 0)
                  {
                     _loc6_ = _loc6_.substr(1,_loc6_.length - 1);
                  }
                  else if(_loc6_.indexOf(" ") == _loc6_.length - 1)
                  {
                     _loc6_ = _loc6_.substr(0,_loc6_.length - 2);
                  }
               }
               _loc4_.push(_loc6_);
            }
            _loc5_++;
         }
         if(_loc4_.length > 0)
         {
            _loc7_ = _loc4_[0];
            _loc5_ = 1;
            while(_loc5_ < _loc4_.length)
            {
               _loc7_ += ",";
               _loc7_ += _loc4_[_loc5_];
               _loc5_++;
            }
            if(this.loadObjectContent(_loc7_,param2))
            {
               return [_loc4_[0]];
            }
         }
         return [];
      }
      
      private function onContentLoadError(param1:Event) : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc2_:LibraryLoader = LibraryLoader(param1.target);
         var _loc3_:Array = this.getPlaceHolderTypes();
         for each(_loc4_ in _loc3_)
         {
            _loc5_ = this.getObjectContentURLs(_loc4_);
            if(_loc5_.length > 0 && _loc2_.url != null && _loc2_.url.indexOf(_loc5_[0]) == 0)
            {
               Core.crash("Failed to load asset: " + _loc2_.url,Core.const_1532);
               return;
            }
         }
      }
      
      private function onContentLoaded(param1:Event) : void
      {
         if(this.disposed)
         {
            return;
         }
         var _loc2_:IAssetLibrary = param1.target as IAssetLibrary;
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:* = null;
         var _loc4_:Boolean = false;
         var _loc5_:String = this.getAssetLibraryType(_loc2_);
         _loc5_ = this.getRoomObjectOriginalName(_loc5_);
         if(_loc5_ != null)
         {
            _loc4_ = this.initializeGraphicAssetCollection(_loc5_,_loc2_);
         }
         if(_loc4_)
         {
            if(this._publicRoomVisualTypeList.indexOf(this.getVisualizationType(_loc5_)) >= 0)
            {
               this.extractPublicRoomDataFromLoadedContent(_loc5_,_loc2_);
            }
            else if(this.var_384[_loc5_] != null)
            {
               this.extractPetDataFromLoadedContent(_loc5_);
            }
            _loc3_ = new RoomContentLoadedEvent(RoomContentLoadedEvent.const_398,_loc5_);
         }
         else
         {
            _loc3_ = new RoomContentLoadedEvent(RoomContentLoadedEvent.const_515,_loc5_);
         }
         var _loc6_:IEventDispatcher = this.getAssetLibraryEventDispatcher(_loc5_,true);
         if(_loc6_ != null && _loc3_ != null)
         {
            _loc6_.dispatchEvent(_loc3_);
         }
      }
      
      private function extractPetDataFromLoadedContent(param1:String) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:int = 0;
         var _loc7_:* = null;
         var _loc2_:IGraphicAssetCollection = this.getGraphicAssetCollection(param1);
         if(_loc2_ != null)
         {
            _loc3_ = new Map();
            _loc4_ = _loc2_.getPaletteNames();
            for each(_loc5_ in _loc4_)
            {
               _loc7_ = _loc2_.getPaletteColors(_loc5_);
               if(_loc7_ != null && _loc7_.length >= 2)
               {
                  _loc3_.add(_loc5_,new PetColorResult(_loc7_[0],_loc7_[1]));
               }
            }
            _loc6_ = this.var_384[param1];
            this.var_820.add(_loc6_,_loc3_);
         }
      }
      
      private function extractPublicRoomDataFromLoadedContent(param1:String, param2:IAssetLibrary) : void
      {
         var _loc3_:XML = this.getVisualizationXML(param1);
         var _loc4_:PublicRoomData = this.extractPublicRoomFromXML(param1,_loc3_);
         this.var_1259.add(param1,_loc4_);
         this.var_189 = _loc4_;
         this.extractPublicRoomFurniture(param1,param2);
      }
      
      private function extractPublicRoomFurniture(param1:String, param2:IAssetLibrary) : int
      {
         var _loc6_:* = null;
         var _loc7_:* = null;
         if(param2 == null)
         {
            return 0;
         }
         var _loc3_:Array = param2.nameArray;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         while(_loc5_ < _loc3_.length)
         {
            _loc6_ = _loc3_[_loc5_];
            if(_loc6_.indexOf("_index") > 0)
            {
               _loc7_ = _loc6_.slice(0,_loc6_.indexOf("_index"));
               if(this.extractObjectContent(param1,_loc7_))
               {
                  _loc4_++;
               }
            }
            _loc5_++;
         }
         return _loc4_;
      }
      
      private function initializeGraphicAssetCollection(param1:String, param2:IAssetLibrary) : Boolean
      {
         var _loc5_:* = null;
         if(param1 == null || param2 == null)
         {
            return false;
         }
         var _loc3_:Boolean = false;
         var _loc4_:IGraphicAssetCollection = this.createGraphicAssetCollection(param1,param2);
         if(_loc4_ != null)
         {
            _loc5_ = this.getAssetXML(param1);
            if(_loc4_.define(_loc5_))
            {
               _loc3_ = true;
            }
            else
            {
               this.disposeGraphicAssetCollection(param1);
            }
         }
         return _loc3_;
      }
      
      public function extractObjectContent(param1:String, param2:String) : Boolean
      {
         var _loc3_:IAssetLibrary = this.getAssetLibrary(param1);
         this.var_665.add(param2,param1);
         if(this.initializeGraphicAssetCollection(param2,_loc3_))
         {
            return true;
         }
         this.var_665.remove(param2);
         return false;
      }
      
      private function getAssetLibraryName(param1:String) : String
      {
         return "RoomContentLoader " + param1;
      }
      
      private function getAssetLibrary(param1:String) : IAssetLibrary
      {
         var _loc4_:* = null;
         var _loc2_:String = this.getContentType(param1);
         _loc2_ = this.getRoomObjectOriginalName(_loc2_);
         var _loc3_:IAssetLibrary = this.var_452.getValue(this.getAssetLibraryName(_loc2_)) as IAssetLibrary;
         if(_loc3_ == null)
         {
            _loc4_ = this.var_665.getValue(_loc2_);
            if(_loc4_ != null)
            {
               _loc2_ = this.getContentType(_loc4_);
               _loc3_ = this.var_452.getValue(this.getAssetLibraryName(_loc2_)) as IAssetLibrary;
            }
         }
         return _loc3_;
      }
      
      private function addAssetLibraryCollection(param1:String, param2:IEventDispatcher) : IAssetLibrary
      {
         var _loc3_:String = this.getContentType(param1);
         var _loc4_:IAssetLibrary = this.getAssetLibrary(param1);
         if(_loc4_ != null)
         {
            return _loc4_;
         }
         var _loc5_:String = this.getAssetLibraryName(_loc3_);
         _loc4_ = new AssetLibraryCollection(_loc5_);
         this.var_452.add(_loc5_,_loc4_);
         if(param2 != null && this.getAssetLibraryEventDispatcher(param1) == null)
         {
            this._events.add(_loc3_,param2);
         }
         return _loc4_;
      }
      
      private function getAssetLibraryEventDispatcher(param1:String, param2:Boolean = false) : IEventDispatcher
      {
         var _loc3_:String = this.getContentType(param1);
         if(!param2)
         {
            return this._events.getValue(_loc3_);
         }
         return this._events.remove(_loc3_);
      }
      
      private function getAssetLibraryType(param1:IAssetLibrary) : String
      {
         if(param1 == null)
         {
            return null;
         }
         var _loc2_:IAsset = param1.getAssetByName("index");
         if(_loc2_ == null)
         {
            return null;
         }
         var _loc3_:XML = _loc2_.content as XML;
         if(_loc3_ == null)
         {
            return null;
         }
         return _loc3_.@type;
      }
      
      public function getVisualizationType(param1:String) : String
      {
         if(param1 == null)
         {
            return null;
         }
         var _loc2_:IAssetLibrary = this.getAssetLibrary(param1);
         if(_loc2_ == null)
         {
            return null;
         }
         var _loc3_:IAsset = _loc2_.getAssetByName(param1 + "_index");
         if(_loc3_ == null)
         {
            _loc3_ = _loc2_.getAssetByName("index");
         }
         if(_loc3_ == null)
         {
            return null;
         }
         var _loc4_:XML = _loc3_.content as XML;
         if(_loc4_ == null)
         {
            return null;
         }
         return _loc4_.@visualization;
      }
      
      public function getLogicType(param1:String) : String
      {
         var _loc6_:* = null;
         if(param1 == null)
         {
            return null;
         }
         var _loc2_:IAssetLibrary = this.getAssetLibrary(param1);
         if(_loc2_ == null)
         {
            return null;
         }
         var _loc3_:IAsset = _loc2_.getAssetByName(param1 + "_index");
         if(_loc3_ == null)
         {
            _loc3_ = _loc2_.getAssetByName("index");
         }
         if(_loc3_ == null)
         {
            return null;
         }
         var _loc4_:XML = _loc3_.content as XML;
         if(_loc4_ == null)
         {
            return null;
         }
         var _loc5_:String = _loc4_.@logic;
         if(_loc5_ != RoomObjectLogicEnum.const_264 && _loc5_ != RoomObjectLogicEnum.const_176)
         {
            _loc6_ = "@shadow";
            if(param1.indexOf(_loc6_) > -1)
            {
               if(param1.indexOf(_loc6_) == param1.length - _loc6_.length)
               {
                  _loc5_ = "null";
               }
            }
         }
         return _loc5_;
      }
      
      public function getVisualizationXML(param1:String) : XML
      {
         return this.getXML(param1,"_visualization");
      }
      
      public function getAssetXML(param1:String) : XML
      {
         return this.getXML(param1,"_assets");
      }
      
      public function getLogicXML(param1:String) : XML
      {
         return this.getXML(param1,"_logic");
      }
      
      private function getXML(param1:String, param2:String) : XML
      {
         var _loc3_:IAssetLibrary = this.getAssetLibrary(param1);
         if(_loc3_ == null)
         {
            return null;
         }
         var _loc4_:String = this.getContentType(param1);
         var _loc5_:String = this.getRoomObjectAlias(_loc4_);
         var _loc6_:IAsset = _loc3_.getAssetByName(_loc5_ + param2);
         if(_loc6_ == null)
         {
            return null;
         }
         var _loc7_:XML = _loc6_.content as XML;
         if(_loc7_ == null)
         {
            return null;
         }
         return _loc7_;
      }
      
      public function addGraphicAsset(param1:String, param2:String, param3:BitmapData, param4:Boolean) : Boolean
      {
         var _loc5_:IGraphicAssetCollection = this.getGraphicAssetCollection(param1);
         if(_loc5_ != null)
         {
            return _loc5_.addAsset(param2,param3,param4);
         }
         return false;
      }
      
      private function createGraphicAssetCollection(param1:String, param2:IAssetLibrary) : IGraphicAssetCollection
      {
         var _loc3_:IGraphicAssetCollection = this.getGraphicAssetCollection(param1);
         if(_loc3_ != null)
         {
            return _loc3_;
         }
         if(param2 == null)
         {
            return null;
         }
         _loc3_ = this.var_506.createGraphicAssetCollection();
         if(_loc3_ != null)
         {
            _loc3_.assetLibrary = param2;
            this.var_383.add(param1,_loc3_);
         }
         return _loc3_;
      }
      
      public function getGraphicAssetCollection(param1:String) : IGraphicAssetCollection
      {
         var _loc2_:String = this.getContentType(param1);
         return this.var_383.getValue(_loc2_) as IGraphicAssetCollection;
      }
      
      private function disposeGraphicAssetCollection(param1:String) : Boolean
      {
         var _loc3_:* = null;
         var _loc2_:String = this.getContentType(param1);
         if(this.var_383[_loc2_] != null)
         {
            _loc3_ = this.var_383.remove(_loc2_);
            if(_loc3_ != null)
            {
               _loc3_.dispose();
            }
            return true;
         }
         return false;
      }
      
      private function extractPublicRoomFromXML(param1:String, param2:XML) : PublicRoomData
      {
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = NaN;
         var _loc9_:* = NaN;
         var _loc3_:XMLList = param2.layoutData;
         var _loc4_:PublicRoomData = new PublicRoomData(param1);
         var _loc5_:int = 0;
         while(_loc5_ < _loc3_.length())
         {
            _loc6_ = _loc3_[_loc5_];
            _loc7_ = const_326 + String(_loc6_.@name);
            _loc8_ = 32;
            _loc9_ = 1;
            if(String(_loc6_.@size) != "")
            {
               _loc8_ = Number(parseInt(_loc6_.@size));
            }
            if(String(_loc6_.@heightScale) != "")
            {
               _loc9_ = Number(parseFloat(_loc6_.@heightScale));
            }
            _loc4_.addWorld(_loc7_,_loc8_,_loc9_);
            _loc5_++;
         }
         return _loc4_;
      }
      
      public function isPublicRoomWorldType(param1:String) : Boolean
      {
         if(this.getObjectCategory(const_326 + param1) == RoomObjectCategoryEnum.const_78)
         {
            return true;
         }
         return false;
      }
      
      public function getPublicRoomWorldHeightScale(param1:String) : Number
      {
         if(this.var_189 != null)
         {
            return this.var_189.getWorldHeightScale(const_326 + param1);
         }
         return 1;
      }
      
      public function getPublicRoomWorldSize(param1:String) : int
      {
         if(this.var_189 != null)
         {
            return this.var_189.getWorldScale(const_326 + param1);
         }
         return 32;
      }
      
      public function furniDataReady() : void
      {
         this.initFurnitureData();
      }
   }
}
