public with sharing class StudentController {
    @AuraEnabled
    public static list<Student__c> getStudents(string keyword){
        string input = '%'+keyword+ '%';
        return [SELECT Id, Name, Roll_Number__c, Email__c, Country__c, Mobile__c, State_Province__c, Street_Address_1__c, Street_Address_2__c, Postal_Code__c, Class__c, City__c FROM Student__c WHERE Postal_Code__c LIKE :input WITH SECURITY_ENFORCED];
    }

}
