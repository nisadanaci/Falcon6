public with sharing class AccountQueueableExample implements Queueable{
    public List<Account> listAccount;
    //parameterized constructor
    public AccountQueueableExample(list<Account> accList){
        listAccount = accList;
    }
    public void execute(QueueableContext qc){
        for(account a : listAccount){
            a.Name = a.Name + '-- SI';
        }
        update listAccount;
    }
}