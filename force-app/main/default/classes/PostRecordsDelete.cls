public with sharing class PostRecordsDelete {
    public static void deletePost(){
        List<post__c> post =[select id From Post__c];
        delete post;
    }
}
