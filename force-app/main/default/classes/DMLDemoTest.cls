@isTest
public class DMLDemoTest {
    @isTest
    private static void dmlDemoTest1(){
        DmlDemo.dmllnsertDemo_stndObj();

        list<Account> listAcc = [select id, name from account];
        system.assertEquals(1, listAcc.size());
        system.assertEquals('Soft innovas', listAcc[0].Name);
    }
    @isTest
    private static void dmlDemoUpdate2Test(){
        Account acc = new Account();
        acc.Name = 'SoftInnovas Inc.';
        insert acc;
        DmlDemo.dmlUpdateDemo_2();
        list<Contact> listContact = [select id, Name from contact];
        system.assertEquals(1, listContact.size());
        system.assertEquals('Biden', listContact[0].Name);
    }
}
