public class SoqlDemoChildParent {
    public static void childParent_Soql1(){
    List<Contact> listCnt = [Select id, name, Account.Name from Contact where Account.Industry = 'Energy'];
    for (Contact eachContact : listCnt) {
        string accName = eachContact.Account.Name;
        System.debug('contact name is ' + eachContact.Name + ', its acc is ' + accName);

    }
}

//parent child example
// select id, name, project_name__c, (select name, subject__c, priority__c from salesforce_tickets__r) from salesforce_project__c

//print the annual revenue and name of all accounts of type  'custome-direct'
//and also print the opportunity Name and Amount for the respective 'closed won'opportunities
public static void sampleSoql4(){
    List<Account> accountWithOppList = new List<Account>();
    accountWithOppList = [Select name, AnnualRevenue, (Select name, Amount from opportunities where StageName = 'Closed Won') from account where type = 'Customer - Direct'];
    //list<account>
    //==> list<opportunities
    for(Account eachAcc : accountWithOppList){
        System.debug('Account name ' + eachAcc.name + 'its annual revenue is=> ' + eachAcc.AnnualRevenue);
        for (opportunity opp : eachAcc.opportunities) {
         System.debug('opportunity Name ' + opp.name + ', opportunity Amount ' + opp.amount);   
        }
        System.debug('-----------------');
    }
}
//VITAP's CODE Just in case i put there it is a little different.
// public static void sampleSoql4() {
//     list<account> accountWithOpplist =[select name, annualrevenue, (select name, amount from opportunities where stagename = 'Closed Won') from account where type = 'Customer - Direct'];
//     //list<account>
//         //--> list<oppotunities>
//     for (account eachAcc : accountWithOpplist) {
//         system.debug('acc name is ' + eachAcc.name + ', annual revenue is ' + eachAcc.AnnualRevenue);
//         List<Opportunity> eachAccOpps = eachAcc.Opportunities;
//         for (Opportunity opp : eachAccOpps) {
//             system.debug(' opp name ' + opp.Name + ', opp amount ' + opp.Amount); //YES
//         }
//         system.debug('-----------------');
//     }
// }
// }
}