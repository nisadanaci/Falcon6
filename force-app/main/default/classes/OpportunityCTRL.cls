public with sharing class OpportunityCTRL {
    @AuraEnabled(cacheable=true)
    public static List<Opportunity> getOpp(string stage){
        List<Opportunity> opp = [SELECT Name, Type, StageName, Amount, CloseDate 
                                FROM Opportunity 
                                WHERE StageName = :stage 
                                WITH SECURITY_ENFORCED];

        return opp;
    }
}

//return [SELECT Name, Type, StageName, Amount, CloseDate FROM Opportunity WITH SECURITY_ENFORCED];
//boyle de yazabilirz
