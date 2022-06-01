
@isTest
public class AccountTriggerTest {
@isTest
private static void testMethod1(){
    Account acc1 = new account();
        acc1.name = 'SI Test';
        acc1.Industry = 'Energy';
        acc1.Active__c = 'Yes';

        Account acc2 = new account();
        acc2.name = 'UI Test';
        acc2.Industry = 'Energy';
        acc2.Active__c = 'No';

        Account acc3 = new account();
        acc3.name = 'PI Test';
        acc3.Industry = 'Banking';
        acc3.Active__c = 'No';

        list<Account> listAcc = new list<Account>{acc1, acc2, acc3};
        //dml will fire trigger code
        insert listAcc;

        for(Account acc: listAcc){
            //acc.Description = 'updated';
            acc.Active__c = 'Yes';
        }
        //dml will fire trigger code
        update listAcc;
        //to assert. always fetch records by Soql.
        //check here if Description is updated to 'Account is now Active. Enjoy
        List<Account> accounts = [Select id, name, description from Account];
        system.assertEquals('Account is now active. Enjoy!', accounts[0].Description);
      }
@IsTest
private static void testMethod2(){
    Account acc1 = new account();
    acc1.name = 'SI Test';
    acc1.Industry = 'Energy';

    Account acc2 = new account();
    acc2.name = 'UI Test';
    acc2.Industry = 'Energy';

    Account acc3 = new account();
    acc3.name = 'PI Test';
    acc3.Industry = 'Banking';

    list<Account> listAcc = new list<Account>{acc1, acc2, acc3};
    insert listAcc;

    List<contact> listContact = new List<Contact>();
    for (Integer i = 0; i < 300; i++) {
        Contact cnt = new Contact();
        cnt.LastName = 'Test SOQL';
        if(i< 100) {
            cnt.AccountId = acc1.id;
        }else if(i <200){
            cnt.AccountId = acc2.id;
        }else if(i < 300){
            cnt.AccountId = acc3.id;
        }
        listContact.add(cnt);
        
    }
    insert listContact;

    for(Account acc: listAcc){
        acc.vip__c = true;
    }
    update listAcc;

    list<contact> contacts = [Select id, name, vip__c from contact];
    system.assertEquals(true, contacts[0].vip__c);
}
}
