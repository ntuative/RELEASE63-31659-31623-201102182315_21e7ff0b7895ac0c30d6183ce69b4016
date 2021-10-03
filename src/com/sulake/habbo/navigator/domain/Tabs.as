package com.sulake.habbo.navigator.domain
{
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.mainview.MainViewCtrl;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.EventsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.MyRoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.OfficialTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.RoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.SearchTabPageDecorator;
   
   public class Tabs
   {
      
      public static const const_391:int = 1;
      
      public static const const_258:int = 2;
      
      public static const const_320:int = 3;
      
      public static const const_333:int = 4;
      
      public static const const_217:int = 5;
      
      public static const const_342:int = 1;
      
      public static const const_802:int = 2;
      
      public static const const_739:int = 3;
      
      public static const const_698:int = 4;
      
      public static const const_269:int = 5;
      
      public static const const_867:int = 6;
      
      public static const const_840:int = 7;
      
      public static const const_219:int = 8;
      
      public static const const_345:int = 9;
      
      public static const const_1785:int = 10;
      
      public static const const_882:int = 11;
      
      public static const const_523:int = 12;
       
      
      private var var_424:Array;
      
      private var _navigator:HabboNavigator;
      
      public function Tabs(param1:HabboNavigator)
      {
         super();
         this._navigator = param1;
         this.var_424 = new Array();
         this.var_424.push(new Tab(this._navigator,const_391,const_523,new EventsTabPageDecorator(this._navigator),MainViewCtrl.const_496));
         this.var_424.push(new Tab(this._navigator,const_258,const_342,new RoomsTabPageDecorator(this._navigator),MainViewCtrl.const_496));
         this.var_424.push(new Tab(this._navigator,const_333,const_882,new OfficialTabPageDecorator(this._navigator),MainViewCtrl.const_1129));
         this.var_424.push(new Tab(this._navigator,const_320,const_269,new MyRoomsTabPageDecorator(this._navigator),MainViewCtrl.const_496));
         this.var_424.push(new Tab(this._navigator,const_217,const_219,new SearchTabPageDecorator(this._navigator),MainViewCtrl.const_764));
         this.setSelectedTab(const_391);
      }
      
      public function onFrontPage() : Boolean
      {
         return this.getSelected().id == const_333;
      }
      
      public function get tabs() : Array
      {
         return this.var_424;
      }
      
      public function setSelectedTab(param1:int) : void
      {
         this.clearSelected();
         this.getTab(param1).selected = true;
      }
      
      public function getSelected() : Tab
      {
         var _loc1_:* = null;
         for each(_loc1_ in this.var_424)
         {
            if(_loc1_.selected)
            {
               return _loc1_;
            }
         }
         return null;
      }
      
      private function clearSelected() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in this.var_424)
         {
            _loc1_.selected = false;
         }
      }
      
      public function getTab(param1:int) : Tab
      {
         var _loc2_:* = null;
         for each(_loc2_ in this.var_424)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
   }
}
