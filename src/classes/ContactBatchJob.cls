global class ContactBatchJob implements 
    Database.Batchable<sObject>  {
    
    // instance member to retain state across transactions
    Boolean myVar = true;
    //Integer idx = 0;
    global Database.QueryLocator start(Database.BatchableContext bc) {
         return Database.getQueryLocator('SELECT Id,Name,Email from Contact where lastname like \'%My Name %\'');
    }
    global void execute(Database.BatchableContext bc, List<Contact> scope){
        List<Contact> contacts = new List<Contact>();
        for(Contact c: scope){
            c.Email = 'jk@gmail.com';
            contacts.add(c);
           // System.debug('myVar ' + idx + ':' + myVar);
        }
        if(myVar){
            myVar = false;
        }
        update contacts;
    }    
    global void finish(Database.BatchableContext bc){
        
    }    
}