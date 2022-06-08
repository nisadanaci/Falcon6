public with sharing class DummyPostResponseWrapper {
    public list<Post> posts;
    
    public class Post{
        public integer id;
        public string title;
        public string body;
        public integer userId;
        public List<string> tags;
    }
}
//we make a list and list is an object
//so that class we will match with keys
//should be list of string
//so now we mark keys and inner keys to create for a=object and fields
//we will assign the response to dummyPostResponseWrapper.posts
//type cast  
//deseriliaze