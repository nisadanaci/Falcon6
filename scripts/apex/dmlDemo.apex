List<Case> listcase = new list<Case>();
for(integer i=0; i< 205; i++){
    case c = new case();
    c.Subject = 'There is a bug';
    c.Description = 'Resolve';
    c.Status = 'New';
    c.Origin ='Web';
    listcase.add(c);

}
insert listcase;

 List<Case> updatecase = [select id, subject, status from case where status = 'New'];
for(Case eachcase: updatecase){
    eachcase.Status = 'Working';
}
update updatecase;


DmlDemo.dmllnsertDemo_stndObj();
DmlDemo.dmllnsertDemo_cstmObj();
DmlDemo.dmlUpdateDemo_1();
DmlDemo.dmlUpdateDemo_3();
DmlDemo.dmlUpdateDemo_2();
DmlDemo.dmlMultipleRecordInsert_right();
system.debug('doing dml now');
DmlDemo.dmlMultipleRecordInsert_right2();
system.debug('done dml now');





// List<Account> listacc = new List<Account>();
// For(integer i=0; i<250; i++){
//     account a = new account();
//     a.lastName = 'TestFlow'+i;
//     a.PersonEmail= 'adamhagi85@gmail.com';   
//     listacc.add(a);
// }
// insert listacc;


// List<account> accList = [SELECT id, lastName from Account Where lastName like 'TestFlow%'];
// delete accList;