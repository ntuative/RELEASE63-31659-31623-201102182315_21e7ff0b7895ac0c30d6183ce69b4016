package com.sulake.habbo.tracking
{
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   
   public class ToolbarClickTracker
   {
       
      
      private var var_1243:IHabboTracking;
      
      private var var_1833:Boolean = false;
      
      private var var_2202:int = 0;
      
      private var var_1594:int = 0;
      
      public function ToolbarClickTracker(param1:IHabboTracking)
      {
         super();
         this.var_1243 = param1;
      }
      
      public function dispose() : void
      {
         this.var_1243 = null;
      }
      
      public function configure(param1:IHabboConfigurationManager) : void
      {
         this.var_1833 = Boolean(parseInt(param1.getKey("toolbar.tracking.enabled","1")));
         this.var_2202 = parseInt(param1.getKey("toolbar.tracking.max.events","100"));
      }
      
      public function track(param1:String) : void
      {
         if(!this.var_1833)
         {
            return;
         }
         ++this.var_1594;
         if(this.var_1594 <= this.var_2202)
         {
            this.var_1243.track("toolbar",param1);
         }
      }
   }
}
