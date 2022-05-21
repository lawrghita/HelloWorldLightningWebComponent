public with sharing class AccountController {
    public static List<Account> getAllActiveAccounts(){
        return [SELECT Id, Name FROM Account WITH SECURITY_ENFORCED];
    }
}
