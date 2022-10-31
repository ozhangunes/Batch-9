@isTest
public class AccountTriggerHandlerTest {
    @isTest
    private static void testUpdateDescription() {
        //prepare data
     account acc1 = new account();
     acc1.Name = 'SI Test';
     acc1.Industry = 'Energy';
     acc1.Active__c = 'Yes';

     account acc2 = new account();
     acc2.Name = 'UI Test';
     acc2.Industry = 'Energy';

     account acc3 = new account();
     acc3.Name = 'PI Test';
     acc3.Industry = 'Banking';

     List<account> accList = new List<account> {acc1, acc2, acc3};

     Test.startTest();
     insert accList;

     acc2.Active__c = 'Yes';
     update acc2;
     Test.stopTest();

    //assertion
    List<Account> resultAcc = [SELECT Id, Name, Active__c, description FROM Account];
    for(Account acc : resultAcc){
        if(acc.Active__c == 'Yes'){
            system.assert(acc.Description.contains('Active'));
        }else{
            system.assert(String.isBlank(acc.Description));
        }
    }

  }
  @isTest
    private static void testUpdateDescription2(){
        account acc1 = new account();
        acc1.Name = 'SI Test';
        acc1.Industry = 'Energy';
        acc1.Active__c = 'Yes';

        account acc2 = new account();
        acc2.Name = 'UI Test';
        acc2.Industry = 'Energy';

        account acc3 = new account();
        acc3.Name = 'PI Test';
        acc3.Industry = 'Banking';

        List<account> accList = new List<account> {acc1, acc2, acc3};
        insert accList;

        acc2.Active__c = 'Yes';
        acc3.Active__c = 'Yes';
        List<Account> accList2 = new List<Account>{acc2, acc3};
        update accList2;

        //assertion
        List<Account> resultAcc = [SELECT Id, Name, Active__c, description FROM Account];
        for(Account acc : resultAcc){
            if(acc.Active__c == 'Yes'){
                system.assert(acc.Description.contains('Active'));
            }else{
                system.assert(String.isBlank(acc.Description));
            }
        }
    }

    @isTest
    private static void testUpdateVIP(){
        //hazırlık
        account acc1 = new account();
        acc1.Name = 'SI Test';
        acc1.Industry = 'Energy';
        acc1.Active__c = 'Yes';

        account acc2 = new account();
        acc2.Name = 'UI Test';
        acc2.Industry = 'Energy';

        List<account> accList = new List<account> {acc1, acc2};
        insert accList;

        List<contact> listContact = new list<contact>();
        for (Integer i = 0; i < 200; i++) {
            contact c = new contact();
            c.LastName = 'Test Trigger ' + i;
            if (i< 100) {
                c.AccountId = acc1.id;
            } else {
                c.accountid = acc2.id;
            }
            listContact.add(c);
        }
        insert listContact;
        //Hazırlık sonu

        //Test Kısmı

        acc1.VIP__c = true;
        acc2.VIP__c = true;
        List<account> accList2 = new List<account> {acc1, acc2};
        Test.startTest();
        update accList2;
        Test.stopTest();



        List<Contact> resultContacts = [SELECT Id, VIP__c FROM Contact];
        system.assert(resultContacts[0].VIP__c);
    }
}
