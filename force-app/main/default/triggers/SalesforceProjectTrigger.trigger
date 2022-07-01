trigger SalesforceProjectTrigger on Salesforce_Project__c (before insert, before update, after insert, after update) {
    if(trigger.isAfter && trigger.isInsert){
        system.debug('trigger called');
        SalesForceProjectTriggerHandler.updateProjectDescription(trigger.newMap.keySet());
        system.debug('Future method called already. second method calling.');
        SalesForceProjectTriggerHandler.createDefaultSalesforceTicket(trigger.new);
    }
    if (trigger.isAfter && trigger.isUpdate) {
        SalesforceProjectTriggerHandler.spCompletedStatus(Trigger.New, Trigger.Old, Trigger.NewMap, Trigger.OldMap);
    }
}