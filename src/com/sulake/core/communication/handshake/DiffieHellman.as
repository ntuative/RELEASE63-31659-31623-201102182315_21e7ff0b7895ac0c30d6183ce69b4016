package com.sulake.core.communication.handshake
{
   import com.hurlant.math.BigInteger;
   import com.sulake.core.utils.ErrorReportStorage;
   
   public class DiffieHellman implements IKeyExchange
   {
       
      
      private var var_885:BigInteger;
      
      private var var_2403:BigInteger;
      
      private var var_1692:BigInteger;
      
      private var var_2402:BigInteger;
      
      private var var_1346:BigInteger;
      
      private var var_1693:BigInteger;
      
      public function DiffieHellman(param1:BigInteger, param2:BigInteger)
      {
         super();
         this.var_1346 = param1;
         this.var_1693 = param2;
      }
      
      public function init(param1:String, param2:uint = 16) : Boolean
      {
         ErrorReportStorage.addDebugData("DiffieHellman","Prime: " + this.var_1346.toString() + ",generator: " + this.var_1693.toString() + ",secret: " + param1);
         this.var_885 = new BigInteger();
         this.var_885.fromRadix(param1,param2);
         this.var_2403 = this.var_1693.modPow(this.var_885,this.var_1346);
         return true;
      }
      
      public function generateSharedKey(param1:String, param2:uint = 16) : String
      {
         this.var_1692 = new BigInteger();
         this.var_1692.fromRadix(param1,param2);
         this.var_2402 = this.var_1692.modPow(this.var_885,this.var_1346);
         return this.getSharedKey(param2);
      }
      
      public function getPublicKey(param1:uint = 16) : String
      {
         return this.var_2403.toRadix(param1);
      }
      
      public function getSharedKey(param1:uint = 16) : String
      {
         return this.var_2402.toRadix(param1);
      }
   }
}
