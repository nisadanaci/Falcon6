@isTest
public with sharing class customLeadApiTest {
    @isTest
    private static void getleadTest(){
        //1.Prepare Data
        Lead c = new Lead();
        c.LastName = 'test lead 1';
        c.Company = 'ABC0';
        c.Status = 'Open - Not Contacted';
        // c.id = leadId;
        insert c;


        RestRequest Request = new RestRequest();
        Request.requestURI = '/LeadCustom/' + c.Id;
        Request.httpMethod = 'GET';
        RestContext.request = Request;


        Test.startTest();
        Lead cReturn = CustomLeadAPI.getLeadId();
        Test.stopTest();

        system.assert(cReturn.Name == c.Name);
    }
}