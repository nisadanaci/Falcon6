public with sharing class AccountQueueableExample implements Queueable{
    public List<Account> listAccount;
    //constructor acceptin list of accoutns.
    //parameterized constructor
    public AccountQueueableExample(list<Account> accList){
        listAccount = accList;
    }
    //implemnet execute method is mandotory
    public void execute(QueueableContext qc){
        for(account a : listAccount){
            a.Name = a.Name + '-- SI';
        }
        update listAccount;
    }
}
