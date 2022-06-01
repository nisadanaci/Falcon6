//anonymous file
//create new instance of Batch Class
AccountsBatch ab = new AccountsBatch();
//execute batch with default batchSize(200)
database.executeBatch(ab, 10);