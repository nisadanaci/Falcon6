public with sharing class AccountInvocable {

    @InvocableMethod(label='Delete Closed Opps'
    description='Deletes all the closed opportunities when account goes inactive or hold'
    category='Account')
    public static void deleteOpportunities(List<id> accountIds){
        List<Opportunity> opp = [SELECT id FROM Opportunity 
                                Where AccountId IN :accountIds 
                                AND StageName IN ('Closed Won', 'Closed Lost')];
        If(!opp.isEmpty()){
         delete opp;
        }                        
        
   }
}
