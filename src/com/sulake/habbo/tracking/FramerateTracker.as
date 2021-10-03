package com.sulake.habbo.tracking
{
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   
   public class FramerateTracker
   {
       
      
      private var var_1782:int;
      
      private var var_2540:int;
      
      private var var_1145:int;
      
      private var var_516:Number;
      
      private var var_2539:Boolean;
      
      private var var_2538:int;
      
      private var var_1781:int;
      
      public function FramerateTracker()
      {
         super();
      }
      
      public function configure(param1:IHabboConfigurationManager) : void
      {
         this.var_2540 = int(param1.getKey("tracking.framerate.reportInterval.seconds","300")) * 1000;
         this.var_2538 = int(param1.getKey("tracking.framerate.maximumEvents","5"));
         this.var_2539 = true;
      }
      
      public function trackUpdate(param1:uint, param2:IHabboTracking, param3:int) : void
      {
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         ++this.var_1145;
         if(this.var_1145 == 1)
         {
            this.var_516 = param1;
            this.var_1782 = param3;
         }
         else
         {
            _loc4_ = Number(this.var_1145);
            this.var_516 = this.var_516 * (_loc4_ - 1) / _loc4_ + Number(param1) / _loc4_;
         }
         if(this.var_2539 && param3 - this.var_1782 >= this.var_2540 && this.var_1781 < this.var_2538)
         {
            _loc5_ = 1000 / this.var_516;
            param2.track("performance","averageFramerate",Math.round(_loc5_));
            ++this.var_1781;
            this.var_1782 = param3;
            this.var_1145 = 0;
         }
      }
      
      public function dispose() : void
      {
      }
   }
}
