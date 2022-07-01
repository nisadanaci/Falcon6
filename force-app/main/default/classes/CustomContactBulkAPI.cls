@RestResource(urlMapping = '/ContactCustomBulk/*')
global with sharing class CustomContactBulkAPI {
    @httpPost
    global static list<contact> createContacts(
        List<createContactWrapper> contacts
    ) {
        list<contact> listContacts = new list<contact>();
        for(createContactWrapper con: contacts){
            Contact c = new contact();
            c.FirstName = con.fName;
            c.LastName = con.lName;
            c.Email = con.emailId;
            c.Phone = con.phoneNumber;
            c.AccountId = con.accountId;
            listContacts.add(c);
        }
        insert listContacts;
        return listContacts;
    }
}