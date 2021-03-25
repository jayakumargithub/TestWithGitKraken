trigger ProjectTrigger on Project__c (after insert, before update, before delete) {
    
    
    Map<Id, Project__c> oldProjectMap = new Map<Id,Project__c>();
    if(Trigger.isDelete || Trigger.isUpdate){ 
        
        for (Project__c proj : Trigger.Old){
            oldProjectMap.put(proj.id, proj);
        }
    }
    System.debug('oldProjectMap:' + oldProjectMap.size());
    if(Trigger.isInsert && Trigger.isAfter){ 
        set<Id> sites = new set<Id>();
        for(Project__c p : Trigger.New){
            if(p.In_Service_A__c != null){
                sites.add(p.Site__c);
            }
        }
        system.debug(sites);
        List<Site__c> sitesList = [SELECT Id, Site_Status__c from Site__c where Id in : sites];
        List<Site__c> sitesToUpdate = new List<Site__c>();
        for(Site__c s : sitesList){
            s.Site_Status__c = 'On Air';
            sitesToUpdate.add(s);
        }
        if(sitesToUpdate.size() > 0 ){ 
            update sitesToUpdate;
        }
    }
    else if(Trigger.isUpdate && Trigger.isBefore){
        for(Project__c p : Trigger.New){
            if(oldProjectMap.get(p.Id).In_Service_A__c != null ){
                
            }
        }
    }
    if(Trigger.isDelete ){
        List<Project__c> deletedProjects = Trigger.old;
        
        system.debug('deltedProjects :' + deletedProjects);
    }
}