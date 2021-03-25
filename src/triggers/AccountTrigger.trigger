trigger AccountTrigger on Account (before insert, after insert, before update, after update, before delete) {
    System.debug('Trigger.OperationType ' + Trigger.OperationType);
    //isInsert && isBefore, no need to call DML operation to insert
    if(Trigger.isBefore && Trigger.isInsert){
        
        for(Account a:  Trigger.New){
            a.Description = 'updated from before trigger (insert)';
        }
    }
    //isInsert && isAfter, if sObject should update immediately after insert, DML statement is must
    else if(Trigger.isAfter && Trigger.isInsert){
        List<Account> accList = new List<Account>();
        List<Account> acList = [SELECT Id, Description from Account where Id in : Trigger.New];
        for(Account a:  acList){
            a.Description = 'updated from after trigger (update)';
            accList.add(a);
        }
        update accList; 
         
    }
    //IsBefore and IsUpdate required no DML statement is required it happens automatically
    else if(Trigger.isBefore && Trigger.isUpdate){ 
        for(Account a : Trigger.New){
            if(Trigger.oldMap.get(a.Id).AccountNumber == '123'){
            a.Description = 'updated from Trigger.isBefore and isUpdate event -- new';
            }
            else{
                a.Description = 'Hello world';
            }
        }
    }
    //after update the trigger is read only no update can be done, but, can be insert or updated  other objects
    else if(Trigger.isAfter && Trigger.isUpdate){
        List<Task> insertTask = new List<Task>();
        //Trigger.oldMap.get(acc.ID)
        for(Account a : Trigger.New){
            Task t = new Task(Subject = 'Created after and update trigger');
            t.WhatId = a.id;
            t.Priority = 'Normal';
            t.Status = 'Not Started';
            t.OwnerId = UserInfo.getUserId();
            t.ActivityDate = Datetime.now().date();
            insertTask.add(t); 
        }
         system.debug(insertTask);
        if(insertTask.size() >0){
            insert insertTask;
        }
    }
    else if(Trigger.isBefore && Trigger.isDelete){
        for(Account a : Trigger.old){
            if(a.AccountNumber == '123'){
               // a.adderror('You can\'t delete which is 123 account number');
               ApexPages.addMessage(new ApexPages.message(ApexPages.Severity.FATAL,'You can\'t delete which is 123 account number'));
            }
        }
    }

    
}