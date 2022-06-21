//json to Account list of Account in JSON
String jsonAccountString='{"Name":"JsonToApex", "Type":"Propect", "AnnualRevenue":50}';  //in reality we will get this from external API When it comes to Json is apex
 // we are converting this data 1 account we need to use JSON deseriliaze
Object ob=JSON.deserialize(jsonAccountString, Account.class);
//and we have to 2 parameters 1. parameter is JSon 2. apex class classes have variables (fields) Those class variable declare it 
//Burda bir donusturme yapmis obj seklinde gelen veriyi sitedigim objecte donusturebilirm. burda Account a donusturmusum. we have to convert mean "Type Cast"  Account.class ==> has fields (annualRevenue Name type exmpl) we have to specified a class (if to convert object to class means type cast)
Account acc=(Account)ob;
insert acc;


string jsonAccountString2 = '[{"Name":"HERO", "Type":"Prospect", "AnnualRevenue":50},{"Name":"Json To Apex HERO", "Type":"Prospect", "AnnualRevenue":500}]';
Object ob1 = JSON.deserialize(jsonAccountString2, List<Account>.class);
List<Account> listacc = (List<Account>)ob1;
insert listacc;



// //Run Animals Callout
// AnimalsCallouts.fetchAnimals();



//]
// { "attributes":{
// // "type": "Account"                            "KEY"         VAlue
// // "Name" = 'Mone';                             Attributes    String
  //"Phone" = null;                                              Boolean number sobj     
// // "AnnualRevenue" = 909099834;
// }
// }
//]