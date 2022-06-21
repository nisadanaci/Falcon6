//requirements go to Rest callout Part 1 haziran 3 videos and slayt Create a senario


public with sharing class AnimalsCallout {
    private static string GET_ANIMALS_ENDPOINT = CalloutInfo__mdt.getInstance('GET_ANIMALS').Endpoint__c;
    private static string POST_ANIMALS_ENDPOINT = CalloutInfo__mdt.getInstance('POST_ANIMALS').Endpoint__c;
    private static string HTTP_GET = 'GET';
    private static string HTTP_POST = 'POST';
    public static void fetchAnimals(){
       //1. prepare request
       HttpRequest Request = new HttpRequest();
       request.setEndPoint(GET_ANIMALS_ENDPOINT);
       request.setMethod('GET');//we are doing get callout we just want to get to information at a time ony one external system give us at time a one we need to information about to API  Method in s GET. this is the method name "gET"

       //2. prepare http
       Http http = new http(); //http is a class we created the new instance

       //3.send request, received response (return us to response )
       HttpResponse response = http.send(request); //request end point and method Line 12- 13 ten geliyor
       system.debug('status' + response.getStatus());
       system.debug('status code ' + response.getStatusCode());


       //4. process the response
       if(response.getStatusCode() == 200){
           string animalsJSON = response.getBody(); //inside the body Json information return Json and json always string sothat we create string 
           system.debug(animalsJSON);
           
           //Deserializes the JSON string into collections of primitve data types.
          //if the response is unknown to us, JSON deseriliaze it to Map<string,object>
          //Type cast
           object ob = jSON.deserializeUntyped(animalsJSON);
           map<string, object> results = (Map<string, object>)ob;
           system.debug('results = ' + results);
           
           Object ob1 = results.get('animals');
           List<object> animals = (List<object>) ob1;
           system.debug('============= object animals list START======');
           for(object a : animals){
               system.debug(a);
           }
           system.debug('============ object animals list END=====');

       }else{
           //NOT SUCCESS
           system.debug('something went wrong people');
       }
   }
    public static HttpResponse fetchAnimals2(){
    //1. prepare request
    HttpRequest Request = new HttpRequest();
    request.setEndPoint('https://th-apex-http-callout.herokuapp.com/animals');
    request.setMethod('GET');//we are doing get callout we just want to get to information at a time ony one external system give us at time a one we need to information about to API  Method in s GET.

    //2. prepare http
    Http http = new http(); //http is a class we created the new instance

    //3.send request, received response (return us to response )
    HttpResponse response = http.send(request);
    system.debug('status' + response.getStatus());
    system.debug('status code ' + response.getStatusCode());


    //4. process the responce
    if(response.getStatusCode() == 200){
        //deseriliaze the JSON string into collections of custom class(AnimlasCalloutResponse).
        AnimalsCalloutResponse animalResponse =(AnimalsCalloutResponse)JSON.deserialize(response.getBody(), AnimalsCalloutResponse.class);
        string animalsJSON = response.getBody();
        system.debug(animalsJSON);
        system.debug('============= object animals list START======');
        list<string> allAnimals = animalResponse.animals;
        for(string a: allAnimals){
            system.debug(a);
            system.debug('============ object animals list END=====');
        }
    }else{
        //NOT SUCCESS
        system.debug('something went wrong people');
    }
    
    return response;

}
    public static HttpResponse postAnimal(){
    //1. prepare request
    HttpRequest Request = new HttpRequest();
    request.setEndPoint(POST_ANIMALS_ENDPOINT);
    request.setMethod('POST');//we are doing get callout we just want to get to information at a time ony one external system give us at time a one we need to information about to API  Method in s GET.
    string jsonReq = '{"name": "fluffykins"}';
    Request.setBody(jsonReq);
    Request.setHeader('Content-Type', 'application/json');
    //2. prepare http
    Http http = new http(); //http is a class we created the new instance

    //3.send request, received response (return us to response )
    HttpResponse response = http.send(request);
    system.debug('status' + response.getStatus());
    system.debug('status code ' + response.getStatusCode());


    //4. process the responce
    if(response.getStatusCode() == 201){
        system.debug('response '+ response.getStatusCode());
        //deseriliaze the JSON string into collections of custom class(AnimlasCalloutResponse).
        AnimalsCalloutResponse animalResponse =(AnimalsCalloutResponse)JSON.deserialize(response.getBody(), AnimalsCalloutResponse.class);
        string animalsJSON = response.getBody();
        system.debug(animalsJSON);
        system.debug('============= object animals list START======');
        list<string> allAnimals = animalResponse.animals;
        for(string a: allAnimals){
            system.debug(a);
            system.debug('============ object animals list END=====');
        }
    }else{
        string result = 'failed';
        
        //NOT SUCCESS
        system.debug('something went wrong people');
    }
    return response;
}
 
}