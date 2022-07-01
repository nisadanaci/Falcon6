@RestResource(urlMapping = '/ContactCustom/*')//custom contact end point .com a kadar olan yer postman de url sonra si uri(custom api olustruyorum boylece)
global class CustomContactAPI {
    
 @HTTPGet //Annotate method with 
   global static contact getContactId(){ //in get method does not has parameter
    system.debug('custom contact api call success.');
    RestRequest Request = RestContext.request;  //methodlari var apexguide bak 
    string uri = Request.requestURI; //requestURI bir method
    system.debug('URI : ' + request.requestURI);//request uri get to ID
    integer idStartIndex = uri.lastIndexOf('/')+1;
    system.debug('idStartIndex:' + idStartIndex);
    string contactId = uri.substring(idStartIndex);
    system.debug('contactId: ' + contactId);
    contact c = [select name, email, phone, account.name from contact where id = :contactId];
    return c;
   }



@HttpPost
   global static id createContact(
    string fName, string lName, string emailId, string phoneNumber, string accountId
   ){
        Contact c =new contact();
        c.FirstName = fName;
        c.LastName = lName;
        c.Email = emailId;
        c.Phone = phoneNumber;
        c.AccountId = accountId;
        insert c;
        return c.id;
   }

@HttpDelete
   global static String deleteContact(){
   //Get the request send from extarnal recipient
   RestRequest Request = RestContext.request;
   //Get the URI of the request  Fetch contact Id from URI
   //ContactCustom/0038c00002lolLMAAY  This is uri
   string uri = request.requestURI;
   system.debug('uri: ' +uri);
   //GET the starting index of the Id which starts after '/'
   integer idStartIndex = uri.lastIndexOf('/')+1;
   system.debug('idStartIndex: ' + idStartIndex);
   //Get id of the record based on the start index 
   String contactId = uri.substring(idStartIndex);
   system.debug('contactId: '+ contactId);
   Contact con  = new Contact(Id = contactId);
   delete con;
   return 'Contact with Id ' + contactId+ ' deleted';

}
@HttpPatch     //We are updating getting contactId Url
   global static String updateContact(String emailId, String phoneNumber){
   //Get the request send from extarnal recipient 
   RestRequest Request = RestContext.request;

   //Get the URI of the request  Fetch contact Id from URI
   string uri = request.requestURI;
   system.debug('uri: ' +uri);

  //GET the starting index of the Id which starts after '/'
   integer idStartIndex = uri.lastIndexOf('/')+1;
   system.debug('idStartIndex: ' + idStartIndex);

    //Get id of the record based on the start index 
    String contactId = uri.substring(idStartIndex);
    system.debug('contactId: '+ contactId);
    Contact con =new contact();
    con.id = contactId;
    con.Email = emailId;
    con.Phone = phoneNumber;
    update con;
    return 'Contact with id ' + contactId + ' updated successfully';
}

@httpPut
   // global static String upsertcontact(Contact con){
   //    String returnString;
   //    If(con.id == null){
   //       returnString = ' Contact created with Id:';
   //    }else{
   //       returnString = ' Contact updated with id: ';
   //    }
   //    upsert con;
   //    return returnString+con.Id;

//bu code ta yazilabilir. bulk yapamk icin after json request
     global static List<id> upsertContact(List<contact> cons){

      upsert cons;
      List<id> ids = new list<id>();
      For(contact con: cons) {
         ids.add(con.id);
     }
        return ids;
     }
   }




//we are actually got to from to uri 
//fetch to contact details 

//we are external developer giving me Api  iam external developre call this api you are giving contact detail ishoul taht contact details 
//not this give me anything returning me anything
//sumit check to code
//we are againg check in Api we are nor returning conteculaor contact 
//we are not doing soql query
//we shold wrtite soql query
//we should fetch ID Return thst contact
//we will get to contact Id From URI 

//Neden Standart API varken Custom API yapıyoruz?
// standart API ın yeterli olmadığı zamanlarda, daha esnek çözemler için. Mesela çoklu record DML için olabilir. Standart da bu özellik direkt olarak verilmiyor

// Inbound call yapıldığında. orgumuz ilgili call ’a ( request’e  ) cevap olarak ne göndermeli?
// API ne gönderiyorsa onu.
// Yani standart olarak verilen API ve bizim şu an custom olarak yaptığımız API ne response gönderecekse onu.

// Postman şu an sanki 3rd bir app yada developer gibi bize request göndererek. Hazırladığımız API’ın çalışıp çalışmadığını, çalışıyorsa ne response ettiğini, Hangi uri yada güvenlik yöntemleriyle çalıştığını görmemizi sağlıyor.

// Gördüğünüz gibi API ı customize ettikçe nasıl request yapılacağını da belirlemiş oluyorsunuz.
// İş hayatında bu API’ı siz tasarlayıp sonrasında sizin org unuza nasıl request yapılacağınının dokümanını request yapacak developer için hazırlamanız gerekmekte.
// Böylece hazırladığınız bu doküman sayesinde developerlar sizin API ınıza callout yapabilsin. İstediğini gibi sonuçlar alabilsin.

// { upsert contact using customcontac apex rest postman de paylasti boddy kisminda
    // "cons":[
    //     {
    //         "FirstName":"J",
    //         "LastName":"TT",
    //         "Email":"JT@gmail.com",
    //         "id": "0035j00000Ssoe0AAB" id leri degistir
    //     },
    //     {
    //         "FirstName":"Q",
    //         "LastName":"T",
    //         "Email":"QT@gmail.com"
            
    //     },
    //     {
    //         "FirstName":"C",
    //         "LastName":"TT",
    //         "Email":"CT@gmail.com"
    //     }
    //     ]
    //  }