@isTest
public class ContactTriggerTest {
@isTest(SeeAllData=true)
    public static void Test(){
        Boolean myVar = true;
        integer count = 0;
       List<Contact> contacts = [SELECT Id, Email from Contact where LastName like '%My%'];
        
        for(Contact c : contacts){
            c.Email = 'test2@gmail.com';
            System.debug('myVar value: ( ' + count +' )' + myVar);
            count++;
        }
        if(myVar){
            myVar = false;
            System.debug('myVar value1: ( ' + count +' )' + myVar);
        }
        
    }
}