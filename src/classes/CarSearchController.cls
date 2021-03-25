public with sharing class CarSearchController {
    @AuraEnabled
    public static List<Car__c> getCars(string carCategoryTypeId){ 
        system.debug('carCategoryTypeId ' + carCategoryTypeId);
        List<Car__c> cars;
     
        //PMD plugin foce to check access of the user
        if((carCategoryTypeId == null ||   string.isEmpty(carCategoryTypeId))  && Contact.getSObjectType().getDescribe().isAccessible()){ 
            cars = [SELECT Id, Name, Picture__c, Contact__r.Name, Geolocation__latitude__s,Geolocation__longitude__s from Car__c WHERE Available_For_Rent__c = true];

        }else { 
            if(Contact.getSObjectType().getDescribe().isAccessible()){
                cars = [SELECT Id,Name,Picture__c, Contact__r.Name, Geolocation__latitude__s, Geolocation__longitude__s from Car__c WHERE Type__c = :carCategoryTypeId AND Available_For_Rent__c = true];
        }
    }
     
        return cars;
    }
 }