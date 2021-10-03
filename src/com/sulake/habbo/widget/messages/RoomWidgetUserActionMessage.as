package com.sulake.habbo.widget.messages
{
   public class RoomWidgetUserActionMessage extends RoomWidgetMessage
   {
      
      public static const const_766:String = "RWUAM_WHISPER_USER";
      
      public static const const_787:String = "RWUAM_IGNORE_USER";
      
      public static const const_634:String = "RWUAM_UNIGNORE_USER";
      
      public static const const_538:String = "RWUAM_KICK_USER";
      
      public static const const_782:String = "RWUAM_BAN_USER";
      
      public static const const_735:String = "RWUAM_SEND_FRIEND_REQUEST";
      
      public static const const_712:String = "RWUAM_RESPECT_USER";
      
      public static const const_688:String = "RWUAM_GIVE_RIGHTS";
      
      public static const const_847:String = "RWUAM_TAKE_RIGHTS";
      
      public static const const_626:String = "RWUAM_START_TRADING";
      
      public static const const_769:String = "RWUAM_OPEN_HOME_PAGE";
      
      public static const const_471:String = "RWUAM_KICK_BOT";
      
      public static const const_891:String = "RWUAM_REPORT";
      
      public static const const_452:String = "RWUAM_PICKUP_PET";
      
      public static const const_1504:String = "RWUAM_TRAIN_PET";
      
      public static const const_548:String = " RWUAM_RESPECT_PET";
      
      public static const const_388:String = "RWUAM_REQUEST_PET_UPDATE";
      
      public static const const_722:String = "RWUAM_START_NAME_CHANGE";
       
      
      private var _userId:int = 0;
      
      public function RoomWidgetUserActionMessage(param1:String, param2:int = 0)
      {
         super(param1);
         this._userId = param2;
      }
      
      public function get userId() : int
      {
         return this._userId;
      }
   }
}
