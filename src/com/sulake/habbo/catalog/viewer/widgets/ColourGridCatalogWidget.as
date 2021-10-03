package com.sulake.habbo.catalog.viewer.widgets
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IItemGridWindow;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetColourIndexEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetColoursEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetMultiColoursEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.WidgetEvent;
   import flash.display.BitmapData;
   import flash.geom.ColorTransform;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class ColourGridCatalogWidget extends CatalogWidget implements ICatalogWidget
   {
       
      
      private var var_965:Array;
      
      private var var_420:IItemGridWindow;
      
      private var var_1876:XML;
      
      private var var_632:BitmapData;
      
      private var var_966:BitmapData;
      
      private var var_848:BitmapData;
      
      private var var_351:IWindowContainer;
      
      public function ColourGridCatalogWidget(param1:IWindowContainer)
      {
         super(param1);
      }
      
      override public function dispose() : void
      {
         this.var_420.destroyGridItems();
         this.var_420.dispose();
         this.var_420 = null;
         this.var_1876 = null;
         this.var_351 = null;
         events.removeEventListener(WidgetEvent.CWE_COLOUR_ARRAY,this.onAvailableColours);
         events.removeEventListener(WidgetEvent.CWE_MULTI_COLOUR_ARRAY,this.onAvailableMultiColours);
         super.dispose();
      }
      
      override public function init() : Boolean
      {
         if(!super.init())
         {
            return false;
         }
         this.var_420 = _window.findChildByName("colourGrid") as IItemGridWindow;
         var _loc1_:XmlAsset = page.viewer.catalog.assets.getAssetByName("color_chooser_cell") as XmlAsset;
         this.var_1876 = _loc1_.content as XML;
         events.addEventListener(WidgetEvent.CWE_COLOUR_ARRAY,this.onAvailableColours);
         events.addEventListener(WidgetEvent.CWE_MULTI_COLOUR_ARRAY,this.onAvailableMultiColours);
         return true;
      }
      
      private function onAvailableColours(param1:CatalogWidgetColoursEvent) : void
      {
         var _loc2_:int = 0;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         this.var_965 = [];
         for each(_loc2_ in param1.colours)
         {
            this.var_965.push([_loc2_]);
         }
         _loc3_ = page.viewer.catalog.assets.getAssetByName(param1.backgroundAssetName) as BitmapDataAsset;
         this.var_632 = _loc3_.content as BitmapData;
         _loc4_ = page.viewer.catalog.assets.getAssetByName(param1.colourAssetName) as BitmapDataAsset;
         this.var_966 = _loc4_.content as BitmapData;
         _loc5_ = page.viewer.catalog.assets.getAssetByName(param1.chosenColourAssetName) as BitmapDataAsset;
         this.var_848 = _loc5_.content as BitmapData;
         this.populateColourGrid();
         this.select(this.var_420.getGridItemAt(0) as IWindowContainer);
      }
      
      private function onAvailableMultiColours(param1:CatalogWidgetMultiColoursEvent) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         this.var_965 = [];
         for each(_loc2_ in param1.colours)
         {
            this.var_965.push(_loc2_.slice());
         }
         _loc3_ = page.viewer.catalog.assets.getAssetByName(param1.backgroundAssetName) as BitmapDataAsset;
         this.var_632 = _loc3_.content as BitmapData;
         _loc4_ = page.viewer.catalog.assets.getAssetByName(param1.colourAssetName) as BitmapDataAsset;
         this.var_966 = _loc4_.content as BitmapData;
         _loc5_ = page.viewer.catalog.assets.getAssetByName(param1.chosenColourAssetName) as BitmapDataAsset;
         this.var_848 = _loc5_.content as BitmapData;
         this.populateColourGrid();
         this.select(this.var_420.getGridItemAt(0) as IWindowContainer);
      }
      
      private function select(param1:IWindowContainer) : void
      {
         var _loc2_:* = null;
         Logger.log("[ColourGridCatalogWidget] Select: " + param1);
         if(this.var_351 != null)
         {
            _loc2_ = this.var_351.getChildByName("chosen");
            if(_loc2_ != null)
            {
               _loc2_.visible = false;
            }
         }
         this.var_351 = param1;
         if(this.var_351 != null)
         {
            _loc2_ = this.var_351.getChildByName("chosen");
         }
         if(_loc2_ != null)
         {
            _loc2_.visible = true;
         }
      }
      
      private function populateColourGrid() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = 0;
         var _loc7_:* = 0;
         var _loc8_:* = 0;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         Logger.log("[ColourGridCatalogWidget] Display colors: " + [this.var_965.length,this.var_420.numGridItems]);
         this.var_420.destroyGridItems();
         this.var_351 = null;
         for each(_loc1_ in this.var_965)
         {
            if(_loc1_.length > 0)
            {
               _loc2_ = page.viewer.catalog.windowManager.buildFromXML(this.var_1876) as IWindowContainer;
               _loc2_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onClick);
               _loc2_.background = true;
               _loc2_.color = 4294967295;
               _loc2_.width = this.var_632.width;
               _loc2_.height = this.var_632.height;
               this.var_420.addGridItem(_loc2_);
               _loc3_ = _loc2_.findChildByTag("BG_BORDER") as IBitmapWrapperWindow;
               if(_loc3_ != null)
               {
                  _loc3_.bitmap = new BitmapData(this.var_632.width,this.var_632.height,true,0);
                  _loc3_.bitmap.copyPixels(this.var_632,this.var_632.rect,new Point(0,0));
               }
               _loc4_ = _loc2_.findChildByTag("COLOR_IMAGE") as IBitmapWrapperWindow;
               if(_loc4_ != null)
               {
                  _loc4_.bitmap = new BitmapData(this.var_966.width,this.var_966.height,true,0);
                  _loc6_ = 255;
                  _loc7_ = 255;
                  _loc8_ = 255;
                  _loc9_ = null;
                  _loc10_ = null;
                  _loc11_ = _loc1_[0];
                  if(_loc11_ >= 0)
                  {
                     _loc6_ = uint(_loc11_ >> 16 & 255);
                     _loc7_ = uint(_loc11_ >> 8 & 255);
                     _loc8_ = uint(_loc11_ >> 0 & 255);
                  }
                  _loc9_ = this.var_966.clone();
                  _loc9_.colorTransform(_loc9_.rect,new ColorTransform(_loc6_ / 255,_loc7_ / 255,_loc8_ / 255));
                  if(_loc1_.length > 1)
                  {
                     _loc12_ = _loc1_[1];
                     if(_loc12_ >= 0)
                     {
                        _loc6_ = uint(_loc12_ >> 16 & 255);
                        _loc7_ = uint(_loc12_ >> 8 & 255);
                        _loc8_ = uint(_loc12_ >> 0 & 255);
                     }
                     _loc10_ = this.var_966.clone();
                     _loc10_.colorTransform(_loc10_.rect,new ColorTransform(_loc6_ / 255,_loc7_ / 255,_loc8_ / 255));
                  }
                  _loc4_.bitmap.copyPixels(_loc9_,_loc9_.rect,new Point(0,0));
                  _loc9_.dispose();
                  if(_loc10_ != null)
                  {
                     _loc13_ = _loc10_.width / 2;
                     _loc4_.bitmap.copyPixels(_loc10_,new Rectangle(_loc13_,0,_loc10_.width - _loc13_,_loc10_.height),new Point(_loc10_.width / 2,0));
                     _loc10_.dispose();
                  }
               }
               _loc5_ = _loc2_.findChildByTag("COLOR_CHOSEN") as IBitmapWrapperWindow;
               if(_loc5_ != null)
               {
                  _loc5_.bitmap = new BitmapData(this.var_848.width,this.var_848.height,true,16777215);
                  _loc5_.bitmap.copyPixels(this.var_848,this.var_848.rect,new Point(0,0),null,null,true);
                  _loc5_.visible = false;
               }
            }
         }
      }
      
      private function onClick(param1:WindowMouseEvent) : void
      {
         this.select(param1.target as IWindowContainer);
         var _loc2_:int = this.var_420.getGridItemIndex(param1.target as IWindow);
         events.dispatchEvent(new CatalogWidgetColourIndexEvent(_loc2_));
      }
   }
}
