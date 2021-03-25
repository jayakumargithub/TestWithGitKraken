public class ContractTriggerHandler {
    
    public static Boolean myVar = true;
   
    
    
    public static void myMethod(List<Contact> contacts){
        integer count = 0;
      

        System.debug('total contacts cts: ' + contacts.size());
        List<Contact> contactToUpdate= new List<Contact>();
        for(Contact c: contacts){
           System.debug('cts: '+ contacts.size());
            System.debug('getQueryRows():' + System.Limits.getQueryRows());
            c.Email ='test1@gmail.com';
            //System.debug('MyVar : '+ count + ' - ' +myVar);
            contactToUpdate.add(c);
            //count++;
        }
system.debug('contactToUpdate.size() ' + contactToUpdate.size());        
        if(myVar){
            myVar = false;
            System.debug('MyVar : '+ count + ' - ' +myVar);
        } 
        
        if(contactToUpdate.size() >0){
            System.debug('Updating....' + contactToUpdate.size());
          //  update contactToUpdate;
        }
    }
 
}