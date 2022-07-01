public class DMLDemo2 {
    public static void dmlMultipleRecordUpdate_right(){
        //1.get list of acc via query
        List<Account> listAcc = [select id, name, Description from Account order by CreatedDate limit 150];

        //2. create new list of account which will be used to update redorcds
        list<account> updateAccounts = new list<account>();

        //3.for-each loop
        for(Account acc : listAcc){
            //4. set field value
            acc.name += 'via B.0';
            acc.Description= 'Update via Bulk DML';
            //5.add in updateAcc list
            updateAccounts.add(acc);
        }
        //6.(optinal but recommend Check if not empty)
        if(!updateAccounts.isEmpty()){
            update updateAccounts;
            System.debug(updateAccounts);
        }
    }
}