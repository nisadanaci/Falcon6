@isTest
public with sharing class TestStudentController {
    @isTest
    public static void testGetStudent(){
        List<Student__c> std = new List<Student__c>();
            for(Integer i=0; i<200; i++){
                Student__c st = new Student__c();
                st.Name = 'Test Student';
                st.Email__c = 'test@gmail.com';
                st.Country__c = 'United State';
                st.State_Province__c = 'IN';
                st.Postal_Code__c= '45236';
                //st.Class__c = '24';
                std.add(st);
            }
            insert std;

            test.startTest();
            List<Student__c> slist = [Select Name, Class__c, Postal_Code__c, Email__c, Country__c, State_Province__c FROM Student__c];
            test.stopTest();
            System.assertEquals(200, slist.size());
    }
}
