@RestResource(urlMapping = '/LeadCustom/*')
global with sharing class CustomLeadAPI {
    @HTTPGet //Annotate method with 
    // Fetch lead Information - Based on the Id passed in the Url, this method will return the
    // lead record info
        global static lead getLeadId(){
         system.debug('lead contact api call success.');
         RestRequest Request = RestContext.request;  //methodlari var apexguide bak 
         string uri = Request.requestURI; //requestURI bir method
         system.debug('URI : ' + request.requestURI);
         integer idStartIndex = uri.lastIndexOf('/')+1;
         system.debug('idStartIndex:' + idStartIndex);
         string leadId = uri.substring(idStartIndex);
         system.debug('leadId: ' + leadId);
         lead c = [select name from lead where id = :leadId];
         return c;
        }

        //    Create lead record- based on the information provided in the json create a new lead.
// Note: first name, last name, company, and lead status are mandatory to provide.
        @HttpPost
        global static string createLead(string fName, string lName, string company, string lStatus){
            lead l = new lead();
            l.FirstName = fName;
            l.LastName = lName;
            l.Company = company;
            l.Status = lStatus;
            insert l;
            return 'creates a new lead record and returns its id' + l.id;
            //  +

        }
        // Delete lead record - Based on the Id passed in the Url, this method will delete the lead record

       @httpDelete
       global static String deleteLead(){
        system.debug('custom lead api call success.');
         //GET URI
         RestRequest request = RestContext.request;
         string uri = request.requestURI;
         system.debug('URI : ' + request.requestURI);
         //Fetch contact ID from URI
         //    /ContactCustom/0035j00000SesCxAAJ
         integer idStartIndex = uri.lastIndexOf('/')+1;
         system.debug('idStartIndex: ' + idStartIndex);
         string leadId = uri.substring(idStartIndex);
         system.debug('leadId: ' + leadId);
         
         lead l = new lead();
         l.id = leadId;
 
         delete l;
         return 'Lead deleted with id: ' + leadId;
       }

    //    Update lead record - Based on the Id passed in the Url and information in the json, this
// method will update the existing lead record.

       @httpPatch
       global static string updateLead(string fName, string lName, string company, string lStatus){
        RestRequest request = RestContext.request;
        string uri = request.requestURI;
        string Id = uri.substringAfterLast('/');
        system.debug('URI : ' + request.requestURI);

        lead idLD = new lead(id=Id, FirstName=fName, LastName=lName, Company=company, Status=lStatus);
       
        update idLD;
        return 'The lead with ' + id + ' id has been successfully updated';
       }

//        Upsert multiple lead records - Based on the json passed. it should have provision to add
// or multiple lead records in single api call.
       @HttpPut
       global static list<id> upsertLeads(list<lead> leads){
        upsert leads;
        list<id> ids = new list<id>();
        for(lead ld: leads){
          ids.add(ld.id);
       }
       return ids;
       
    }      
       
}