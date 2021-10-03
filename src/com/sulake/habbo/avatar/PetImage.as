package com.sulake.habbo.avatar
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.habbo.avatar.actions.ActiveActionData;
   import com.sulake.habbo.avatar.actions.IActiveActionData;
   import com.sulake.habbo.avatar.alias.AssetAliasCollection;
   import com.sulake.habbo.avatar.animation.Animation;
   import com.sulake.habbo.avatar.animation.IAnimationLayerData;
   import com.sulake.habbo.avatar.animation.IAvatarDataContainer;
   import com.sulake.habbo.avatar.animation.ISpriteDataContainer;
   import com.sulake.habbo.avatar.cache.AvatarImageBodyPartCache;
   import com.sulake.habbo.avatar.cache.AvatarImageCache;
   import com.sulake.habbo.avatar.enum.AvatarAction;
   import com.sulake.habbo.avatar.enum.AvatarDirectionAngle;
   import com.sulake.habbo.avatar.enum.AvatarScaleType;
   import com.sulake.habbo.avatar.enum.AvatarSetType;
   import com.sulake.habbo.avatar.pets.IPetData;
   import com.sulake.habbo.avatar.structure.AvatarCanvas;
   import com.sulake.habbo.avatar.structure.figure.FigurePart;
   import com.sulake.habbo.avatar.structure.figure.IFigurePartSet;
   import com.sulake.habbo.avatar.structure.figure.IPartColor;
   import com.sulake.habbo.avatar.structure.figure.ISetType;
   import flash.display.BitmapData;
   import flash.filters.ColorMatrixFilter;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.getTimer;
   
   public class PetImage implements IAvatarImage, IDisposable
   {
      
      private static const CHANNELS_EQUAL:String = "CHANNELS_EQUAL";
      
      private static const CHANNELS_UNIQUE:String = "CHANNELS_UNIQUE";
      
      private static const CHANNELS_RED:String = "CHANNELS_RED";
      
      private static const CHANNELS_GREEN:String = "CHANNELS_GREEN";
      
      private static const CHANNELS_BLUE:String = "CHANNELS_BLUE";
      
      private static const CHANNELS_SATURATED:String = "CHANNELS_SATURATED";
      
      private static const const_1230:String = "Default";
      
      private static const const_1231:int = 2;
      
      private static const const_1229:String = AvatarSetType.const_34;
       
      
      protected var _structure:AvatarStructure;
      
      protected var _scale:String;
      
      protected var var_87:int;
      
      protected var var_269:IActiveActionData;
      
      protected var var_732:Boolean;
      
      private var var_918:IActiveActionData;
      
      private var _assets:AssetAliasCollection;
      
      private var var_260:AvatarImageCache;
      
      private var var_555:int = 0;
      
      private var var_1536:int = 0;
      
      private var var_581:AvatarFigureContainer;
      
      private var var_554:Boolean;
      
      private var var_190:Array;
      
      private var var_530:IAvatarDataContainer;
      
      private var var_314:Array;
      
      private var var_44:BitmapData;
      
      private var var_814:Boolean;
      
      private var var_686:Array;
      
      private var var_1267:Boolean = false;
      
      private var var_1374:int = 0;
      
      private var var_1096:int;
      
      private var var_1545:int;
      
      private var var_1373:Array;
      
      private var var_1265:String;
      
      private var var_456:String;
      
      private var var_2795:int;
      
      private var var_2794:int;
      
      public function PetImage(param1:AvatarStructure, param2:AssetAliasCollection, param3:String, param4:String)
      {
         this.var_314 = [];
         this.var_686 = new Array();
         super();
         this.var_554 = true;
         this._structure = param1;
         this._assets = param2;
         this._scale = param4;
         if(this._scale == null)
         {
            this._scale = AvatarScaleType.const_56;
         }
         if(param3 == null || param3 == "")
         {
            param3 = "phd-1-5.pbd-1-5.ptl-1-5";
            Logger.log("Using default pet figure");
         }
         this.var_581 = new AvatarFigureContainer(param3);
         var _loc5_:int = this.var_581.getPartSetId("pbd");
         this.solvePetAvatarTypeAndBreed(_loc5_);
         this.var_1374 = this.var_1096;
         this.var_260 = new AvatarImageCache(this._structure,this,this._assets,this._scale);
         this.setDirection(const_1229,const_1231);
         this.var_314 = new Array();
         this.var_918 = new ActiveActionData(AvatarAction.const_381);
         this.var_918.definition = this._structure.getActionDefinition(const_1230);
         this.resetActions();
      }
      
      public function dispose() : void
      {
         var _loc1_:* = null;
         if(!this.var_732)
         {
            this._structure = null;
            this._assets = null;
            this.var_260 = null;
            this.var_269 = null;
            this.var_581 = null;
            this.var_530 = null;
            this.var_314 = null;
            if(this.var_44)
            {
               this.var_44.dispose();
            }
            _loc1_ = this.getCache();
            if(_loc1_)
            {
               _loc1_.dispose();
               _loc1_ = null;
            }
            this.var_44 = null;
            this.var_686 = null;
            this.var_732 = true;
         }
      }
      
      public function get disposed() : Boolean
      {
         return this.var_732;
      }
      
      public function getFigure() : IAvatarFigureContainer
      {
         return this.var_581;
      }
      
      public function getScale() : String
      {
         return this._scale;
      }
      
      public function getSubType() : int
      {
         return this.var_1374;
      }
      
      public function getPartColor(param1:String) : IPartColor
      {
         return this._structure.getPartColor(this.var_581,param1);
      }
      
      public function setDirection(param1:String, param2:int) : void
      {
         var _loc3_:* = null;
         param2 += this.var_1536;
         if(param2 < AvatarDirectionAngle.const_1005)
         {
            param2 = AvatarDirectionAngle.const_308 + (param2 + 1);
         }
         if(param2 > AvatarDirectionAngle.const_308)
         {
            param2 -= NaN;
         }
         if(param1 == AvatarSetType.const_50)
         {
            if((this.var_87 == 6 || this.var_87 == 0) && param2 == 7)
            {
               param2 = this.var_87;
            }
            _loc3_ = this._structure.renderManager.petDataManager.getPetData(this.var_1374);
            if(_loc3_ != null)
            {
               if(_loc3_.disableHeadTurn)
               {
                  param2 = this.var_87;
               }
            }
         }
         if(this._structure.isMainAvatarSet(param1))
         {
            this.var_87 = param2;
         }
         this.getCache().setDirection(param1,param2);
         this.var_554 = true;
      }
      
      public function setDirectionAngle(param1:String, param2:int) : void
      {
         var _loc3_:int = 0;
         _loc3_ = param2 / 45;
         this.setDirection(param1,_loc3_);
      }
      
      public function getSprites() : Array
      {
         return this.var_190;
      }
      
      public function getCanvasOffsets() : Array
      {
         return this.var_686;
      }
      
      public function getLayerData(param1:ISpriteDataContainer) : IAnimationLayerData
      {
         return this._structure.getBodyPartData(param1.animation.id,this.var_555,param1.id);
      }
      
      public function updateAnimationByFrames(param1:int = 1) : void
      {
         this.var_555 += param1;
         this.var_554 = true;
      }
      
      public function getImage(param1:String, param2:Boolean) : BitmapData
      {
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc12_:* = null;
         var _loc13_:* = null;
         var _loc14_:* = null;
         var _loc15_:* = null;
         var _loc16_:* = false;
         var _loc17_:int = 0;
         var _loc18_:* = null;
         var _loc19_:int = 0;
         var _loc20_:int = 0;
         var _loc21_:int = 0;
         var _loc22_:* = null;
         var _loc23_:* = null;
         if(!this.var_554)
         {
            return this.var_44;
         }
         if(this.var_269 == null)
         {
            return null;
         }
         if(!this.var_1267)
         {
            this.endActionAppends();
         }
         var _loc3_:AvatarImageCache = this.getCache();
         var _loc4_:AvatarCanvas = this._structure.getCanvas(this._scale,this.var_269.definition.geometryType);
         if(this.var_44 == null || _loc4_ != null && (this.var_44.width != _loc4_.width || this.var_44.height != _loc4_.height))
         {
            _loc4_ = this._structure.getCanvas(this._scale,this.var_269.definition.geometryType);
            if(_loc4_ == null)
            {
               return null;
            }
            this.var_44 = new BitmapData(_loc4_.width,_loc4_.height,true,16777215);
         }
         var _loc5_:Array = this._structure.getBodyParts(param1,this.var_269.definition.geometryType,this.var_87);
         this.var_44.lock();
         this.var_44.fillRect(this.var_44.rect,16777215);
         var _loc6_:Point = _loc4_.offset;
         if(_loc6_ == null)
         {
            _loc6_ = new Point(0,0);
         }
         var _loc7_:int = _loc5_.length - 1;
         while(_loc7_ >= 0)
         {
            _loc8_ = _loc5_[_loc7_];
            _loc9_ = _loc3_.getImageContainer(_loc8_,this.var_555);
            if(_loc9_ && _loc9_.image && _loc9_.regPoint)
            {
               _loc10_ = _loc9_.image;
               _loc11_ = _loc9_.regPoint.clone();
               _loc12_ = this.getCache().getBodyPartCache(_loc8_);
               _loc13_ = _loc12_.getAction();
               _loc14_ = _loc13_.definition.assetPartDefinition;
               _loc15_ = this._structure.getParts(_loc8_,this.var_581,_loc13_,"pet",_loc12_.getDirection(),[]);
               _loc16_ = this.var_1374 < 3;
               _loc17_ = !!_loc16_ ? 32 : 67;
               if(this._scale == AvatarScaleType.const_85)
               {
                  _loc17_ = !!_loc16_ ? 6 : 31;
               }
               if(_loc15_.length > 0)
               {
                  _loc18_ = _loc15_[0];
                  _loc19_ = _loc18_.getFrameIndex(this.var_555);
                  _loc20_ = this.var_87;
                  _loc21_ = 1;
                  switch(this.var_87)
                  {
                     case 4:
                        _loc20_ = 2;
                        _loc21_ = -1;
                        break;
                     case 5:
                        _loc20_ = 1;
                        _loc21_ = -1;
                        break;
                     case 6:
                        _loc20_ = 0;
                        _loc21_ = -1;
                  }
                  _loc22_ = this._structure.getPartActionOffset(this.getSubType(),this._scale,_loc8_,_loc14_,_loc19_,_loc20_);
                  if(_loc22_ != null)
                  {
                     _loc11_.x += _loc22_.x * _loc21_;
                     _loc11_.y += _loc22_.y;
                     if(this.var_87 == 7 && _loc12_.getDirection() == 6)
                     {
                        _loc11_.offset(-1 * _loc17_,0);
                     }
                     else if(this.var_87 == 4 && _loc12_.getDirection() == 3)
                     {
                        _loc11_.offset(_loc17_,0);
                     }
                     else if(this.var_87 == 3 && _loc12_.getDirection() == 4)
                     {
                        _loc11_.offset(-1 * _loc17_,0);
                     }
                     else if(this.var_87 == 6 && _loc12_.getDirection() == 7)
                     {
                        _loc11_.offset(_loc17_,0);
                     }
                  }
               }
               this.var_44.copyPixels(_loc10_,_loc10_.rect,_loc11_.add(_loc6_),null,null,true);
            }
            _loc7_--;
         }
         this.var_44.unlock();
         this.var_554 = false;
         if(this.var_530 != null)
         {
            if(this.var_530.paletteIsGrayscale)
            {
               _loc23_ = this.convertToGrayscale(this.var_44);
               if(this.var_44)
               {
                  this.var_44.dispose();
               }
               this.var_44 = _loc23_;
               this.var_44.paletteMap(this.var_44,this.var_44.rect,new Point(0,0),this.var_530.reds,[],[]);
            }
            else
            {
               this.var_44.copyChannel(this.var_44,this.var_44.rect,new Point(0,0),2,8);
            }
         }
         if(this.var_44 && param2)
         {
            return this.var_44.clone();
         }
         return this.var_44;
      }
      
      public function getCroppedImage(param1:String) : BitmapData
      {
         var _loc6_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc12_:* = null;
         var _loc13_:* = null;
         var _loc14_:* = null;
         var _loc15_:* = null;
         var _loc16_:* = null;
         var _loc17_:int = 0;
         var _loc18_:* = null;
         var _loc19_:* = null;
         var _loc20_:int = 0;
         var _loc21_:int = 0;
         var _loc22_:int = 0;
         var _loc23_:* = null;
         if(this.var_269 == null)
         {
            return null;
         }
         var _loc2_:AvatarImageCache = this.getCache();
         var _loc3_:AvatarCanvas = this._structure.getCanvas(this._scale,this.var_269.definition.geometryType);
         if(_loc3_ == null)
         {
            return null;
         }
         var _loc4_:BitmapData = new BitmapData(_loc3_.width,_loc3_.height,true,16777215);
         var _loc5_:Array = this._structure.getBodyParts(param1,this.var_269.definition.geometryType,this.var_87);
         var _loc7_:int = _loc5_.length - 1;
         while(_loc7_ >= 0)
         {
            _loc9_ = _loc5_[_loc7_];
            _loc10_ = _loc2_.getImageContainer(_loc9_,this.var_555);
            if(_loc10_ != null)
            {
               _loc11_ = _loc10_.image;
               if(_loc11_ == null)
               {
                  _loc4_.dispose();
                  return null;
               }
               _loc12_ = _loc10_.regPoint.clone();
               _loc13_ = this.getCache().getBodyPartCache(_loc9_);
               _loc14_ = _loc13_.getAction();
               _loc15_ = _loc14_.definition.assetPartDefinition;
               _loc16_ = this._structure.getParts(_loc9_,this.var_581,_loc14_,"pet",_loc13_.getDirection(),[]);
               _loc17_ = 32;
               if(this._scale == AvatarScaleType.const_85)
               {
                  _loc17_ = 6;
               }
               if(_loc16_.length > 0)
               {
                  _loc19_ = _loc16_[0];
                  _loc20_ = _loc19_.getFrameIndex(this.var_555);
                  _loc21_ = this.var_87;
                  _loc22_ = 1;
                  switch(this.var_87)
                  {
                     case 4:
                        _loc21_ = 2;
                        _loc22_ = -1;
                        break;
                     case 5:
                        _loc21_ = 1;
                        _loc22_ = -1;
                        break;
                     case 6:
                        _loc21_ = 0;
                        _loc22_ = -1;
                  }
                  _loc23_ = this._structure.getPartActionOffset(this.getSubType(),this._scale,_loc9_,_loc15_,_loc20_,_loc21_);
                  if(_loc23_ != null)
                  {
                     _loc12_.x += _loc23_.x * _loc22_;
                     _loc12_.y += _loc23_.y;
                     if(this.var_87 == 7 && _loc13_.getDirection() == 6)
                     {
                        _loc12_.offset(-1 * _loc17_,0);
                     }
                     else if(this.var_87 == 4 && _loc13_.getDirection() == 3)
                     {
                        _loc12_.offset(_loc17_,0);
                     }
                     else if(this.var_87 == 3 && _loc13_.getDirection() == 4)
                     {
                        _loc12_.offset(-1 * _loc17_,0);
                     }
                     else if(this.var_87 == 6 && _loc13_.getDirection() == 7)
                     {
                        _loc12_.offset(_loc17_,0);
                     }
                  }
               }
               _loc4_.copyPixels(_loc11_,_loc11_.rect,_loc12_,null,null,true);
               _loc18_ = new Rectangle(_loc12_.x,_loc12_.y,_loc11_.width,_loc11_.height);
               if(_loc6_ == null)
               {
                  _loc6_ = _loc18_;
               }
               else
               {
                  _loc6_ = _loc6_.union(_loc18_);
               }
            }
            _loc7_--;
         }
         if(_loc6_ == null)
         {
            _loc6_ = new Rectangle(0,0,1,1);
         }
         var _loc8_:BitmapData = new BitmapData(_loc6_.width,_loc6_.height,true,16777215);
         _loc8_.copyPixels(_loc4_,_loc6_,new Point(0,0),null,null,true);
         _loc4_.dispose();
         return _loc8_;
      }
      
      public function getAsset(param1:String) : BitmapDataAsset
      {
         return this._assets.getAssetByName(param1) as BitmapDataAsset;
      }
      
      public function getDirection() : int
      {
         return this.var_87;
      }
      
      public function initActionAppends() : void
      {
         this.var_314 = new Array();
         this.var_1267 = false;
         this.var_456 = "";
      }
      
      public function endActionAppends() : void
      {
         this.sortActions();
         this.resetActions();
         this.setActionsToParts();
      }
      
      public function appendAction(param1:String, ... rest) : Boolean
      {
         var _loc3_:* = null;
         this.var_1267 = false;
         if(rest != null && rest.length > 0)
         {
            _loc3_ = rest[0];
         }
         this.var_456 = this.var_456 + param1 + _loc3_;
         switch(param1)
         {
            case AvatarAction.const_354:
               switch(_loc3_)
               {
                  case "wav":
                     this.addActionData("wave");
                     break;
                  case AvatarAction.const_656:
                  case AvatarAction.const_522:
                  case AvatarAction.const_704:
                  case AvatarAction.const_381:
                  case AvatarAction.const_1182:
                  case AvatarAction.const_1026:
                  case AvatarAction.const_1477:
                  case AvatarAction.const_1474:
                  case AvatarAction.const_1564:
                  case AvatarAction.const_1078:
                  case AvatarAction.const_1055:
                  case AvatarAction.const_1421:
                  case AvatarAction.const_1410:
                  case AvatarAction.const_1133:
                  case AvatarAction.const_883:
                     this.addActionData(_loc3_);
                     break;
                  default:
                     this.errorThis("appendAction() >> UNKNOWN POSTURE TYPE: " + _loc3_);
               }
               break;
            case AvatarAction.const_324:
               switch(_loc3_)
               {
                  case AvatarAction.const_1128:
                  case AvatarAction.const_866:
                  case AvatarAction.const_507:
                  case AvatarAction.const_624:
                  case AvatarAction.const_680:
                  case AvatarAction.const_1190:
                  case AvatarAction.const_1049:
                  case AvatarAction.const_1054:
                  case AvatarAction.const_1181:
                  case AvatarAction.const_1009:
                     this.addActionData(_loc3_);
                     break;
                  default:
                     this.errorThis("appendAction() >> UNKNOWN GESTURE TYPE: " + _loc3_);
               }
               break;
            case AvatarAction.const_283:
            case AvatarAction.const_253:
            case AvatarAction.const_296:
            case AvatarAction.const_526:
               this.addActionData(param1,_loc3_);
               break;
            default:
               this.errorThis("appendAction() >> UNKNOWN ACTION TYPE: " + param1);
         }
         return true;
      }
      
      private function addActionData(param1:String, param2:String = "") : void
      {
         var _loc3_:* = null;
         if(this.var_314 == null)
         {
            this.var_314 = new Array();
         }
         var _loc4_:int = 0;
         while(_loc4_ < this.var_314.length)
         {
            _loc3_ = this.var_314[_loc4_];
            if(_loc3_.actionType == param1 && _loc3_.actionParameter == param2)
            {
               return;
            }
            _loc4_++;
         }
         this.var_314.push(new ActiveActionData(param1,param2));
      }
      
      public function isAnimating() : Boolean
      {
         return this.var_814;
      }
      
      private function resetActions() : Boolean
      {
         this.var_814 = false;
         this.var_190 = [];
         this.var_530 = null;
         this.var_1536 = 0;
         this.var_269 = this.var_918;
         this.var_269.definition = this.var_918.definition;
         this.setActionToParts(this.var_918);
         this.getCache().resetBodyPartCache(this.var_918);
         return true;
      }
      
      private function sortActions() : void
      {
         this.var_1267 = true;
         if(this.var_1265 == this.var_456)
         {
            return;
         }
         this.var_1265 = this.var_456;
         this.var_1373 = this._structure.sortActions(this.var_314);
         if(this.var_1373 == null)
         {
            this.var_686 = new Array(0,0,0);
         }
         else
         {
            this.var_686 = this._structure.getCanvasOffsets(this.var_1373,this._scale,this.var_87);
         }
      }
      
      private function setActionsToParts() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         for each(_loc1_ in this.var_1373)
         {
            if(!(!_loc1_ || !_loc1_.definition))
            {
               if(_loc1_.definition.isAnimation && _loc1_.actionParameter == "")
               {
                  _loc1_.actionParameter = "1";
               }
               this.setActionToParts(_loc1_);
               if(_loc1_.definition.isAnimation)
               {
                  this.var_814 = true;
                  _loc2_ = this._structure.getAnimation(_loc1_.definition.state + "." + _loc1_.actionParameter);
                  if(_loc2_ != null)
                  {
                     this.var_190 = this.var_190.concat(_loc2_.spriteData);
                     if(_loc2_.hasDirectionData())
                     {
                        this.var_1536 = _loc2_.directionData.offset;
                     }
                     if(_loc2_.hasAvatarData())
                     {
                        this.var_530 = _loc2_.avatarData;
                     }
                  }
               }
               if(_loc1_.actionType == AvatarAction.const_340)
               {
                  this.var_814 = true;
               }
               if(_loc1_.actionType == AvatarAction.const_253)
               {
                  this.var_814 = true;
               }
               if(_loc1_.actionType == AvatarAction.const_283)
               {
                  this.var_814 = true;
               }
            }
         }
      }
      
      private function getCache() : AvatarImageCache
      {
         if(this.var_260 == null)
         {
            this.var_260 = new AvatarImageCache(this._structure,this,this._assets,this._scale);
         }
         return this.var_260;
      }
      
      private function setActionToParts(param1:IActiveActionData) : void
      {
         if(param1 == null)
         {
            return;
         }
         if(param1.definition.assetPartDefinition == "")
         {
            return;
         }
         if(param1.definition.isMain)
         {
            this.var_269 = param1;
            this.getCache().setGeometryType(param1.definition.geometryType);
         }
         this.getCache().setAction(param1,getTimer());
         this.var_554 = true;
      }
      
      public function get avatarSpriteData() : IAvatarDataContainer
      {
         return this.var_530;
      }
      
      private function convertToGrayscale(param1:BitmapData, param2:String = "CHANNELS_EQUAL") : BitmapData
      {
         var _loc3_:* = 0.33;
         var _loc4_:* = 0.33;
         var _loc5_:* = 0.33;
         switch(param2)
         {
            case "CHANNELS_UNIQUE":
               _loc3_ = 0.3;
               _loc4_ = 0.59;
               _loc5_ = 0.11;
               break;
            case "CHANNELS_RED":
               _loc3_ = 1;
               _loc4_ = 0;
               _loc5_ = 0;
               break;
            case "CHANNELS_GREEN":
               _loc3_ = 0;
               _loc4_ = 1;
               _loc5_ = 0;
               break;
            case "CHANNELS_BLUE":
               _loc3_ = 0;
               _loc4_ = 0;
               _loc5_ = 1;
               break;
            case "CHANNELS_DESATURATED":
               _loc3_ = 0.3086;
               _loc4_ = 0.6094;
               _loc5_ = 0.082;
         }
         var _loc7_:Array = [_loc3_,_loc4_,_loc5_,0,0,_loc3_,_loc4_,_loc5_,0,0,_loc3_,_loc4_,_loc5_,0,0,0,0,0,1,0];
         var _loc8_:ColorMatrixFilter = new ColorMatrixFilter(_loc7_);
         var _loc9_:BitmapData = new BitmapData(param1.width,param1.height,param1.transparent,4294967295);
         _loc9_.copyPixels(param1,param1.rect,new Point(0,0),null,null,false);
         _loc9_.applyFilter(_loc9_,_loc9_.rect,new Point(0,0),_loc8_);
         return _loc9_;
      }
      
      private function errorThis(param1:String) : void
      {
         Logger.log("[PetImageError] " + param1);
      }
      
      private function logThis(param1:String) : void
      {
      }
      
      private function solvePetAvatarTypeAndBreed(param1:int) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         this.var_1096 = 0;
         this.var_1545 = 0;
         var _loc2_:ISetType = this._structure.figureData.getSetType("pbd");
         if(_loc2_ != null)
         {
            _loc3_ = _loc2_.getPartSet(param1);
            if(_loc3_ != null)
            {
               for each(_loc4_ in _loc3_.parts)
               {
                  if(_loc4_.type == "pbd")
                  {
                     this.var_1096 = _loc4_.id;
                     this.var_1545 = _loc4_.breed;
                     break;
                  }
               }
            }
         }
      }
      
      public function get petType() : int
      {
         return this.var_1096;
      }
      
      public function get petBreed() : int
      {
         return this.var_1545;
      }
      
      public function isPlaceholder() : Boolean
      {
         return false;
      }
   }
}
