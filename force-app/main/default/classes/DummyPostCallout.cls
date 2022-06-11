public with sharing class DummyPostCallout {
    private static string GET_DUMMY_ENDPOINT = CalloutInFo__mdt.getInstance('GET_DUMMYPOST').Endpoint__c;
    private static string  HTTP_GET = 'GET';
    private static string  HTTP_POST = 'POST';
   public static void postCallout(){
       //1.create request
       HttpRequest Request = new HttpRequest();
       request.setEndPoint(GET_DUMMY_ENDPOINT);
       Request.setMethod(HTTP_GET);

       //2.prepare http
       http http = new http();


       //3.send request, get response
       HttpResponse response = http.send(request);

       system.debug(response);
       if(response.getStatusCode() == 200){
           system.debug(response.getBody());
           DummyPostResponseWrapper dummywrapper = (DummyPostResponseWrapper)JSON.deserialize(response.getBody(),DummyPostResponseWrapper.class);
           system.debug('dummy wrapper = ' + dummywrapper);
           //List<post__c>
           system.debug('dummywrapper.post = ' + dummywrapper.posts);
           List<post__c> listPosts = new list<post__c>();
           List<DummyPostResponseWrapper.Cls_post> listClsPost = dummywrapper.posts; 
           for(DummyPostResponseWrapper.Cls_Post dpost: listClsPost){
            post__c p = new post__c();
            p.id__c = dpost.id;
            p.title__c = dpost.title;
            p.body__c = dpost.body;
            p.UserID__c = dpost.userId;
            p.Tags__c = dpost.tags.toString();
            listPosts.add(p);
           }
        //    Database.insert(listPosts, false);
           //for each loop on list<post> from wrapper class
           //Post__c p new post__c();
           //map all fields of wrapper post to post__c object fields
           //add in list<post__c
           //databse.insert(list of Post);
           //insert + update = upsert
           //If ID is found __. update
           // If ID NOT --> insert
           upsert listPosts id__c;
       }else{
           system.debug(response.getStatus());
       }
   }
}
