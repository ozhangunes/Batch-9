public class AccountUpdateHelper {
    @InvocableMethod
    public static void updateAccountWebsite(List<id> accIds) {
        List<Account> updateAccounts = new List<Account>();
        for(Account eachAccount : [SELECT Id, Website FROM Account WHERE Id IN : accIds]){
            eachAccount.Website = 'www.softinnovas.com';
            updateAccounts.add(eachAccount);
        }
        update updateAccounts;
    }
}
