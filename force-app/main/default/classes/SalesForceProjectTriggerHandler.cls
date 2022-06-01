public class SalesForceProjectTriggerHandler {
    //create default salesforce ticket record
    public static void createDefaultSalesforceTicket(List<Salesforce_Project__c> spTriggerNew){
          //create one empty List of salesforce ticket
        try{
            List<Salesforce_Ticket__c> newList = new List<Salesforce_Ticket__c>();
            //for each project create new ticket
            For(Salesforce_Project__c eachSp: spTriggerNew){
                DefaultTicketInfo__c ticketInfo = DefaultTicketInfo__c.getOrgDefaults();
                //create new St
                Salesforce_Ticket__c st = new Salesforce_Ticket__c();
                st.Subject__c = ticketInfo.Subject__c;
                st.Description__c = ticketInfo.Description__c;
                st.Salesforce_Project__c = eachSp.id;
                st.Priority__c = 'High'; //Not use this we have learned catch try 
                //add list eger bunu comment out yaparsam hata kodu calisiyor.
                newList.add(st);
                    }
                    //insert onlyif we habe one at least one record in the list
                    If(!newList.isEmpty()){
                        insert newList;
        }
      } catch (Exception ex){
          for (salesforce_project__c  sp: spTriggerNew) {
              sp.addError('Error in default ticket creation. Please contact your administrator');
          }
      }
    }



        //When salesforce project is created ---> update is description and append 'OUpdate from future to actual description implement using future methods.'
        @future
        public static void updateProjectDescription(set<id> setProjectIds){//burda bir id Setlist var Neden Set cunku Id uniq Email ve Id icin 
            List<Salesforce_Project__c> lstSP = [Select id, description__c from Salesforce_Project__c where id in :setProjectIds];
            for(Salesforce_Project__c sp : lstSP){ //bu id ye bagli olarak bir soql yazdim nerden cekecegimi yazmisim where den sonra nereden cekecegimi yaziyorum elimde id olana verinin her bilgisine ulasirim. future yazinca method asynchronous olarak calisiyor.
                sp.Description__c += ', Updated from FUTURE'; //just add to old one
            }
            system.debug('sp to update = ' + lstSP);
            update lstSP;
        }




        public static void spCompletedStatus(List<Salesforce_Project__c> spTriggerNew, 
        List<Salesforce_Project__c> spTriggerOld,
        Map<id, Salesforce_Project__c> spTriggerNewMap,
        Map<id, Salesforce_Project__c> spTriggerOldMap) {
            //get set<id> where status is changed.
            set<id> spIds = new set<id>();
            for (salesforce_project__c sp : spTriggerNew) {
                //if new record status != old record status
                //status is changed to 'Completed'
                 if(sp.Status__c != spTriggerOldMap.get(sp.id).Status__c
                 && sp.Status__c == 'Completed'){
                     spIds.add(sp.Id);
                 }
            }
            if(!spIds.isEmpty()){
              updateTicketStatusCompleted(spIds);
            }
        }
        @future
        private static void updateTicketStatusCompleted(set<id> spIds) {
            List<Salesforce_Ticket__c> listST = [select id, status__c, salesforce_project__c from Salesforce_Ticket__c where Salesforce_Project__c in :spIds and status__c != 'Completed'];
            for (salesforce_ticket__c st : listST) {
                st.Status__c = 'Completed';
            }
            if (!listST.isEmpty()) {
                update listST;
            }
        }
     }

  //Benim kosum viatabin kini yapistirdim check et.
    //     public static void spCompletedStatus(List<Salesforce_Project__c> spTriggerNew, List<Salesforce_Project__c> spTriggerOld,
    //     Map<id, Salesforce_Project__c> spTriggerNewMap,
    //     Map<id, Salesforce_Project__c> spTriggerOldMap){
    //         //get set<id> where status is changed.

    //         set<id> spIds = new Set<id>();

    //         for(Salesforce_Project__c sp: spTriggerNew){
    //             //if new record status != old recor status
    //            if(sp.Status__c != spTriggerOldMap.get(sp.id).Status__c && sp.Status__c == 'Completed'){
    //                spIds.add(sp.id);
    //            } 
    //         }
    //         if(!spIds.isEmpty()){
    //             //call future method
    //             updateTicketStatusCompleted(spIds);
    //         }
    //     }
    //     @future
    //     public static void updateTicketStatusCompleted(set<id> spIds){
    //         List<Salesforce_Project__c> listST =[Select id, status__c, salesforce_project__c from Salesforce_Ticket__c where Salesforce_Project__c in :spIds and status__c != 'Completed'];

    //         for(Salesforce_Ticket__c st: listST){
    //             st.Status__c = 'Completed';
    //         }
    //         if(!listST.isEmpty()){
    //             update listST;
    //         }
    //     }
    //    }

