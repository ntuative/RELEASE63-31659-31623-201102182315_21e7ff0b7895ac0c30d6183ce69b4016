package com.sulake.core.window
{
   import com.sulake.core.localization.ICoreLocalizationManager;
   import com.sulake.core.localization.ILocalizable;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.runtime.IUpdateReceiver;
   import com.sulake.core.window.components.DesktopController;
   import com.sulake.core.window.components.IDesktopWindow;
   import com.sulake.core.window.components.SubstituteParentController;
   import com.sulake.core.window.enum.WindowParam;
   import com.sulake.core.window.enum.WindowState;
   import com.sulake.core.window.graphics.IGraphicContextHost;
   import com.sulake.core.window.graphics.IWindowRenderer;
   import com.sulake.core.window.services.IInternalWindowServices;
   import com.sulake.core.window.services.ServiceManager;
   import com.sulake.core.window.utils.EventProcessorState;
   import com.sulake.core.window.utils.IEventProcessor;
   import com.sulake.core.window.utils.IEventQueue;
   import com.sulake.core.window.utils.IMouseCursor;
   import com.sulake.core.window.utils.IWindowParser;
   import com.sulake.core.window.utils.MouseCursorControl;
   import com.sulake.core.window.utils.MouseEventProcessor;
   import com.sulake.core.window.utils.MouseEventQueue;
   import com.sulake.core.window.utils.WindowParser;
   import com.sulake.core.window.utils.tablet.TabletEventProcessor;
   import com.sulake.core.window.utils.tablet.TabletEventQueue;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.geom.Rectangle;
   
   public class WindowContext implements IWindowContext, IDisposable, IUpdateReceiver
   {
      
      public static const const_503:uint = 0;
      
      public static const const_1593:uint = 1;
      
      public static const const_1778:int = 0;
      
      public static const const_1893:int = 1;
      
      public static const const_1864:int = 2;
      
      public static const const_1813:int = 3;
      
      public static const const_1456:int = 4;
      
      public static const const_377:int = 5;
      
      public static var var_1478:IMouseCursor;
      
      public static var var_375:IEventQueue;
      
      private static var var_617:IEventProcessor;
      
      private static var var_1839:uint = const_503;
      
      private static var stage:Stage;
      
      private static var var_161:IWindowRenderer;
       
      
      private var _eventProcessorState:EventProcessorState;
      
      private var var_2605:IWindowContextStateListener;
      
      protected var _localization:ICoreLocalizationManager;
      
      protected var var_188:DisplayObjectContainer;
      
      protected var var_2792:Boolean = true;
      
      protected var var_1235:Error;
      
      protected var var_1983:int = -1;
      
      protected var var_1236:IInternalWindowServices;
      
      protected var var_1486:IWindowParser;
      
      protected var var_2747:IWindowFactory;
      
      protected var var_140:IDesktopWindow;
      
      protected var var_1485:SubstituteParentController;
      
      private var _disposed:Boolean = false;
      
      private var var_528:Boolean = false;
      
      private var var_2606:Boolean = false;
      
      private var _name:String;
      
      public function WindowContext(param1:String, param2:IWindowRenderer, param3:IWindowFactory, param4:ICoreLocalizationManager, param5:DisplayObjectContainer, param6:Rectangle, param7:IWindowContextStateListener)
      {
         super();
         this._name = param1;
         var_161 = param2;
         this._localization = param4;
         this.var_188 = param5;
         this.var_1236 = new ServiceManager(this,param5);
         this.var_2747 = param3;
         this.var_1486 = new WindowParser(this);
         this.var_2605 = param7;
         if(!stage)
         {
            if(this.var_188 is Stage)
            {
               stage = this.var_188 as Stage;
            }
            else if(this.var_188.stage)
            {
               stage = this.var_188.stage;
            }
         }
         Classes.init();
         if(param6 == null)
         {
            param6 = new Rectangle(0,0,800,600);
         }
         this.var_140 = new DesktopController("_CONTEXT_DESKTOP_" + this._name,this,param6);
         this.var_188.addChild(this.var_140.getDisplayObject());
         this.var_188.doubleClickEnabled = true;
         this.var_188.addEventListener(Event.RESIZE,this.stageResizedHandler);
         this._eventProcessorState = new EventProcessorState(var_161,this.var_140,this.var_140,null,this.var_2605);
         inputMode = const_503;
         this.var_1485 = new SubstituteParentController(this);
      }
      
      public static function get inputMode() : uint
      {
         return var_1839;
      }
      
      public static function set inputMode(param1:uint) : void
      {
         var value:uint = param1;
         if(var_375)
         {
            if(var_375 is IDisposable)
            {
               IDisposable(var_375).dispose();
            }
         }
         if(var_617)
         {
            if(var_617 is IDisposable)
            {
               IDisposable(var_617).dispose();
            }
         }
         switch(value)
         {
            case const_503:
               var_375 = new MouseEventQueue(stage);
               var_617 = new MouseEventProcessor();
               try
               {
               }
               catch(e:Error)
               {
               }
               break;
            case const_1593:
               var_375 = new TabletEventQueue(stage);
               var_617 = new TabletEventProcessor();
               try
               {
               }
               catch(e:Error)
               {
               }
               break;
            default:
               inputMode = const_503;
               throw new Error("Unknown input mode " + value);
         }
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function dispose() : void
      {
         if(!this._disposed)
         {
            this._disposed = true;
            this.var_188.removeEventListener(Event.RESIZE,this.stageResizedHandler);
            this.var_188.removeChild(IGraphicContextHost(this.var_140).getGraphicContext(true) as DisplayObject);
            this.var_140.destroy();
            this.var_140 = null;
            this.var_1485.destroy();
            this.var_1485 = null;
            if(this.var_1236 is IDisposable)
            {
               IDisposable(this.var_1236).dispose();
            }
            this.var_1236 = null;
            this.var_1486.dispose();
            this.var_1486 = null;
            var_161 = null;
         }
      }
      
      public function getLastError() : Error
      {
         return this.var_1235;
      }
      
      public function method_11() : int
      {
         return this.var_1983;
      }
      
      public function handleError(param1:int, param2:Error) : void
      {
         this.var_1235 = param2;
         this.var_1983 = param1;
         if(this.var_2792)
         {
            throw param2;
         }
      }
      
      public function flushError() : void
      {
         this.var_1235 = null;
         this.var_1983 = -1;
      }
      
      public function getWindowServices() : IInternalWindowServices
      {
         return this.var_1236;
      }
      
      public function getWindowParser() : IWindowParser
      {
         return this.var_1486;
      }
      
      public function getWindowFactory() : IWindowFactory
      {
         return this.var_2747;
      }
      
      public function getDesktopWindow() : IDesktopWindow
      {
         return this.var_140;
      }
      
      public function getMouseCursor() : IMouseCursor
      {
         if(var_1478 == null)
         {
            var_1478 = new MouseCursorControl(this.var_188);
         }
         return var_1478;
      }
      
      public function findWindowByName(param1:String) : IWindow
      {
         return this.var_140.findChildByName(param1);
      }
      
      public function registerLocalizationListener(param1:String, param2:IWindow) : void
      {
         this._localization.registerListener(param1,param2 as ILocalizable);
      }
      
      public function removeLocalizationListener(param1:String, param2:IWindow) : void
      {
         this._localization.removeListener(param1,param2 as ILocalizable);
      }
      
      public function create(param1:String, param2:String, param3:uint, param4:uint, param5:uint, param6:Rectangle, param7:Function, param8:IWindow, param9:uint, param10:Array = null, param11:Array = null) : IWindow
      {
         var _loc12_:* = null;
         var _loc13_:Class = Classes.getWindowClassByType(param3);
         if(_loc13_ == null)
         {
            this.handleError(WindowContext.const_1456,new Error("Failed to solve implementation for window \"" + param1 + "\"!"));
            return null;
         }
         if(param8 == null)
         {
            if(param5 & 0)
            {
               param8 = this.var_1485;
            }
         }
         _loc12_ = new _loc13_(param1,param3,param4,param5,this,param6,param8 != null ? param8 : this.var_140,param7,param10,param11,param9);
         if(param2 && param2.length)
         {
            _loc12_.caption = param2;
         }
         return _loc12_;
      }
      
      public function destroy(param1:IWindow) : Boolean
      {
         if(param1 == this.var_140)
         {
            this.var_140 = null;
         }
         if(param1.state != WindowState.const_488)
         {
            param1.destroy();
         }
         return true;
      }
      
      public function invalidate(param1:IWindow, param2:Rectangle, param3:uint) : void
      {
         if(!this.disposed)
         {
            var_161.addToRenderQueue(WindowController(param1),param2,param3);
         }
      }
      
      public function update(param1:uint) : void
      {
         this.var_528 = true;
         if(this.var_1235)
         {
            throw this.var_1235;
         }
         var_617.process(this._eventProcessorState,var_375);
         this.var_528 = false;
      }
      
      public function render(param1:uint) : void
      {
         this.var_2606 = true;
         var_161.update(param1);
         this.var_2606 = false;
      }
      
      private function stageResizedHandler(param1:Event) : void
      {
         if(this.var_140 != null && !this.var_140.disposed)
         {
            if(this.var_188 is Stage)
            {
               this.var_140.width = Stage(this.var_188).stageWidth;
               this.var_140.height = Stage(this.var_188).stageHeight;
            }
            else
            {
               this.var_140.width = this.var_188.width;
               this.var_140.height = this.var_188.height;
            }
         }
      }
   }
}
