@isTest
public class AnimalsHttpCalloutMock implements HttpCalloutMock {
    //implementsthis interface method
    public HttpResponse respond(HttpRequest request){
        //create a fake response
        HttpResponse response = new HttpResponse();
            response.setHeader('Content-Type', 'application/json');
            response.setBody('{"animals":["monkey","donkey","cat","dog"]}');
            response.setStatusCode(200);
            return response;
        
    }
}
