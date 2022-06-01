trigger CaseTrigger on Case (before insert, before update, after insert, after update) {
    
    // if(trigger.isInsert){
    //    system.debug('before insert case'); 
    // }
    // if(trigger.isUpdate){
    //     CaseTriggerHandler.countTriggerExecution++;
    //     system.debug('# of times trigger executed: ' + CaseTriggerHandler.countTriggerExecution);

    //     CaseTriggerHandler.countRecordsUpdated += trigger.size;
    //     system.debug('# of records updated: ' + CaseTriggerHandler.countRecordsUpdated);
    // }

}