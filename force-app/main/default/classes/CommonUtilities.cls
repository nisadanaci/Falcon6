public with sharing class CommonUtilities {
    public static void CreateLog(String logType, string targetName, string message, string stackTrace, string targetType){
        Application_Log__c  log = new Application_Log__c();
        log.Log_Type__c = logType;
        log.Target_Name__c = targetName;
        log.Message__c = message;
        log.Stack_Trace__c = stackTrace;
        log.Target_Type__c = targetType;
        insert log;





        
    }
}
