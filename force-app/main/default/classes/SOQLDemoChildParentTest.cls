@isTest
public class SOQLDemoChildParentTest{
    @TestSetup //A kind of like that, need to know what data is required for testing the whole class
    private static void setUpData(){  //su an burda prepare data yapiyoruz.
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
    }
    //bu yukarida yaptigimiz islem
    //Test class for soqlDemoChildParent.Cls
    // Test childToParent_Soql1() && sampleSoql4()
    //we are doing soql in both these methods.
    //so,we have to create multiple records in our test method before calling these methods.
    // if we need data for testing more than one method, then we can use the same data in the same testing class using @testsetup right?
    
    @isTest
    private static void soqlDemotest1(){

       //To ensure that we are able to execute without hitting governor limits, Apex provide us a way to RESET governor limits.
       //Test.startTest() and test.stopTest()
       //To reset governor limit
        //Use these methods before actually testing our functionality.
        //Can be used only Once in each test method.
        //it will become mandotory to use for Testing Async APEX.
       // Interview questions.
        
        //in preparing data, we consumed FEW governor limits.
        //ex: 2 dmls 303 dML rows
        //some heap size, some cpu time etc.Wewiil write it most of the test.Actually testing over code 
        test.startTest();
        SoqlDemoChildParent.childParent_Soql1();
        test.stopTest();      
    }
    @isTest
    private static void sampleSoql4Test(){
        list<Account> listAccounts = [select id, name, type from Account];//we are fethcing accounts 3 accounts all of them we are updating customer direct.we are writing the same test fetch islemini bu sekilde yapiyoruz soql cekerek.
        for(Account acc: listAccounts){
            acc.Type = 'Customer - Direct';
        }
        update listAccounts; //update the accounts 
        List<Opportunity> createopps = new List<Opportunity>(); //each of these accounts create opportunities we rae doing data preparetion
        for (Integer i = 0; i < 300; i++) {
            Opportunity o = new Opportunity();
            o.Name = 'oppp1';
            o.StageName = 'Closed Won';
            o.CloseDate = date.today(); //required in opportunity so that we wrote here.
            if(i < 100){
                o.AccountId = listAccounts[0].id; //burda fetching yaaaaapiyoruz accountId ile
            } else if(i < 200){
                o.AccountId = listAccounts[1].id;
            }else if(i < 300){
                o.AccountId = listAccounts[2].id;
            }
            createopps.add(o);
            
        } //calling method [testing]
        insert createopps;
        Test.startTest();
        SOQLDemoChildParent.sampleSoql4();
        test.stopTest();
    }
}
//sampleSoql4()
//bu yukarida ikinci method ta yaptiklarimiz
//we have account and contact records(check all field properly)
//fetch sccount record
//update'type of accounts
//and crate related opportunity records.


//Interview question is might be***
//Nursen's Note About governer limit
//1.use @istest annotation for the method you are testing
// create dummy data with multiple records to test (no access to org data),
// Reset the governor limits with test.starttest() & test.stop.test()
// Call the method you are testing
// Check if your method gives the expected values as intended by using .assertEquals(expected value, the values the tested method gives)