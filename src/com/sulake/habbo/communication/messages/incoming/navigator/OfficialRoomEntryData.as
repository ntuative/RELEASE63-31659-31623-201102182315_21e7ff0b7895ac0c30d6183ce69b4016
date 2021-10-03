package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class OfficialRoomEntryData implements IDisposable
   {
      
      public static const const_1064:int = 1;
      
      public static const const_878:int = 2;
      
      public static const const_797:int = 3;
      
      public static const const_1380:int = 4;
       
      
      private var _index:int;
      
      private var var_2611:String;
      
      private var var_2610:String;
      
      private var var_2609:Boolean;
      
      private var var_2607:String;
      
      private var var_961:String;
      
      private var var_2608:int;
      
      private var var_2007:int;
      
      private var _type:int;
      
      private var var_2005:String;
      
      private var var_941:GuestRoomData;
      
      private var var_940:PublicRoomData;
      
      private var _open:Boolean;
      
      private var _disposed:Boolean;
      
      public function OfficialRoomEntryData(param1:IMessageDataWrapper)
      {
         super();
         this._index = param1.readInteger();
         this.var_2611 = param1.readString();
         this.var_2610 = param1.readString();
         this.var_2609 = param1.readInteger() == 1;
         this.var_2607 = param1.readString();
         this.var_961 = param1.readString();
         this.var_2608 = param1.readInteger();
         this.var_2007 = param1.readInteger();
         this._type = param1.readInteger();
         if(this._type == const_1064)
         {
            this.var_2005 = param1.readString();
         }
         else if(this._type == const_797)
         {
            this.var_940 = new PublicRoomData(param1);
         }
         else if(this._type == const_878)
         {
            this.var_941 = new GuestRoomData(param1);
         }
         else
         {
            this._open = param1.readBoolean();
         }
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
         if(this.var_941 != null)
         {
            this.var_941.dispose();
            this.var_941 = null;
         }
         if(this.var_940 != null)
         {
            this.var_940.dispose();
            this.var_940 = null;
         }
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get index() : int
      {
         return this._index;
      }
      
      public function get popupCaption() : String
      {
         return this.var_2611;
      }
      
      public function get popupDesc() : String
      {
         return this.var_2610;
      }
      
      public function get showDetails() : Boolean
      {
         return this.var_2609;
      }
      
      public function get picText() : String
      {
         return this.var_2607;
      }
      
      public function get picRef() : String
      {
         return this.var_961;
      }
      
      public function get folderId() : int
      {
         return this.var_2608;
      }
      
      public function get tag() : String
      {
         return this.var_2005;
      }
      
      public function get userCount() : int
      {
         return this.var_2007;
      }
      
      public function get guestRoomData() : GuestRoomData
      {
         return this.var_941;
      }
      
      public function get publicRoomData() : PublicRoomData
      {
         return this.var_940;
      }
      
      public function get open() : Boolean
      {
         return this._open;
      }
      
      public function toggleOpen() : void
      {
         this._open = !this._open;
      }
      
      public function get maxUsers() : int
      {
         if(this.type == const_1064)
         {
            return 0;
         }
         if(this.type == const_878)
         {
            return this.var_941.maxUserCount;
         }
         if(this.type == const_797)
         {
            return this.var_940.maxUsers;
         }
         return 0;
      }
   }
}
