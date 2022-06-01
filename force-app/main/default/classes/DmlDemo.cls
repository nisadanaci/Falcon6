public class DmlDemo {
    //insert record of standart object
   public static void dmllnsertDemo_stndObj(){
       //1.creating new instance of account object
       Account acc = new Account();
       //2.set fielad values
       acc.Name = 'Soft innovas';
       acc.Site = 'www.SoftInnovas.com';
       acc.Description = 'Salesforce Bootcamp';
       //Now comes to DML
       insert acc;
       system.debug(acc);
   }

   public static void dmllnsertDemo_cstmObj(){
       Salesforce_project__c sp = new salesforce_project__c();
       sp.project_name__c = 'Teach DML to Falcons';
       sp.Description__c = 'All 40% are great learners';
       insert sp;
       system.debug(sp);
   }
   //pdate record right after inserting
   public static void dmlUpdateDemo_1(){
       //update record
       Account acc = new Account();
       acc.Name = 'S';
       insert acc;
       system.debug('inserted ' + acc);
       acc.name = 'Salesforce Inc.';
       update acc;
       system.debug('updated ' + acc);
   }
    public static void dmlUpdateDemo_3(){
       account acc = [select id, name from account where name = 'Soft innovas' order by createdDate desc limit 1];
       //update account
       acc.name = 'SoftInnovas Inc.';
       update acc;
       system.debug('updated acc '+ acc);
    
   }
   public static void dmlUpdateDemo_2(){
       account acc = [select name from account where name = 'SoftInnovas Inc.' limit 1];
       system.debug('acc id is ' + acc.Id);
       //create a contact for this account
       contact cnt = new contact();
       cnt.lastName = 'Biden';
       cnt.AccountId = acc.Id;
       insert cnt;
       system.debug('insert ' + cnt);
   }

   //create list<sObject> and create one instance of sobject
   //create another instance of sobj
   //add both instance in list<sobject> and insert-----[Demo]


   public static void dmlMultipleRecordInsert_right(){
       //create list of sobject
       list<account> listAcc = new list<account>();
       //2.create first instance
       account acc1 = new account();
       acc1.name = 'SoftInnovas-10Sept v';
       acc1.AccountNumber = 'ACSI-1';
       acc1.Active__c = 'Yes';
       system.debug('before saving acc = '+ acc1);
       //3.add instance in list
       listAcc.add(acc1);

       //add 15 more accounts in list using for loop


       account acc2 = new account();
       acc2.name = 'bulk acc 2';
       listAcc.add(acc2);

       account acc3 = new account();
       acc3.name = 'bulk acc 3';
       listAcc.add(acc3);

       insert listAcc;

   }
   public static void dmlMultipleRecordInsert_right2(){
    //create list of sobject
    list<account> listAcc = new list<account>();
    //2.create first instance
    account acc = new account();
    acc.name = 'SoftInnovas 30-April22 v0';
    acc.AccountNumber = 'ACSI-1';
    acc.Active__c = 'Yes';
    //system.debug('before saving acc = '+ acc);
    //3.add instance in list
    listAcc.add(acc);

    for (Integer i = 1; i < 4; i++) {
        account acc2 = new account();
        acc2.name = 'SoftInnovas 30-April22 v'+i;
        acc2.AccountNumber = 'ACSI-1 '+i;
        acc2.Active__c = 'Yes';
        listAcc.add(acc2);
        
    }
    System.debug('size of list ' + listAcc.size());
    if(!listAcc.isEmpty()){
        insert listAcc;
    }


}
}