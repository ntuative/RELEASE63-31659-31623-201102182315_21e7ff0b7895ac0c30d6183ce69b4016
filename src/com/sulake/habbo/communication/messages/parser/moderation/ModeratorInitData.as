package com.sulake.habbo.communication.messages.parser.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.habbo.communication.messages.incoming.moderation.OffenceCategoryData;
   
   public class ModeratorInitData implements IDisposable
   {
       
      
      private var var_1275:Array;
      
      private var var_1276:Array;
      
      private var _issues:Array;
      
      private var var_1028:Array;
      
      private var var_2130:Boolean;
      
      private var var_2132:Boolean;
      
      private var var_2129:Boolean;
      
      private var var_2135:Boolean;
      
      private var var_2134:Boolean;
      
      private var var_2131:Boolean;
      
      private var var_2133:Boolean;
      
      private var _disposed:Boolean;
      
      public function ModeratorInitData(param1:IMessageDataWrapper)
      {
         super();
         var _loc2_:IssueInfoMessageParser = new IssueInfoMessageParser();
         this._issues = [];
         this.var_1275 = [];
         this.var_1276 = [];
         this.var_1028 = [];
         var _loc3_:int = param1.readInteger();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            if(_loc2_.parse(param1))
            {
               this._issues.push(_loc2_.issueData);
            }
            _loc4_++;
         }
         _loc3_ = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            this.var_1275.push(param1.readString());
            _loc4_++;
         }
         _loc3_ = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            this.var_1028.push(new OffenceCategoryData(param1));
            _loc4_++;
         }
         this.var_2130 = param1.readBoolean();
         this.var_2132 = param1.readBoolean();
         this.var_2129 = param1.readBoolean();
         this.var_2135 = param1.readBoolean();
         this.var_2134 = param1.readBoolean();
         this.var_2131 = param1.readBoolean();
         this.var_2133 = param1.readBoolean();
         _loc3_ = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            this.var_1276.push(param1.readString());
            _loc4_++;
         }
      }
      
      public function dispose() : void
      {
         var _loc1_:* = null;
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
         this.var_1275 = null;
         this.var_1276 = null;
         this._issues = null;
         for each(_loc1_ in this.var_1028)
         {
            _loc1_.dispose();
         }
         this.var_1028 = null;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get messageTemplates() : Array
      {
         return this.var_1275;
      }
      
      public function get roomMessageTemplates() : Array
      {
         return this.var_1276;
      }
      
      public function get issues() : Array
      {
         return this._issues;
      }
      
      public function get offenceCategories() : Array
      {
         return this.var_1028;
      }
      
      public function get cfhPermission() : Boolean
      {
         return this.var_2130;
      }
      
      public function get chatlogsPermission() : Boolean
      {
         return this.var_2132;
      }
      
      public function get alertPermission() : Boolean
      {
         return this.var_2129;
      }
      
      public function get kickPermission() : Boolean
      {
         return this.var_2135;
      }
      
      public function get banPermission() : Boolean
      {
         return this.var_2134;
      }
      
      public function get roomAlertPermission() : Boolean
      {
         return this.var_2131;
      }
      
      public function get roomKickPermission() : Boolean
      {
         return this.var_2133;
      }
   }
}
