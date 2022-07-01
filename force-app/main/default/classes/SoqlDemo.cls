public class SoqlDemo {
   public static void AccountSoql_1(){
       //SOQL Query always return the list<sObject>
       List<Account> listAcc = [select id, name from account where name like '%A%'];
       system.debug('account list = ' + listAcc);
       system.debug('# of accounts = ' + listAcc.size());

       //SOQL can return only sObject if it is returning ONLY 1 record 
     Account latestAcc = [select name, website from account order by createdDate desc limit 1];
       //here we are returning only one record (using One Limit)
       //so it can be assigned to account instead of List<Account>
       system.debug('latest account created is ' + latestAcc);
  }
  public static void AccountSoql_2(){
      Account latestAcc = [select name, phone, AccountNumber from account order by createdDate desc limit 1];
      system.debug('latest account creaed is ' + latestAcc);
      
      string accName = latestAcc.Name;
      string accphone = latestAcc.Phone;
      system.debug('acc name is ' + accName);
      system.debug('acc phone is ' + accphone);
      system.debug('acc account number is ' + latestAcc.AccountNumber);
  }
  public static void AccountSoql_3(){
    List<account> listAcc = [select id, name, phone, accountNumber from account order by CreatedDate DESC];
    system.debug('all accounts ' + listAcc);

    for (account eachAccount : listAcc) {
      //1st record for the 1st iteration.
      id accid = eachAccount.id;
      string accName = eachAccount.Name;
      string accPhone = eachAccount.Phone;

      //will this work?
      string shippingAdd = eachAccount.ShippingCity;
      system.debug('shipping city = ' + eachAccount.ShippingCity);
      system.debug('accName = ' + accName + ', phone is ' + accPhone);
      system.debug('account number is ' + eachAccount.AccountNumber);
    }
  }

  public static void accountSOQL_Filter(){
    string accNameFilter = 'sForce';
    List<Account> listAcc = [select id, name, AccountNumber, ShippingAddress from account where name = :accNameFilter];
    system.debug(listAcc);
  }
  public static void accountSOQL_Filter(string accNameFilter){
    list<account> listAcc = [select id, name from account where name = :accNameFilter];
    system.debug(listAcc);
  }
}