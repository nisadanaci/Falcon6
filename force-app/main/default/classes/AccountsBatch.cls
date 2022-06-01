//mandatory start, execute, and finish method

public class AccountsBatch implements Database.Batchable<SObject>, database.stateful{ 

 //datalari store etmek icin bu methodu kullaniyoruz.bunu kullanirsam islem kac kere yapilirsa countun ici doluyor kullanmassa count hep 0 gelecek

    public integer count = 0;  //variable tanimladim

    public Database.QueryLocator start(Database.BatchableContext bc){ 
        //birkere calisyor bu satirdaki sabit QueryLocator ve batchableContext cektigimiz data 
        database.QueryLocator q1 = database.getQueryLocator([Select id, description, Active__c From Account]);//calisacagimiz veriyi tutuk ve return e gonerdik bu sorgunun variable typi 
        system.debug(q1);
        return q1;
    }
    //execute method will take list of Sobject which we are querying in start method
    public void execute(Database.BatchableContext bc, List<account> scope){
        List<Account> updateAccounts = new List<Account>();//list create ettik
        for(Account acc: scope){//for dongusu olusturduk
            if(acc.Active__c != 'No'){
            acc.Description += '....updated via batch apex!';
            updateAccounts.add(acc);
            count ++;//kac recordu update etmisim. eger database.stateful u yazmassam countu dolduramiyorum.batch apex e implement edilmis bir class
            }
            

        }
        if(!updateAccounts.isEmpty()){  //listem bos mu dolu mu control ettim
            system.debug('count in execute method: ' + count);
            update updateAccounts;    // ve listemi update ettim
        }
        
    }
    //finish method will run after the ebtire batch is over.
    public void finish(Database.BatchableContext bc){                                    //finish method 1 kere kullaniliyor.
        system.debug('done with updating ALL the Accounts');
        //how many records we actually updated.
        system.debug('# of records updated: ' + count);
        //kac tane record update edildiyse toplamini yazdirmisim
    }
}
