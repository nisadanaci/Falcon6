@isTest
public with sharing class AccountQueueableExampleTest {
   @TestSetup 
   static void makeData(){
       list<account> accounts = new list<Account>();
       for (Integer i = 0; i < 100; i++) {
           account a = new account(name = 'Test Account' + i, Phone='165897456');
           accounts.add(a);
       }
       insert accounts;
   }
   @IsTest
   static void methodName(){
       list<account> accs = [Select id, name from Account];
       Test.startTest();
        AccountQueueableExample aq = new AccountQueueableExample(accs);
        system.enqueueJob(aq);  
       Test.stopTest();
       //Validate the job run
       integer count = [select count() from Account where Name like '%SI%'];
       system.assertEquals(100, count);
       
   }
       
   
}