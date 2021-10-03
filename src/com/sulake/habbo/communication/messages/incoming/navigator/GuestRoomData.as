package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class GuestRoomData implements IDisposable
   {
       
      
      private var var_374:int;
      
      private var var_658:Boolean;
      
      private var var_896:String;
      
      private var _ownerName:String;
      
      private var var_2009:int;
      
      private var var_2007:int;
      
      private var var_2008:int;
      
      private var var_1831:String;
      
      private var var_2010:int;
      
      private var var_2013:Boolean;
      
      private var var_744:int;
      
      private var var_1301:int;
      
      private var var_2012:String;
      
      private var var_803:Array;
      
      private var var_2011:RoomThumbnailData;
      
      private var var_2014:Boolean;
      
      private var _disposed:Boolean;
      
      public function GuestRoomData(param1:IMessageDataWrapper)
      {
         var _loc4_:* = null;
         this.var_803 = new Array();
         super();
         this.var_374 = param1.readInteger();
         this.var_658 = param1.readBoolean();
         this.var_896 = param1.readString();
         this._ownerName = param1.readString();
         this.var_2009 = param1.readInteger();
         this.var_2007 = param1.readInteger();
         this.var_2008 = param1.readInteger();
         this.var_1831 = param1.readString();
         this.var_2010 = param1.readInteger();
         this.var_2013 = param1.readBoolean();
         this.var_744 = param1.readInteger();
         this.var_1301 = param1.readInteger();
         this.var_2012 = param1.readString();
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = param1.readString();
            this.var_803.push(_loc4_);
            _loc3_++;
         }
         this.var_2011 = new RoomThumbnailData(param1);
         this.var_2014 = param1.readBoolean();
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
         this.var_803 = null;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get flatId() : int
      {
         return this.var_374;
      }
      
      public function get event() : Boolean
      {
         return this.var_658;
      }
      
      public function get roomName() : String
      {
         return this.var_896;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get doorMode() : int
      {
         return this.var_2009;
      }
      
      public function get userCount() : int
      {
         return this.var_2007;
      }
      
      public function get maxUserCount() : int
      {
         return this.var_2008;
      }
      
      public function get description() : String
      {
         return this.var_1831;
      }
      
      public function get srchSpecPrm() : int
      {
         return this.var_2010;
      }
      
      public function get allowTrading() : Boolean
      {
         return this.var_2013;
      }
      
      public function get score() : int
      {
         return this.var_744;
      }
      
      public function get categoryId() : int
      {
         return this.var_1301;
      }
      
      public function get eventCreationTime() : String
      {
         return this.var_2012;
      }
      
      public function get tags() : Array
      {
         return this.var_803;
      }
      
      public function get thumbnail() : RoomThumbnailData
      {
         return this.var_2011;
      }
      
      public function get allowPets() : Boolean
      {
         return this.var_2014;
      }
   }
}
