trigger AccountTrigger on Account (before insert, before update, after insert, after update) {

// //On user Updating account record, if billing address is changed, update all its child contacts mailling address filed same as account billing address
// //Which object: Account
// //What Operation: Update
// //Which Event: After
// If(Trigger.isAfter & Trigger.IsUpdate){
//     Set<Id> accIdsBillingAddChanged = new set<Id>();
//     for(Account accRecNew: Trigger.New){
//         Account accRecOld = Trigger.OldMap.get(accRecNew.id);
//         If(accRecNew.BillingStreet!= accRecOld.BillingStreet){
//             accIdsBillingAddChanged.add(accRecNew.id);
//         }
//     }
//     //This set accIdsBillingAddChanged will have accuntIds which got billing address changed
// List<Account> accWithContacts = [SELECT id, Name,billingcity,billingstreet,billingstate,billingcountry,(Select id, name from Contacts) from Account where Id in :accIdsBillingAddChanged];
// List<Contact> conListUpdate = new List<Contact>();
    
//     For(Account acc: accWithContacts){
//         List<Contact> conOfTheLoopAccount = acc.contacts;
//         For(Contact con: conOfTheLoopAccount){
//             con.MailingStreet = acc.BillingStreet;
//             con.MailingCity = acc.BillingCity;
//             con.MailingState = acc.BillingState;
//             con.MailingCountry = acc.BillingCountry;
//             conListUpdate.add(con);
//         }
//     }
//     if(conListUpdate.size()>0){
//         Update conListUpdate;
//     }
// }





















// if(trigger.isAfter && trigger.isUpdate){

//     AccountTriggerHandler.updateVipForALLContacts(Trigger.New, Trigger.Old, Trigger.NewMap, Trigger.OldMap);
// }


// if(trigger.isBefore){
//     system.debug('Before insert/update trigger on Account object');

//     AccountTriggerHandler.updateAccountDescription(Trigger.New, Trigger.Old, Trigger.NewMap, Trigger.OldMap);
//     system.debug('before insert/update trigger end.');
//     map<id, account> newAccountMap =trigger.newMap;
//     map<id, account> oldAccountMap =trigger.oldMap;
//     For(Account eachAcc: Trigger.new){
//         boolean updateDesc =false;
//         if(trigger.isInsert && eachAcc.Active__c=='Yes'){
//         //JUST set the field value
//             updateDesc =true;
//             }
//         if(trigger.isUpdate){
//             Account oldAccount = oldAccountMap.get(eachacc.Id);
//             string oldAccountActive =oldAccount.Active__c;
//             if(eachAcc.Active__c=='Yes' && oldAccountActive !='Yes'){
//                 updateDesc =true;
                
//                 // system.debug(eachAcc.Active__c);
//             }
//             if(updateDesc){
//                 eachAcc.Description ='Account is now active Enjoy!';
//             }
//         }
//     }
//  }



    // if(trigger.isAfter && trigger.isUpdate){
    //     map<id, account> accNewMap = trigger.newMap;
    //     map<id, account> accOldMap = trigger.oldMap;
    //     set <id> setOfAccId = accNewMap.keySet();
    //     integer countWebsiteUpdated =0;
    //     //system.debug('After update trigger of Account object.');

    //     for(ID eachId: setOfAccId){
    //         //get old account
           
    //         account oldAcc =accOldmap.get(eachId);
    //         string oldWebSite = oldAcc.Website;

    //         //get new account;
    //         account newAcc =accNewmap.get(eachId);
    //         string newWebSite = newAcc.Website;

    //         if(oldWebSite != newWebSite){
    //             system.debug('For Account ' + newAcc.Name + ',new WebSite is ' + newWebSite);
    //             countWebsiteUpdated++;
    //         }
    //     }
    //    system.debug('# of account website updated = ' +countWebsiteUpdated);

    // }






    // if(trigger.isAfter && trigger.isUpdate){
    //     system.debug('After update trigger of Account object.');
    //     map<id, account> accNewMap = trigger.newMap;           map<id, account> accOldMap = trigger.oldMap;
    //     set <id> setOfAccId = accNewMap.keySet();
    //     //for Loop on Set<ID>--> keyset() for a map.
    //     for(Id eachId : setOfAccId){
    //         system.debug('=============');
    //         system.debug('each id = ' + eachId);
    //         //get value using .get(key) method

    //         Account newAccount = AccNewMap.get(eachId);
    //         system.debug('New account name = '+ newAccount.Name);

    //         Account OldAccount =AccOldMap.get(eachId);
    //         system.debug('Old account name = ' + oldAccount.Name);

    //     }
    // }


//         map<id, account> trgNewMap = trigger.newMap;
//         map<id, account> trgOldMap = trigger.oldMap;

//         if(trigger.isBefore && trigger.isInsert){
//             system.debug('=========== BEFORE INSERT=========');
//             system.debug('Before insert OLD MAP = ' + trgOldMap);
//             system.debug('Before insert NEW MAP = ' + trgNewMap);
//         }
    
//         if(trigger.isAfter && trigger.isInsert){
//             system.debug('=========== AFTER INSERT=========');
//             system.debug('After insert OLD MAP = ' + trgOldMap);
//             system.debug('After insert NEW MAP = ' + trgNewMap);
//     }

//         if(trigger.isBefore && trigger.isUpdate){
//     system.debug('=========== BEFORE UPDATE=========');
//     system.debug('Before update OLD MAP = ' + trgOldMap);
//     system.debug('Before update NEW MAP = ' + trgNewMap);
// }
//         if(trigger.isAfter &&  trigger.isUpdate){
//     system.debug('=======AFTER UPDATE=========');
//     system.debug('AFter update OLD MAP = ' + trgOldMap);
//     system.debug('AFter update NEW MAP = ' + trgNewMap);
// }




    // if(trigger.isAfter){
    //     if(trigger.isUpdate){
    //         List<account> oldAccounts = trigger.old;
    //         List<account> newAccounts = trigger.new;

    //         for(account oldAcc: oldAccounts){
    //             system.debug('Old acc is = '+ oldAcc.Id + 'old accName= ' + oldAcc.Name);
    //         }
    //         for(account newAcc: newAccounts){
    //             system.debug('new acc is= '+ newAcc.id + 'new acc name= '+ newAcc.Name);
    //         }
    //     }
    // }



    // If(Trigger.isBefore && Trigger.isInsert){
    //     system.debug('trigger.old before insert= ' + trigger.old);
    // }
    // If(Trigger.isAfter && Trigger.isInsert){
    //     system.debug('trigger.old after insert= ' + trigger.old);
    // }
    // If(Trigger.isBefore && Trigger.isUpdate){
    //     system.debug('trigger.old before update= ' + trigger.old);
    // }
    // If(Trigger.isAfter && Trigger.isUpdate){
    //     system.debug('trigger.old after update= ' + trigger.old);
    // }

    // If(trigger.isBefore && trigger.isUpdate){
    //     system.debug('trigger.new before update= '+ trigger.new);
    //      List<Account> newAccounts = trigger.new;
    //      for(account acc : newAccounts){
    //         system.debug('Account id is= '+ acc.Id + ', account is name ' + acc.name + ',acc.modifed date = '+ acc.LastModifiedDate); 
    //     }
    // }
    // If(trigger.isAfter && trigger.isUpdate){
    //     system.debug('trigger.new after update= '+ trigger.new);
    //      //List<Account> newAccounts = trigger.new;
    //      for(account acc : trigger.new){
    //         system.debug('Account id is= '+ acc.Id + ', account is name ' + acc.name + ',acc.modifed date = '+ acc.LastModifiedDate); 
    //     }
    // }
   

    // If(trigger.isBefore && trigger.isInsert){
    //     system.debug('Trigger.new before insert= '+ trigger.new);
    // }
    // if(trigger.isInsert && trigger.isAfter){
    //     system.debug('trigger.new after insert/update= '+ trigger.new);
       //trigger.new -> record(s) which were responsible for firing the trigger
        //system.debug('all new accounts - '+ newAccounts);

        
        // List<Account> newAccounts = trigger.new;
        // system.debug('total account inserted ' + newAccounts.size());
        // for(account acc : newAccounts){
        //     system.debug('Account id is= '+ acc.Id + ', account is name ' + acc.name);
       
        // }
    
    // system.debug('---------START------------');
    // system.debug('trigger.isBefore = ' + trigger.isBefore);
    // system.debug('trigger.isAfter = ' + trigger.isAfter);
    // system.debug('trigger.isInsert = ' + trigger.isInsert);
    // system.debug('trigger.isUpdate = ' + trigger.isUpdate);

    //Will run only on before insert.
    // If(Trigger.isInsert && Trigger.isBefore){
    //     system.debug('before insert account trigger fired');
    // }
    // //Will run only on before update
    // if(Trigger.isBefore && Trigger.isUpdate){
    //     system.debug('before update trigger called.');
    // }
    // //Will run only on after insert
    // if(Trigger.isInsert && Trigger.isAfter){
    //     system.debug('before update trigger called');
    // }
    // //will run only on after update
    // if(Trigger.isAfter && Trigger.isUpdate){
    //     system.debug('after update trigger called');
    // }
   // system.debug('---------END------------');


//When will .isBefore TRUE?
//system.debug('trigger.isBefore= '+ trigger.isBefore);
//system.debug('trigger.isAfter= '+ trigger.isAfter);

//When wil .isAfter TRUE?
//    if(Trigger.isAfter){
//     system.debug('after insert trigger called');

//     if(Trigger.isBefore){
//     system.debug('before insert account trigger fired');
//     }
//system.debug('==================');
//    }
 
}