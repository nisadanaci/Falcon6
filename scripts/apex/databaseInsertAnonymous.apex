//create accounts
Account acc1 = new Account();
acc1.Name = 'SI Test';
acc1.Industry = 'Energy';
acc1.Active__c = 'No';

Account acc2 = new Account();
acc2.Name = 'SI Test';
acc2.Industry = 'Energy';
acc2.Active__c = 'No';

// Account acc3 = new Account();
// acc3.Name = 'SI Test';
// acc3.Industry = 'Energy';
// acc3.Active__c = 'No';

//required field is missing
Account acc12x = new Account();
Account acc12y = new Account();
Account acc12z = new Account();

List<Account> listAcc = new List<Account>{acc1, acc2, acc12x, acc12y, acc12z};

list<Database.SaveResult> results = Database.insert(listAcc, false); //false mean 2 accounts will be inserted YES and 3 accounts will be NO if we pass true 5 accounts will be NO 

//iterate Severesutl array

for(Database.SaveResult eachResult : results){
    if(eachResult.isSuccess()){
        //successfuly inserted
        //Handle insertion
        System.debug('Account successfully inserted, Account id is: ' + eachResult.getId());
    }
    else{
        //Error encountered
        system.debug('Errors: ' + eachResult.getErrors());
    }


} 
