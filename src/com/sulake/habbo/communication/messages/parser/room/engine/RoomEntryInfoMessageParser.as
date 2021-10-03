package com.sulake.habbo.communication.messages.parser.room.engine
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   
   public class RoomEntryInfoMessageParser implements IMessageParser
   {
       
      
      private var var_1700:Boolean;
      
      private var var_2432:int;
      
      private var var_434:Boolean;
      
      private var var_1110:PublicRoomShortData;
      
      public function RoomEntryInfoMessageParser()
      {
         super();
      }
      
      public function get guestRoom() : Boolean
      {
         return this.var_1700;
      }
      
      public function get guestRoomId() : int
      {
         return this.var_2432;
      }
      
      public function get publicSpace() : PublicRoomShortData
      {
         return this.var_1110;
      }
      
      public function get owner() : Boolean
      {
         return this.var_434;
      }
      
      public function flush() : Boolean
      {
         if(this.var_1110 != null)
         {
            this.var_1110.dispose();
            this.var_1110 = null;
         }
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1700 = param1.readBoolean();
         if(this.var_1700)
         {
            this.var_2432 = param1.readInteger();
            this.var_434 = param1.readBoolean();
         }
         else
         {
            this.var_1110 = new PublicRoomShortData(param1);
         }
         return true;
      }
   }
}
