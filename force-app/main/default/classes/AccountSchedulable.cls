public with sharing class AccountSchedulable implements Schedulable {
    public void execute(SchedulableContext sc){
        //AccountsBatch ab = new AccountsBatch();
        database.executeBatch(new AccountsBatch());
    }
}
