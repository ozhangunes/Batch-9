@isTest
public class AccountQueueableExampleTest {
    @TestSetup
    static void makeData(){
        List<Account> accs = new List<Account>();
        for(Integer i = 0; i<200; i++){
            Account a = new Account(Name ='Test Account' + i);
            accs.add(a);
        }
        insert accs;
    }

    @isTest
    private static void testQueueable() {
        List<Account> allAccs = [SELECT Id, Name FROM Account];
        AccountQueueableExample aq = new AccountQueueableExample(allAccs);

        Test.StartTest();
        system.enqueueJob(aq);
        Test.StopTest();

        List<Account> resultAcc = [SELECT Id, Name FROM Account WHERE Name LIKE '%SI%'];
        system.assertEquals(200, resultAcc.size());
    }
}
