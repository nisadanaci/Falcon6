public with sharing class ContactCalloutInvocable {
    @invocableMethod (label= 'Post Contact to go rest' description= 'Post contact callout ' category='Contact')
    public static void postCallOut(list<id> contactIds){
        ContactCalloutFuture.sendDataGo(contactIds);
    }
}
