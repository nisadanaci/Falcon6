public with sharing class AnimalsCallout {
   public static void fetchAnimals(){
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
           string animalsJSON = response.getBody();
           system.debug(animalsJSON);
       }else{
           //NOT SUCCESS
           system.debug('something went wrong people');
       }
   }
}
