public with sharing class ContactCalloutFuture {
    @future(callout=true) //Cunki APi call running operation oldugu icin bu methodu kullaiyoruz
    public static void sendDataGo(List<id> contactIds){
        //get data and prepare Json
        list<contact> con = [select name, email, gender__c, status__c from contact where id = :contactIds[0]];

    UserInfoWrapperClass info = new UserInfoWrapperClass();
    info.name = con[0].Name;
    info.gender = con[0].Gender__c;
    info.email = con[0].Email;
    info.status = con[0].Status__c;
  
    //populate info with details from soql
    string jsonString = json.serialize(info);
    system.debug(jsonString);

    string endpoint = 'https://gorest.co.in/public/v2/users';
    string token = 'f3abba7499110ac0438df78daf27ff84253595fc3962e31b641864038cf05335';

    HttpRequest request = new HttpRequest();
      request.setHeader('Content-Type', 'application/json; charset=utf-8');
      request.setHeader('Authorization', 'Bearer f3abba7499110ac0438df78daf27ff84253595fc3962e31b641864038cf05335');
      request.setEndpoint(endpoint);
      request.setMethod('POST');
      request.setBody(jsonString);

    Http http = new Http();
    HttpResponse response = http.send(request);

    if (response.getStatusCode()==200) {
        System.debug(response.getStatus() + response.getBody());


    }else{
        System.debug(response.getStatus() + response.getBody());
    }



    }
    
}
/*@InvocableMethod 
    public static void sendEmailToOwner(List<String> listUserNames) {
        callEmailSend(listUserNames);
    }
    @future
    public static void callEmailSend(List<String> listUserNames) {
*/

//mitravictor1@yahoo.com
