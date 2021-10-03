package com.sulake.core.window.services
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindowContext;
   import flash.display.DisplayObject;
   
   public class ServiceManager implements IInternalWindowServices, IDisposable
   {
       
      
      private var var_2783:uint;
      
      private var var_136:DisplayObject;
      
      private var _disposed:Boolean = false;
      
      private var _windowContext:IWindowContext;
      
      private var var_1182:IMouseDraggingService;
      
      private var var_1183:IMouseScalingService;
      
      private var var_1180:IMouseListenerService;
      
      private var var_1184:IFocusManagerService;
      
      private var var_1179:IToolTipAgentService;
      
      private var var_1181:IGestureAgentService;
      
      public function ServiceManager(param1:IWindowContext, param2:DisplayObject)
      {
         super();
         this.var_2783 = 0;
         this.var_136 = param2;
         this._windowContext = param1;
         this.var_1182 = new WindowMouseDragger(param2);
         this.var_1183 = new WindowMouseScaler(param2);
         this.var_1180 = new WindowMouseListener(param2);
         this.var_1184 = new FocusManager(param2);
         this.var_1179 = new WindowToolTipAgent(param2);
         this.var_1181 = new GestureAgentService();
      }
      
      public function dispose() : void
      {
         if(this.var_1182 != null)
         {
            this.var_1182.dispose();
            this.var_1182 = null;
         }
         if(this.var_1183 != null)
         {
            this.var_1183.dispose();
            this.var_1183 = null;
         }
         if(this.var_1180 != null)
         {
            this.var_1180.dispose();
            this.var_1180 = null;
         }
         if(this.var_1184 != null)
         {
            this.var_1184.dispose();
            this.var_1184 = null;
         }
         if(this.var_1179 != null)
         {
            this.var_1179.dispose();
            this.var_1179 = null;
         }
         if(this.var_1181 != null)
         {
            this.var_1181.dispose();
            this.var_1181 = null;
         }
         this.var_136 = null;
         this._windowContext = null;
         this._disposed = true;
      }
      
      public function getMouseDraggingService() : IMouseDraggingService
      {
         return this.var_1182;
      }
      
      public function getMouseScalingService() : IMouseScalingService
      {
         return this.var_1183;
      }
      
      public function getMouseListenerService() : IMouseListenerService
      {
         return this.var_1180;
      }
      
      public function getFocusManagerService() : IFocusManagerService
      {
         return this.var_1184;
      }
      
      public function getToolTipAgentService() : IToolTipAgentService
      {
         return this.var_1179;
      }
      
      public function getGestureAgentService() : IGestureAgentService
      {
         return this.var_1181;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
   }
}
