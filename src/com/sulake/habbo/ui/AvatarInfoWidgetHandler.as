package com.sulake.habbo.ui
{
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
   import com.sulake.habbo.widget.RoomWidgetEnum;
   import com.sulake.habbo.widget.events.RoomWidgetAvatarInfoEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUpdateEvent;
   import com.sulake.habbo.widget.messages.RoomWidgetMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetRoomObjectMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetUserActionMessage;
   import flash.events.Event;
   
   public class AvatarInfoWidgetHandler implements IRoomWidgetHandler
   {
       
      
      private var _disposed:Boolean = false;
      
      private var _container:IRoomWidgetHandlerContainer = null;
      
      public function AvatarInfoWidgetHandler()
      {
         super();
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function dispose() : void
      {
         if(!this._disposed)
         {
            if(this._container)
            {
               if(this._container.toolbar)
               {
                  this._container.toolbar.events.removeEventListener(HabboToolbarEvent.const_38,this.onToolbarClicked);
               }
               this._container = null;
            }
            this._disposed = true;
         }
      }
      
      public function get type() : String
      {
         return RoomWidgetEnum.const_104;
      }
      
      public function set container(param1:IRoomWidgetHandlerContainer) : void
      {
         this._container = param1;
         if(this._container.toolbar)
         {
            this._container.toolbar.events.addEventListener(HabboToolbarEvent.const_38,this.onToolbarClicked);
         }
      }
      
      private function onToolbarClicked(param1:HabboToolbarEvent) : void
      {
         if(param1.iconId == HabboToolbarIconEnum.MEMENU)
         {
            this.dispatchOwnAvatarInfo();
         }
      }
      
      private function dispatchOwnAvatarInfo() : void
      {
         var _loc1_:int = this._container.sessionDataManager.userId;
         var _loc2_:String = this._container.sessionDataManager.userName;
         var _loc3_:* = !this._container.habboHelp.hasChangedName();
         this._container.events.dispatchEvent(new RoomWidgetAvatarInfoEvent(_loc1_,_loc2_,_loc3_));
      }
      
      public function getWidgetMessages() : Array
      {
         var _loc1_:* = [];
         _loc1_.push(RoomWidgetRoomObjectMessage.const_871);
         _loc1_.push(RoomWidgetUserActionMessage.const_722);
         return _loc1_;
      }
      
      public function getProcessedEvents() : Array
      {
         return [];
      }
      
      public function processWidgetMessage(param1:RoomWidgetMessage) : RoomWidgetUpdateEvent
      {
         if(!param1)
         {
            return null;
         }
         switch(param1.type)
         {
            case RoomWidgetRoomObjectMessage.const_871:
               this.dispatchOwnAvatarInfo();
               break;
            case RoomWidgetUserActionMessage.const_722:
               this._container.habboHelp.startNameChange();
         }
         return null;
      }
      
      public function processEvent(param1:Event) : void
      {
      }
      
      public function update() : void
      {
      }
   }
}
