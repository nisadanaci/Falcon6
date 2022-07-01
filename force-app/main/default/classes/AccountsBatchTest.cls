@isTest
public with sharing class AccountsBatchTest {
    @isTest
    private static void testMethod1(){
        list<account> listAcc = new list<account>();
        //2.create first instance
        account acc = new account();
        acc.name = 'TEST ACC 0';
        acc.AccountNumber = 'asci-1';
        acc.Active__c = 'Yes';
        //system.debug('before saving acc = '+ acc);
        //3.add instance in list
        listAcc.add(acc);
    
        for (Integer i = 1; i < 500; i++) {
            account acc2 = new account();
            acc2.name = 'TEST ACC'+i;
            acc2.AccountNumber = 'asci-1 '+i;
            acc2.Active__c = 'Yes';
            listAcc.add(acc2);
            
        }
        System.debug('size of list ' + listAcc.size());
        if(!listAcc.isEmpty()){
            insert listAcc;
        }
    //END STEP 1
    //step 2
    test.startTest();
    AccountsBatch ab = new AccountsBatch();
    database.executeBatch(ab, 501);
    //Alternative way of calling batchable apex: database.executeBatch(new AccountsBatch(),501);
    test.stopTest();

    //2)) : END::
    // 2)) :
    List<Account> accounts = [select id, description from account where Active__c != 'No' limit 100];
    for(Account acc3: accounts){
        system.assert(acc3.Description.containsIgnoreCase('batch'));
    }
    
    }
    }