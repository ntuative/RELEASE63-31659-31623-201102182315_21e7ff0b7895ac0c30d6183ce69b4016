package com.sulake.habbo.navigator.inroom
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.IContainerButtonWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   import com.sulake.habbo.communication.messages.incoming.navigator.RoomEventData;
   import com.sulake.habbo.communication.messages.outgoing.navigator.AddFavouriteRoomMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.CanCreateEventMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.DeleteFavouriteRoomMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.RateFlatMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.ToggleStaffPickMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.UpdateNavigatorSettingsMessageComposer;
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.SimpleAlertView;
   import com.sulake.habbo.navigator.TagRenderer;
   import com.sulake.habbo.navigator.Util;
   import com.sulake.habbo.navigator.events.HabboRoomSettingsTrackingEvent;
   import com.sulake.habbo.navigator.roomsettings.IRoomSettingsCtrlOwner;
   import com.sulake.habbo.navigator.roomsettings.RoomSettingsCtrl;
   import com.sulake.habbo.navigator.roomthumbnails.RoomThumbnailCtrl;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
   import com.sulake.habbo.toolbar.events.HabboToolbarSetIconEvent;
   import com.sulake.habbo.toolbar.events.HabboToolbarShowMenuEvent;
   import com.sulake.habbo.utils.HabboWebTools;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class RoomInfoViewCtrl implements IRoomSettingsCtrlOwner
   {
       
      
      private var _navigator:HabboNavigator;
      
      private var _window:IWindowContainer;
      
      private var var_2757:int;
      
      private var var_334:RoomEventViewCtrl;
      
      private var var_240:Timer;
      
      private var var_171:RoomSettingsCtrl;
      
      private var var_241:RoomThumbnailCtrl;
      
      private var var_1093:TagRenderer;
      
      private var var_282:IWindowContainer;
      
      private var var_395:IWindowContainer;
      
      private var var_693:IWindowContainer;
      
      private var var_2272:IWindowContainer;
      
      private var var_2276:IWindowContainer;
      
      private var var_1308:IWindowContainer;
      
      private var var_896:ITextWindow;
      
      private var var_1071:ITextWindow;
      
      private var _ownerName:ITextWindow;
      
      private var var_851:ITextWindow;
      
      private var var_1305:ITextWindow;
      
      private var var_1068:ITextWindow;
      
      private var var_855:ITextWindow;
      
      private var var_1619:ITextWindow;
      
      private var var_239:IWindowContainer;
      
      private var var_852:IWindowContainer;
      
      private var var_1617:IWindowContainer;
      
      private var var_2275:ITextWindow;
      
      private var var_692:ITextWindow;
      
      private var var_2274:IWindow;
      
      private var var_1307:IContainerButtonWindow;
      
      private var var_1306:IContainerButtonWindow;
      
      private var var_1311:IContainerButtonWindow;
      
      private var var_1310:IContainerButtonWindow;
      
      private var var_1312:IContainerButtonWindow;
      
      private var var_1309:IContainerButtonWindow;
      
      private var var_1616:IButtonWindow;
      
      private var var_1620:IButtonWindow;
      
      private var var_1618:IButtonWindow;
      
      private var var_854:IWindowContainer;
      
      private var var_1313:ITextWindow;
      
      private var var_1070:ITextFieldWindow;
      
      private var var_65:IWindowContainer;
      
      private var var_1069:IButtonWindow;
      
      private var var_853:IButtonWindow;
      
      private var var_2273:String;
      
      private var var_2277:String;
      
      public function RoomInfoViewCtrl(param1:HabboNavigator)
      {
         super();
         this._navigator = param1;
         this.var_334 = new RoomEventViewCtrl(this._navigator);
         this.var_171 = new RoomSettingsCtrl(this._navigator,this,true);
         this.var_241 = new RoomThumbnailCtrl(this._navigator);
         this.var_1093 = new TagRenderer(this._navigator);
         this._navigator.roomSettingsCtrls.push(this.var_171);
         this.var_240 = new Timer(6000,1);
         this.var_240.addEventListener(TimerEvent.TIMER,this.hideInfo);
      }
      
      public function dispose() : void
      {
         if(this._navigator.toolbar)
         {
            this._navigator.toolbar.events.removeEventListener(HabboToolbarSetIconEvent.const_99,this.onToolbarIconState);
         }
         if(this.var_240)
         {
            this.var_240.removeEventListener(TimerEvent.TIMER,this.hideInfo);
            this.var_240.reset();
            this.var_240 = null;
         }
      }
      
      public function roomSettingsRefreshNeeded() : void
      {
         this.refresh();
      }
      
      public function startEventEdit() : void
      {
         this.var_240.reset();
         this.var_334.active = true;
         this.var_171.active = false;
         this.var_241.active = false;
         this.reload();
      }
      
      public function startRoomSettingsEdit(param1:int) : void
      {
         this.var_240.reset();
         this.var_171.load(param1);
         this.var_171.active = true;
         this.var_334.active = false;
         this.var_241.active = false;
         this._navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_DEFAULT));
      }
      
      public function backToRoomSettings() : void
      {
         this.var_171.active = true;
         this.var_334.active = false;
         this.var_241.active = false;
         this.reload();
         this._navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_DEFAULT));
      }
      
      public function startThumbnailEdit() : void
      {
         this.var_240.reset();
         this.var_171.active = false;
         this.var_334.active = false;
         this.var_241.active = true;
         this.reload();
         this._navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_THUMBS));
      }
      
      public function close() : void
      {
         this._navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_1117,HabboToolbarIconEnum.ROOMINFO,this._window,false));
         if(this._window == null)
         {
            return;
         }
         this._window.visible = false;
         this._navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_CLOSED));
      }
      
      public function reload() : void
      {
         if(this._window != null && this._window.visible)
         {
            this.refresh();
         }
      }
      
      public function open(param1:Boolean) : void
      {
         this.var_240.reset();
         this.var_334.active = false;
         this.var_171.active = false;
         this.var_241.active = false;
         if(param1)
         {
            this.startRoomSettingsEdit(this._navigator.data.enteredGuestRoom.flatId);
         }
         this.refresh();
         this._window.visible = true;
         this._navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_52,HabboToolbarIconEnum.ROOMINFO,this._window,false));
         this._window.parent.activate();
         this._window.activate();
         if(!param1)
         {
            this.var_240.start();
         }
      }
      
      public function toggle() : void
      {
         this.var_240.reset();
         this.var_334.active = false;
         this.var_171.active = false;
         this.var_241.active = false;
         this.refresh();
         if(!this._window.visible)
         {
            this._navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_52,HabboToolbarIconEnum.ROOMINFO,this._window,false));
            this._window.parent.activate();
         }
         else
         {
            this._navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_544,HabboToolbarIconEnum.ROOMINFO,this._window,false));
         }
      }
      
      private function refresh() : void
      {
         this.prepareWindow();
         this.refreshRoom();
         this.refreshEvent();
         this.refreshEmbed();
         this.refreshButtons();
         Util.moveChildrenToColumn(this._window,["room_info","event_info","embed_info","buttons_container"],0,2);
         this._window.height = Util.getLowestPoint(this._window);
         this._window.y = this._window.desktop.height - this._window.height - 5;
         Logger.log("MAIN: " + this.var_282.rectangle + ", " + this.var_239.rectangle + ", " + this._window.rectangle);
      }
      
      private function refreshRoom() : void
      {
         Util.hideChildren(this.var_282);
         this.var_282.findChildByName("close").visible = true;
         var _loc1_:GuestRoomData = this._navigator.data.enteredGuestRoom;
         var _loc2_:Boolean = _loc1_ != null && _loc1_.flatId == this._navigator.data.homeRoomId;
         this.refreshRoomDetails(_loc1_,_loc2_);
         this.refreshPublicSpaceDetails(this._navigator.data.enteredPublicSpace);
         this.refreshRoomButtons(_loc2_);
         this.var_171.refresh(this.var_282);
         this.var_241.refresh(this.var_282);
         Util.moveChildrenToColumn(this.var_282,["room_details","room_buttons"],0,2);
         this.var_282.height = Util.getLowestPoint(this.var_282);
         this.var_282.visible = true;
         Logger.log("XORP: " + this.var_395.visible + ", " + this.var_1308.visible + ", " + this.var_693.visible + ", " + this.var_693.rectangle + ", " + this.var_282.rectangle);
      }
      
      private function refreshEvent() : void
      {
         Util.hideChildren(this.var_239);
         var _loc1_:RoomEventData = this._navigator.data.roomEventData;
         this.refreshEventDetails(_loc1_);
         this.refreshEventButtons(_loc1_);
         this.var_334.refresh(this.var_239);
         if(Util.hasVisibleChildren(this.var_239) && !(this.var_171.active || this.var_241.active))
         {
            Util.moveChildrenToColumn(this.var_239,["event_details","event_buttons"],0,2);
            this.var_239.height = Util.getLowestPoint(this.var_239);
            this.var_239.visible = true;
         }
         else
         {
            this.var_239.visible = false;
         }
         Logger.log("EVENT: " + this.var_239.visible + ", " + this.var_239.rectangle);
      }
      
      private function refreshEmbed() : void
      {
         var _loc1_:* = this._navigator.configuration.getKey("embed.showInRoomInfo","false") == "true";
         var _loc2_:* = this._navigator.data.enteredGuestRoom != null;
         if(_loc2_ && _loc1_ && !this.var_171.active && !this.var_241.active && !this.var_334.active)
         {
            this.var_854.visible = true;
            this.var_1070.text = this.getEmbedData();
         }
         else
         {
            this.var_854.visible = false;
         }
      }
      
      private function refreshButtons() : void
      {
         var _loc1_:* = false;
         if(!this.var_65)
         {
            return;
         }
         if(this.var_171.active)
         {
            this.var_65.visible = false;
            return;
         }
         this.var_65.visible = true;
         if(this.var_1069)
         {
            if(this.var_2273 == "exit_homeroom")
            {
               this.var_1069.caption = "${navigator.homeroom}";
            }
            else
            {
               this.var_1069.caption = "${navigator.hotelview}";
            }
         }
         if(this.var_853)
         {
            _loc1_ = this._navigator.data.enteredGuestRoom != null;
            this.var_853.visible = _loc1_;
            if(this.var_2277 == "0")
            {
               this.var_853.caption = "${navigator.zoom.in}";
            }
            else
            {
               this.var_853.caption = "${navigator.zoom.out}";
            }
         }
      }
      
      private function refreshRoomDetails(param1:GuestRoomData, param2:Boolean) : void
      {
         if(param1 == null || this.var_171.active || this.var_241.active)
         {
            return;
         }
         this.var_896.text = param1.roomName;
         this.var_896.height = this.var_896.textHeight + 5;
         this._ownerName.text = param1.ownerName;
         this.var_851.text = param1.description;
         this.var_1093.refreshTags(this.var_395,param1.tags);
         this.var_851.visible = false;
         if(param1.description != "")
         {
            this.var_851.height = this.var_851.textHeight + 5;
            this.var_851.visible = true;
         }
         var _loc3_:Boolean = Boolean(this._navigator.configuration.getKey("client.allow.facebook.like") == "1");
         this._navigator.refreshButton(this.var_1306,"facebook_logo_small",_loc3_,null,0);
         this.var_1306.visible = _loc3_;
         var _loc4_:* = this._navigator.data.currentRoomRating == -1;
         this._navigator.refreshButton(this.var_1307,"thumb_up",_loc4_,null,0);
         this.var_1307.visible = _loc4_;
         this.var_855.visible = !_loc4_;
         this.var_1619.visible = !_loc4_;
         this.var_1619.text = "" + this._navigator.data.currentRoomRating;
         this.refreshStuffPick();
         this._navigator.refreshButton(this.var_395,"home",param2,null,0);
         this._navigator.refreshButton(this.var_395,"favourite",!param2 && this._navigator.data.isCurrentRoomFavourite(),null,0);
         Util.moveChildrenToColumn(this.var_395,["room_name","owner_name_cont","tags","room_desc","rating_cont","staff_pick_button"],this.var_896.y,0);
         this.var_395.visible = true;
         this.var_395.height = Util.getLowestPoint(this.var_395);
      }
      
      private function refreshStuffPick() : void
      {
         var _loc1_:IWindow = this.var_395.findChildByName("staff_pick_button");
         if(!this._navigator.data.roomPicker)
         {
            _loc1_.visible = false;
            return;
         }
         _loc1_.visible = true;
         _loc1_.caption = this._navigator.getText(!!this._navigator.data.currentRoomIsStaffPick ? "navigator.staffpicks.unpick" : "navigator.staffpicks.pick");
      }
      
      private function refreshPublicSpaceDetails(param1:PublicRoomShortData) : void
      {
         if(param1 == null || this.var_171.active || this.var_241.active)
         {
            return;
         }
         this.var_1071.text = this._navigator.getPublicSpaceName(param1.unitPropertySet,param1.worldId);
         this.var_1071.height = this.var_1071.textHeight + 5;
         this.var_1305.text = this._navigator.getPublicSpaceDesc(param1.unitPropertySet,param1.worldId);
         this.var_1305.height = this.var_1305.textHeight + 5;
         Util.moveChildrenToColumn(this.var_693,["public_space_name","public_space_desc"],this.var_1071.y,0);
         this.var_693.visible = true;
         this.var_693.height = Math.max(86,Util.getLowestPoint(this.var_693));
      }
      
      private function refreshEventDetails(param1:RoomEventData) : void
      {
         if(param1 == null || this.var_334.active)
         {
            return;
         }
         this.var_2275.text = param1.eventName;
         this.var_692.text = param1.eventDescription;
         this.var_1093.refreshTags(this.var_852,[this._navigator.getText("roomevent_type_" + param1.eventType),param1.tags[0],param1.tags[1]]);
         this.var_692.visible = false;
         if(param1.eventDescription != "")
         {
            this.var_692.height = this.var_692.textHeight + 5;
            this.var_692.y = Util.getLowestPoint(this.var_852) + 2;
            this.var_692.visible = true;
         }
         this.var_852.visible = true;
         this.var_852.height = Util.getLowestPoint(this.var_852);
      }
      
      private function refreshRoomButtons(param1:Boolean) : void
      {
         if(this._navigator.data.enteredGuestRoom == null || this.var_171.active || this.var_241.active)
         {
            return;
         }
         this.var_1616.visible = this._navigator.data.canEditRoomSettings;
         var _loc2_:Boolean = this._navigator.data.isCurrentRoomFavourite();
         this.var_1311.visible = this._navigator.data.canAddFavourite && !_loc2_;
         this.var_1310.visible = this._navigator.data.canAddFavourite && _loc2_;
         this.var_1312.visible = this._navigator.data.canEditRoomSettings && !param1;
         this.var_1309.visible = this._navigator.data.canEditRoomSettings && param1;
         this.var_1308.visible = Util.hasVisibleChildren(this.var_1308);
      }
      
      private function refreshEventButtons(param1:RoomEventData) : void
      {
         if(this.var_334.active)
         {
            return;
         }
         this.var_1620.visible = param1 == null && this._navigator.data.currentRoomOwner;
         this.var_1618.visible = param1 != null && (this._navigator.data.currentRoomOwner || this._navigator.data.eventMod);
         this.var_1617.visible = Util.hasVisibleChildren(this.var_1617);
      }
      
      private function prepareWindow() : void
      {
         if(this._window != null)
         {
            return;
         }
         this._window = IWindowContainer(this._navigator.getXmlWindow("iro_room_details"));
         this._window.setParamFlag(HabboWindowParam.const_60,false);
         this._window.setParamFlag(HabboWindowParam.const_1638,true);
         this._window.visible = false;
         this.var_282 = IWindowContainer(this.find("room_info"));
         this.var_395 = IWindowContainer(this.find("room_details"));
         this.var_693 = IWindowContainer(this.find("public_space_details"));
         this.var_2272 = IWindowContainer(this.find("owner_name_cont"));
         this.var_2276 = IWindowContainer(this.find("rating_cont"));
         this.var_1308 = IWindowContainer(this.find("room_buttons"));
         this.var_896 = ITextWindow(this.find("room_name"));
         this.var_1071 = ITextWindow(this.find("public_space_name"));
         this._ownerName = ITextWindow(this.find("owner_name"));
         this.var_851 = ITextWindow(this.find("room_desc"));
         this.var_1305 = ITextWindow(this.find("public_space_desc"));
         this.var_1068 = ITextWindow(this.find("owner_caption"));
         this.var_855 = ITextWindow(this.find("rating_caption"));
         this.var_1619 = ITextWindow(this.find("rating_txt"));
         this.var_239 = IWindowContainer(this.find("event_info"));
         this.var_852 = IWindowContainer(this.find("event_details"));
         this.var_1617 = IWindowContainer(this.find("event_buttons"));
         this.var_2275 = ITextWindow(this.find("event_name"));
         this.var_692 = ITextWindow(this.find("event_desc"));
         this.var_1306 = IContainerButtonWindow(this.find("facebook_like_button"));
         this.var_1307 = IContainerButtonWindow(this.find("rate_up_button"));
         this.var_2274 = this.find("staff_pick_button");
         this.var_1311 = IContainerButtonWindow(this.find("add_favourite_button"));
         this.var_1310 = IContainerButtonWindow(this.find("rem_favourite_button"));
         this.var_1312 = IContainerButtonWindow(this.find("make_home_button"));
         this.var_1309 = IContainerButtonWindow(this.find("unmake_home_button"));
         this.var_1616 = IButtonWindow(this.find("room_settings_button"));
         this.var_1620 = IButtonWindow(this.find("create_event_button"));
         this.var_1618 = IButtonWindow(this.find("edit_event_button"));
         this.var_854 = IWindowContainer(this.find("embed_info"));
         this.var_1313 = ITextWindow(this.find("embed_info_txt"));
         this.var_1070 = ITextFieldWindow(this.find("embed_src_txt"));
         this.var_65 = IWindowContainer(this.find("buttons_container"));
         this.var_1069 = IButtonWindow(this.find("exit_room_button"));
         this.var_853 = IButtonWindow(this.find("zoom_button"));
         Util.setProcDirectly(this.var_1311,this.onAddFavouriteClick);
         Util.setProcDirectly(this.var_1310,this.onRemoveFavouriteClick);
         Util.setProcDirectly(this.var_1616,this.onRoomSettingsClick);
         Util.setProcDirectly(this.var_1312,this.onMakeHomeClick);
         Util.setProcDirectly(this.var_1309,this.onUnmakeHomeClick);
         Util.setProcDirectly(this.var_1620,this.onEventSettingsClick);
         Util.setProcDirectly(this.var_1618,this.onEventSettingsClick);
         Util.setProcDirectly(this.var_1070,this.onEmbedSrcClick);
         Util.setProcDirectly(this.var_1307,this.onThumbUp);
         Util.setProcDirectly(this.var_2274,this.onStaffPick);
         Util.setProcDirectly(this.var_1306,this.onFacebookLike);
         Util.setProcDirectly(this.var_853,this.onZoomClick);
         Util.setProcDirectly(this.var_1069,this.onExitRoomClick);
         this._navigator.refreshButton(this.var_1311,"favourite",true,null,0);
         this._navigator.refreshButton(this.var_1310,"favourite",true,null,0);
         this._navigator.refreshButton(this.var_1312,"home",true,null,0);
         this._navigator.refreshButton(this.var_1309,"home",true,null,0);
         this._window.findChildByName("close").procedure = this.onCloseButtonClick;
         Util.setProcDirectly(this.var_282,this.onHover);
         Util.setProcDirectly(this.var_239,this.onHover);
         this.var_1068.width = this.var_1068.textWidth;
         Util.moveChildrenToRow(this.var_2272,["owner_caption","owner_name"],this.var_1068.x,this.var_1068.y,3);
         this.var_855.width = this.var_855.textWidth;
         Util.moveChildrenToRow(this.var_2276,["rating_caption","rating_txt"],this.var_855.x,this.var_855.y,3);
         this.var_1313.height = this.var_1313.textHeight + 5;
         Util.moveChildrenToColumn(this.var_854,["embed_info_txt","embed_src_txt"],this.var_1313.y,2);
         this.var_854.height = Util.getLowestPoint(this.var_854) + 5;
         this.var_2757 = this._window.y + this._window.height;
      }
      
      private function find(param1:String) : IWindow
      {
         var _loc2_:IWindow = this._window.findChildByName(param1);
         if(_loc2_ == null)
         {
            throw new Error("Window element with name: " + param1 + " cannot be found!");
         }
         return _loc2_;
      }
      
      private function getButtonsMinHeight() : int
      {
         return !!this._navigator.data.currentRoomOwner ? 0 : 21;
      }
      
      private function getRoomInfoMinHeight() : int
      {
         return 37;
      }
      
      private function getEventInfoMinHeight() : int
      {
         return 18;
      }
      
      public function onAddFavouriteClick(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc3_:* = null;
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(this._navigator.data.enteredGuestRoom == null)
         {
            return;
         }
         if(this._navigator.data.isFavouritesFull())
         {
            _loc3_ = new SimpleAlertView(this._navigator,"${navigator.favouritesfull.title}","${navigator.favouritesfull.body}");
            _loc3_.show();
         }
         else
         {
            this._navigator.send(new AddFavouriteRoomMessageComposer(this._navigator.data.enteredGuestRoom.flatId));
         }
      }
      
      public function onRemoveFavouriteClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(this._navigator.data.enteredGuestRoom == null)
         {
            return;
         }
         this._navigator.send(new DeleteFavouriteRoomMessageComposer(this._navigator.data.enteredGuestRoom.flatId));
      }
      
      private function onEventSettingsClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(this._navigator.data.roomEventData == null)
         {
            if(this._navigator.data.currentRoomOwner)
            {
               this._navigator.send(new CanCreateEventMessageComposer());
            }
         }
         else
         {
            this.startEventEdit();
         }
      }
      
      private function onRoomSettingsClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:GuestRoomData = this._navigator.data.enteredGuestRoom;
         if(_loc3_ == null)
         {
            Logger.log("No entered room data?!");
            return;
         }
         this.startRoomSettingsEdit(_loc3_.flatId);
      }
      
      private function onMakeHomeClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:GuestRoomData = this._navigator.data.enteredGuestRoom;
         if(_loc3_ == null)
         {
            Logger.log("No entered room data?!");
            return;
         }
         Logger.log("SETTING HOME ROOM TO: " + _loc3_.flatId);
         this._navigator.send(new UpdateNavigatorSettingsMessageComposer(_loc3_.flatId));
      }
      
      private function onUnmakeHomeClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         Logger.log("CLEARING HOME ROOM:");
         this._navigator.send(new UpdateNavigatorSettingsMessageComposer(0));
      }
      
      private function onCloseButtonClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         this.hideInfo(null);
      }
      
      private function onThumbUp(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         this._navigator.send(new RateFlatMessageComposer(1));
      }
      
      private function onStaffPick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         this._navigator.send(new ToggleStaffPickMessageComposer(this._navigator.data.enteredGuestRoom.flatId,this._navigator.data.currentRoomIsStaffPick));
      }
      
      private function onThumbDown(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         this._navigator.send(new RateFlatMessageComposer(-1));
      }
      
      private function onFacebookLike(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         HabboWebTools.facebookLike(this._navigator.data.enteredGuestRoom.flatId);
      }
      
      private function onEmbedSrcClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         this.var_1070.setSelection(0,this.var_1070.text.length);
      }
      
      private function onZoomClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:HabboToolbarEvent = new HabboToolbarEvent(HabboToolbarEvent.const_38);
         _loc3_.iconId = HabboToolbarIconEnum.ZOOM;
         _loc3_.iconName = "ZOOM";
         this._navigator.toolbar.events.dispatchEvent(_loc3_);
      }
      
      private function onExitRoomClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:HabboToolbarEvent = new HabboToolbarEvent(HabboToolbarEvent.const_38);
         _loc3_.iconId = HabboToolbarIconEnum.EXITROOM;
         _loc3_.iconName = "EXITROOM";
         this._navigator.toolbar.events.dispatchEvent(_loc3_);
      }
      
      private function onToolbarIconState(param1:HabboToolbarSetIconEvent) : void
      {
         if(param1.type != HabboToolbarSetIconEvent.const_99)
         {
            return;
         }
         switch(param1.iconId)
         {
            case HabboToolbarIconEnum.ZOOM:
               this.var_2277 = param1.iconState;
               this.refreshButtons();
               break;
            case HabboToolbarIconEnum.EXITROOM:
               this.var_2273 = param1.iconState;
               this.refreshButtons();
         }
      }
      
      private function onHover(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER)
         {
            return;
         }
         this.var_240.reset();
      }
      
      private function hideInfo(param1:Event) : void
      {
         this._navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_544,HabboToolbarIconEnum.ROOMINFO,this._window,false));
      }
      
      private function getEmbedData() : String
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(this._navigator.data.enteredGuestRoom != null)
         {
            _loc1_ = "private";
            _loc2_ = "" + this._navigator.data.enteredGuestRoom.flatId;
         }
         else
         {
            _loc1_ = "public";
            _loc2_ = "" + this._navigator.data.publicSpaceNodeId;
            Logger.log("Node id is: " + _loc2_);
         }
         var _loc3_:String = this._navigator.configuration.getKey("user.hash","");
         this._navigator.registerParameter("navigator.embed.src","roomType",_loc1_);
         this._navigator.registerParameter("navigator.embed.src","embedCode",_loc3_);
         this._navigator.registerParameter("navigator.embed.src","roomId",_loc2_);
         return this._navigator.getText("navigator.embed.src");
      }
      
      public function registerToolbarEvents() : void
      {
         if(this._navigator.toolbar)
         {
            this._navigator.toolbar.events.addEventListener(HabboToolbarSetIconEvent.const_99,this.onToolbarIconState);
         }
      }
   }
}
