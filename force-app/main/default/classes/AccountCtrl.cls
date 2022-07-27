public with sharing class AccountCtrl {
    @AuraEnabled(cacheable=true)     //@auraenabled olmali  cacheable true:Wire service LWC ile calisiyor LWC de cache memory'i kullaniyorcacheable=true/false ifadesi ise client-side da yani kullanıcının cihazında LDS ile kaydedilsin mi? kaydedilmesin mi? konusununda seçim yapmak için kullanırız. Yani “true” olursa sizin cache’inize bu veriler kaydedilir ve oradan kullanılır. Ve wire function da bu değer “true” olmalıdır. İmperative de seçebiliriz.
    public static List<Account> getBiotechAccounts(){
        List<Account> accounts = [SELECT Name, Type, Industry, AnnualRevenue
                                FROM Account
                                WHERE Industry = 'Biotechnology'
                                WITH SECURITY_ENFORCED];
        return accounts;
    }

    @AuraEnabled(cacheable=true)
    public static List<Account> getAccountsByType(String type) {
        List<Account> accounts = [SELECT Name, Type, Industry, AnnualRevenue
                                FROM Account
                                WHERE Type = :type
                                WITH SECURITY_ENFORCED
                                LIMIT 4];
        return accounts;
    }

    @AuraEnabled(cacheable=true)
    public static List<Account> getAccountsByIndustry(String industry){
        List<Account> accounts = [SELECT Name, Type, Industry, AnnualRevenue
                                FROM Account
                                WHERE Industry = :industry
                                WITH SECURITY_ENFORCED];
        return accounts;
    }
}
