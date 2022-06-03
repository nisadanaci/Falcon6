Account a = new Account();
a.Name = 'Mone';
a.Phone = '';
a.AnnualRevenue = 909099834;


account b = new Account();
b.Name ='Lisa';
b.Phone= '986545632';
b.Site ='';

list<Account> ab = new list<account>{a,b};
string AccountJSON1 = JSON.serialize(ab);
system.debug(AccountJSON1);