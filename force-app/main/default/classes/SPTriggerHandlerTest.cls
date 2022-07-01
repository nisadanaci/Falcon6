@isTest
public with sharing class SPTriggerHandlerTest {
@isTest
    private static void testMethod1(){
//1.prepare Data
    Salesforce_Project__c sp = new Salesforce_Project__c();
        sp.project_Name__c = 'Teach asynch  is Falcons';
        sp.Description__c ='All 40% are greate learner, still';

        Salesforce_Project__c sp1 = new Salesforce_Project__c();
        sp1.project_Name__c = 'Teach Future is Falcons';
        sp1.Description__c ='All 40% are greate learner, still';


        List<Salesforce_Project__c> lstSP = new List<Salesforce_Project__c>{sp, sp1};
        insert lstSP;

        set<id> spIds = new set<id>{sp.id, sp1.id};

        test.startTest();
        SalesForceProjectTriggerHandler.updateProjectDescription(spIds);
        test.stopTest();

        List<Salesforce_Project__c> sps = [Select id, description__c from Salesforce_Project__c];
        system.assert(sps[0].Description__c.containsIgnoreCase('future'));
   }
}