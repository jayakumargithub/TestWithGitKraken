trigger ContactUpdateEmail on Contact (before update) {
 
    
  
          //  ContractTriggerHandler.myMethod(Trigger.new);
             
      public static Boolean myVar = true;


        for(Contact c: Trigger.new){
            System.debug('Trigger count' + Trigger.new.size());
            c.Email ='test1@gmail.com';
            System.debug('Variable value:'+ myVar);

        }
        
        if(myVar){
            myVar = false;
            System.debug('MyVar : ' +myVar);
        }
     
     
}