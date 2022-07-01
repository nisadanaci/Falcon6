@RestResource(urlMapping = '/LeadCustomBulk/*')
global with sharing class CustomLeadBulkAPI {
    @HttpPut
    global static list<lead> upsertLeads(list<createLeadWrapper> leads){
        list<lead> listLead =new list<lead>();
        for(createLeadWrapper ld: leads){
            Lead c = new Lead();
            c.FirstName = ld.fName;
            c.LastName = ld.lName;
            c.Company = ld.company;
            c.Status = ld.lStatus;
            c.id = ld.id;
    
            listLead.add(c);
            }
            upsert listLead;
            return listLead;
    }
}