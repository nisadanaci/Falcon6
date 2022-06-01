DMLDemo2.dmlMultipleRecordUpdate_right();

//Delete 
List<Account> listacc = [select id from account order by createddate desc limit 20];
Delete 