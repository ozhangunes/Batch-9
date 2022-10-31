@isTest
public with sharing class AccountsBatchTest {
    @isTest
    private static void testBatch1(){
        //1.Prepare Data
        List<Account> listAcc = new List<Account>();
        for(Integer i = 0; i<900; i++){
            account a = new Account();
            a.Name = 'Test Acc Batch' + i;
            listAcc.add(a);
        }
        insert listAcc;

        //2.Test the apex
        Test.startTest();
        AccountsBatch ab = new AccountsBatch();
        Id batchId = Database.executeBatch(ab, 1000);
        Test.stopTest();

        List<Account> results = [SELECT Id, Description FROM Account];
        System.assert(results[0].Description.contains('Batch'));
    }
}
