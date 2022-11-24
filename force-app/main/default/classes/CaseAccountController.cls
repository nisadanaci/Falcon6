public with sharing class CaseAccountController {
    @AuraEnabled(cacheable=true)
    public static List<Case> getCaseByAcc(string accId) {
        try {
            
         return [SELECT CaseNumber, Type, Status, ClosedDate 
                FROM Case 
                WHERE AccountId = :accId 
                AND (IsClosed = false OR CLosedDate > LAST_MONTH) WITH SECURITY_ENFORCED
                ORDER BY LastViewedDate DESC];
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    
    
    }
}
