package com.sulake.habbo.room.utils
{
   public class RoomInstanceData
   {
       
      
      private var _roomId:int = 0;
      
      private var _roomCategory:int = 0;
      
      private var var_778:TileHeightMap = null;
      
      private var var_1188:LegacyWallGeometry = null;
      
      private var var_1189:RoomCamera = null;
      
      private var var_777:SelectedRoomObjectData = null;
      
      private var var_779:SelectedRoomObjectData = null;
      
      private var var_2673:String = null;
      
      public function RoomInstanceData(param1:int, param2:int)
      {
         super();
         this._roomId = param1;
         this._roomCategory = param2;
         this.var_1188 = new LegacyWallGeometry();
         this.var_1189 = new RoomCamera();
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function get roomCategory() : int
      {
         return this._roomCategory;
      }
      
      public function get tileHeightMap() : TileHeightMap
      {
         return this.var_778;
      }
      
      public function set tileHeightMap(param1:TileHeightMap) : void
      {
         if(this.var_778 != null)
         {
            this.var_778.dispose();
         }
         this.var_778 = param1;
      }
      
      public function get legacyGeometry() : LegacyWallGeometry
      {
         return this.var_1188;
      }
      
      public function get roomCamera() : RoomCamera
      {
         return this.var_1189;
      }
      
      public function get worldType() : String
      {
         return this.var_2673;
      }
      
      public function set worldType(param1:String) : void
      {
         this.var_2673 = param1;
      }
      
      public function get selectedObject() : SelectedRoomObjectData
      {
         return this.var_777;
      }
      
      public function set selectedObject(param1:SelectedRoomObjectData) : void
      {
         if(this.var_777 != null)
         {
            this.var_777.dispose();
         }
         this.var_777 = param1;
      }
      
      public function get placedObject() : SelectedRoomObjectData
      {
         return this.var_779;
      }
      
      public function set placedObject(param1:SelectedRoomObjectData) : void
      {
         if(this.var_779 != null)
         {
            this.var_779.dispose();
         }
         this.var_779 = param1;
      }
      
      public function dispose() : void
      {
         if(this.var_778 != null)
         {
            this.var_778.dispose();
            this.var_778 = null;
         }
         if(this.var_1188 != null)
         {
            this.var_1188.dispose();
            this.var_1188 = null;
         }
         if(this.var_1189 != null)
         {
            this.var_1189.dispose();
            this.var_1189 = null;
         }
         if(this.var_777 != null)
         {
            this.var_777.dispose();
            this.var_777 = null;
         }
         if(this.var_779 != null)
         {
            this.var_779.dispose();
            this.var_779 = null;
         }
      }
   }
}
