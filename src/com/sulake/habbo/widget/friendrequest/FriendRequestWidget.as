package com.sulake.habbo.widget.friendrequest
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.IUpdateReceiver;
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.room.object.RoomObjectTypeEnum;
   import com.sulake.habbo.widget.RoomWidgetBase;
   import com.sulake.habbo.widget.events.RoomWidgetFriendRequestUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUserLocationUpdateEvent;
   import com.sulake.habbo.widget.messages.RoomWidgetFriendRequestMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetGetUserLocationMessage;
   import com.sulake.habbo.window.IHabboWindowManager;
   import flash.events.IEventDispatcher;
   
   public class FriendRequestWidget extends RoomWidgetBase implements IUpdateReceiver
   {
       
      
      private var _component:Component;
      
      private var _requests:Map;
      
      private var var_732:Boolean = false;
      
      public function FriendRequestWidget(param1:IHabboWindowManager, param2:IAssetLibrary, param3:IHabboLocalizationManager, param4:Component)
      {
         super(param1,param2,param3);
         this._component = param4;
         this._requests = new Map();
      }
      
      public function get disposed() : Boolean
      {
         return this.var_732;
      }
      
      override public function dispose() : void
      {
         var _loc1_:* = null;
         if(this.var_732)
         {
            return;
         }
         super.dispose();
         if(this._component)
         {
            this._component.removeUpdateReceiver(this);
            this._component = null;
         }
         if(this._requests)
         {
            for each(_loc1_ in this._requests)
            {
               _loc1_.dispose();
               _loc1_ = null;
            }
            this._requests.dispose();
            this._requests = null;
         }
         this.var_732 = true;
      }
      
      override public function registerUpdateEvents(param1:IEventDispatcher) : void
      {
         if(!param1)
         {
            return;
         }
         param1.addEventListener(RoomWidgetFriendRequestUpdateEvent.const_542,this.eventHandler);
         param1.addEventListener(RoomWidgetFriendRequestUpdateEvent.const_555,this.eventHandler);
         super.registerUpdateEvents(param1);
      }
      
      override public function unregisterUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.removeEventListener(RoomWidgetFriendRequestUpdateEvent.const_542,this.eventHandler);
         param1.removeEventListener(RoomWidgetFriendRequestUpdateEvent.const_555,this.eventHandler);
      }
      
      private function eventHandler(param1:RoomWidgetFriendRequestUpdateEvent) : void
      {
         if(!param1)
         {
            return;
         }
         switch(param1.type)
         {
            case RoomWidgetFriendRequestUpdateEvent.const_542:
               this.addRequest(param1.requestId,new FriendRequestDialog(this,param1.requestId,param1.userId,param1.userName));
               break;
            case RoomWidgetFriendRequestUpdateEvent.const_555:
               this.removeRequest(param1.requestId);
         }
         this.checkUpdateNeed();
      }
      
      public function checkUpdateNeed() : void
      {
         if(!this._component)
         {
            return;
         }
         if(this._requests && this._requests.length > 0)
         {
            this._component.registerUpdateReceiver(this,10);
         }
         else
         {
            this._component.removeUpdateReceiver(this);
         }
      }
      
      public function update(param1:uint) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(!this._requests)
         {
            return;
         }
         for each(_loc2_ in this._requests)
         {
            if(_loc2_)
            {
               _loc3_ = messageListener.processWidgetMessage(new RoomWidgetGetUserLocationMessage(_loc2_.userId,RoomObjectTypeEnum.const_182)) as RoomWidgetUserLocationUpdateEvent;
               if(_loc3_)
               {
                  _loc2_.targetRect = _loc3_.rectangle;
               }
            }
         }
      }
      
      public function acceptRequest(param1:int) : void
      {
         if(!messageListener)
         {
            return;
         }
         messageListener.processWidgetMessage(new RoomWidgetFriendRequestMessage(RoomWidgetFriendRequestMessage.const_814,param1));
         this.removeRequest(param1);
      }
      
      public function declineRequest(param1:int) : void
      {
         if(!messageListener)
         {
            return;
         }
         messageListener.processWidgetMessage(new RoomWidgetFriendRequestMessage(RoomWidgetFriendRequestMessage.const_660,param1));
         this.removeRequest(param1);
      }
      
      public function ignoreRequest(param1:int) : void
      {
         this.removeRequest(param1);
      }
      
      private function addRequest(param1:int, param2:FriendRequestDialog) : void
      {
         if(!this._requests || !param2)
         {
            return;
         }
         this._requests.add(param1,param2);
      }
      
      private function removeRequest(param1:int) : void
      {
         if(!this._requests)
         {
            return;
         }
         var _loc2_:FriendRequestDialog = this._requests.getValue(param1) as FriendRequestDialog;
         if(!_loc2_)
         {
            return;
         }
         this._requests.remove(param1);
         _loc2_.dispose();
         this.checkUpdateNeed();
      }
   }
}
