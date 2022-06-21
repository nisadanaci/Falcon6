@isTest
public with sharing class customContactAPITest {
    @isTest
    private static void getContactTest(){
        //1. prepare data
        Account a = new Account();
        a.name = 'accTestName';
        insert a;

        Contact c = new Contact();
        c.accountId = a.id;
        c.LastName = 'testContact';
        insert c;


        //prapre RESt Request
        RestRequest Request = new RestRequest();
        Request.requestURI = '/ContactCustom/'+c.Id;
        Request.httpMethod = 'GET';

        RestContext.request = Request;

        Test.startTest();
        Contact cReturn = CustomContactAPI.getContactId();
        Test.stopTest();

        system.assert(c.Retrun.Name == c.Name);
    }
}
