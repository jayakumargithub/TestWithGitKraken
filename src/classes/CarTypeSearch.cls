public with sharing class CarTypeSearch {
     @AuraEnabled
     public static List<car_type__c> getCarTypes(){
         return [SELECT Id, Name from car_type__c];
     }
}