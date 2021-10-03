package com.sulake.habbo.communication.messages.incoming.handshake
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import com.sulake.habbo.communication.messages.parser.handshake.DisconnectReasonParser;
   
   public class DisconnectReasonEvent extends MessageEvent implements IMessageEvent
   {
      
      public static const const_1855:int = 0;
      
      public static const const_1623:int = 1;
      
      public static const const_1357:int = 2;
      
      public static const const_1807:int = 3;
      
      public static const const_1770:int = 4;
      
      public static const const_1894:int = 5;
      
      public static const const_1406:int = 10;
      
      public static const const_1798:int = 11;
      
      public static const const_1846:int = 12;
      
      public static const const_1880:int = 13;
      
      public static const const_1755:int = 16;
      
      public static const const_1753:int = 17;
      
      public static const const_1901:int = 18;
      
      public static const const_1921:int = 19;
      
      public static const const_1828:int = 20;
      
      public static const const_1896:int = 22;
      
      public static const const_1935:int = 23;
      
      public static const const_1899:int = 24;
      
      public static const const_1853:int = 25;
      
      public static const const_1746:int = 26;
      
      public static const const_1869:int = 27;
      
      public static const const_1762:int = 28;
      
      public static const const_1919:int = 29;
      
      public static const const_1845:int = 100;
      
      public static const const_1862:int = 101;
      
      public static const const_1747:int = 102;
      
      public static const const_1933:int = 103;
      
      public static const const_1898:int = 104;
      
      public static const const_1789:int = 105;
      
      public static const const_1882:int = 106;
      
      public static const const_1860:int = 107;
      
      public static const const_1805:int = 108;
      
      public static const const_1792:int = 109;
      
      public static const const_1719:int = 110;
      
      public static const const_1848:int = 111;
      
      public static const const_1737:int = 112;
      
      public static const const_1928:int = 113;
      
      public static const const_1903:int = 114;
      
      public static const const_1715:int = 115;
      
      public static const const_1766:int = 116;
      
      public static const const_1915:int = 117;
      
      public static const const_1876:int = 118;
      
      public static const const_1773:int = 119;
       
      
      public function DisconnectReasonEvent(param1:Function)
      {
         super(param1,DisconnectReasonParser);
      }
      
      public function get reason() : int
      {
         return (this.var_10 as DisconnectReasonParser).reason;
      }
      
      public function get reasonString() : String
      {
         switch(this.reason)
         {
            case const_1623:
            case const_1406:
               return "banned";
            case const_1357:
               return "concurrentlogin";
            default:
               return "logout";
         }
      }
   }
}
