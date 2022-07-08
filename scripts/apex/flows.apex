Account acc = [SELECT id, OwnerId FROM Account WHERE Industry = 'Biotechnology' LIMIT 1];
system.debug(acc.id);
Map<String, object> inputs = new Map<String, object>();
//neden map formatinda cunku ben key value seklinde gonderiyorum degerleri
inputs.put('AccountId', acc.Id);
inputs.put('varAccountOwnerId', acc.OwnerId);
Flow.Interview flow = new Flow.Interview.Account_Updates(inputs);
flow.start();