public class AccountTriggerHandler {
public static void updateVipForALLContacts(list<Account> accTriggerNew,
List<Account> accTriggerOld,
map<id, Account> accTriggerNewMap,
map<id, Account> accTriggerOldMap){

system.debug('update all contact\'s VIP field is updated');

Set<id> setAccIDs = new set<id>();

    for(account eachAcc : accTriggerNew){
      If(eachAcc.VIP__c != accTriggerOldMap.get(eachAcc.id).VIP__c){
      setAccIDs.add(eachAcc.id);
      }
}
//get list of for Accounts where VIP is updated
  List<Contact> listContacts =[Select id, name, Account.id, VIP__c from Contact where account.id in :setAccIDs];

//NOW we want to update CONTACTS records.

  For(contact eachContact : listContacts){
//fetch VIP fieald of account for this contact
//if accounts VIP is false, we get false, if true, we will get true here.
    Account newAccount = accTriggerNewMap.get(eachContact.Account.id);
    Boolean newAccVip = newAccount.VIP__c;
//set account's VIP to contact
    eachContact.VIP__c = newAccVip;
}
      if(!listContacts.isEmpty()){
  update listContacts;
}
}

 public static void updateAccountDescription(list<Account> accTriggerNew,
                                            List<Account> accTriggerOld,
                                            map<id, Account> accTriggerNewMap,
                                            map<id, Account> accTriggerOldMap){
    system.debug('inside handler method');                                      
    for(account eachAcc: accTriggerNew){
      boolean updateDesc = false;

      //if(trigger.isInsert)
      if(accTriggerOldMap == null && eachAcc.Active__c == 'Yes'){
        updateDesc = true;
        //eachAcc.Description = 'Account is now active. Enjoy!';
      }

       if(accTriggerOldMap != null){
      Account oldAccount = accTriggerOldMap.get(eachAcc.ID);
                                            
        string oldAccountActive = oldAccount.Active__c;
        //check if active is updated
        //active is changed to 'Yes'
        if(eachAcc.Active__c == 'Yes' &&  oldAccountActive != 'Yes'){  //  OldMap(id, account[id, name, annualRevenue,Active__c...]))                              
          updateDesc = true;
          //eachAcc.Description = 'Account is now active. Enjoy!';
        }
      }

      if(updateDesc){
        eachAcc.Description = 'Account is now active. Enjoy!';
      }
    }                                     
  }

}