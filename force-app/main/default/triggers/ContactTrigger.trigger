trigger ContactTrigger on Contact (before insert, after insert, before update, after update, after delete, after undelete) {
    Set<Id> accountIds = new set<Id>();
    If(trigger.isAfter){
        if(trigger.isInsert || trigger.isUpdate || trigger.isUndelete){
            for(contact c: trigger.new){
                if(c.AccountId != null){
                    accountIds.add(c.AccountId);
                }
            }
        }
        if(trigger.isUpdate || trigger.isDelete){
            for(contact c: trigger.old){
                if(c.AccountId != null){
                    accountIds.add(c.AccountId);
                }
            }
        }
        if(!accountIds.isEmpty()){
            list<Account> accList = [Select id, number_of_contacts__c, (select id from contacts) From Account where id in :accountIds];
            if(!accList.isEmpty()){
                list<Account> updateAccList = new List<Account>();
                for(account eachAcc: accList){
                    list<Contact> listContacts =eachAcc.Contacts;

                    Account acc =new Account();
                    acc.id = eachAcc.id;
                    acc.number_of_contacts__c = listContacts.size();
                    updateAccList.add(acc);
                }
                if(!updateAccList.isEmpty()){
                    update updateAccList;
                }
            }
        }
    }

if(trigger.isBefore && trigger.isUpdate){
    ContactTriggerHandler.contactUpdateValidation1(Trigger.New, Trigger.Old, Trigger.NewMap, Trigger.OldMap);
}
if(trigger.isBefore && trigger.isUpdate){
    ContactTriggerHandler.contactUpdateValidation2(Trigger.New, Trigger.Old, Trigger.NewMap, Trigger.OldMap);
}


//     if(Trigger.isBefore){
//         system.debug('we are before trigger');
//         if(Trigger.isInsert){
//             system.debug('before insert trigger called');
//         }
//         if(Trigger.isUpdate){
//             system.debug('before update trigger called.');
//         }
//      }

//     if (Trigger.isAfter){
//     system.debug('we are after trigger');
//     if(Trigger.isInsert){
//         system.debug('after insert trigger called');
//     }
//     if(Trigger.isUpdate){
//         system.debug('after update trigger called.');
//     }
//  }
}