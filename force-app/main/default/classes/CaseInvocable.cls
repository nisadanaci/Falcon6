public with sharing class CaseInvocable {
    @invocableMethod(label='Send Email & Save Activity'
    description='Sends an email and saves the same as an activity'
    category='Case')
    public static void sendEmail(List<FlowInput> inputs) {
        FlowInput input = inputs[0];
        List<Messaging.SingleEmailMessage> msgs = new List<Messaging.SingleEmailMessage>();
        Messaging.SingleEmailMessage msg = new Messaging.SingleEmailMessage();
        msg.setTargetObjectId(input.contactId);
        msg.setSaveAsActivity(true);
        msg.setSubject('Case Created: ' + input.caseNumber);
        msg.setPlainTextBody('Hello there, \n A case has been created for you to answer your query. '
                               + 'One od our customer representative is going to reachout you. Stay tuned!'
                               + '\n Thank you!');
        msgs.add(msg);
        Messaging.sendEmail(msgs);                       
        Messaging.SendEmailResult[] results = Messaging.sendEmail(msgs);
        for(Messaging.SendEmailResult result : results){
            if(result.isSuccess()){
                //create success log
                system.debug('Successfully sent!');
            }else{
                //create a log
                system.debug(result.getErrors());
            }
        }
    }
    //bunlarin required olmasi flow da action da send email save activity icinde case number contactd kismi required oluyor.
    public class FlowInput{
        @InvocableVariable(label='Case Number' description='To Get Case Number' required=true)
        public string caseNumber;

        @invocableVariable(label='Contact Id' description='To Get Contact Id' required=true)
        public id contactId;
    }

    /*account name, list<contactname> & List<opp name>
    public class DataClass {
        public string accName;
        public List<string> accName;
        public List<String> conNames;
        public List<String> oppNames;

      }*/
}
//Bu class in icine baska bir invocable method yazamassiniz ama inner class olusturabilirsiniz.
//Encapsulation wrapper class buna ornek
//wrapper class sayesinde bir parametre olarak gorunen seyi bir den fazla parametre varmis gibi kullanabiliriz
//InvocableMethod için birden fazla giriş gerektiğinde wrapper class kullanmamız gerekir.
// Çünkü bu method tek parametre alabilir.
// Hatırlarsanız bunu wrapper da konuşmuştuk.
// ayrıca wrapper class inner olarak yani kullanılacak class ın içinde de oluşturulabilir ki Invocable da bu gerekli bir durum. @InvocableMethod anotati ve @InvocableVariable anotati beraber çalışacaklar.


// kısacası: invoke method tek parametre alabilir. Bu parametreyi artırmak inner class ta wrapper la mümkün.