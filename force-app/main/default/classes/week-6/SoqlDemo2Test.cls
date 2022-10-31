@isTest
public with sharing class SoqlDemo2Test {
    @TestSetup
    static void makeData(){
        //prepare data
        account acc1 = new account();
        acc1.Name = 'SI Test';
        acc1.Industry = 'Energy';
        acc1.Type = 'Customer - Direct';

        account acc2 = new account();
        acc2.Name = 'UI Test';
        acc2.Industry = 'Energy';
        acc1.Type = 'Customer - Direct';

        account acc3 = new account();
        acc3.Name = 'PI Test';
        acc3.Industry = 'Banking';
        acc1.Type = 'Customer - Direct';

        List<account> accList = new List<account> {acc1, acc2, acc3};
        insert accList;

        List<contact> listContact = new list<contact>();
        for (Integer i = 0; i < 300; i++) {
            contact c = new contact();
            c.LastName = 'Soql test ' + i;
            if (i< 100) {
                c.AccountId = acc1.id;
            } else if (i < 200) {
                c.AccountId = acc2.id;
            } else {
                c.accountid = acc3.id;
            }
            listContact.add(c);
        }
        insert listContact;

        List<Opportunity> listOPP = new List<Opportunity>();
        for (Integer i = 0; i < 300; i++) {
            Opportunity o = new Opportunity();
            o.Name = ' test opp ' + i;
            o.StageName = 'Closed Won';
            o.CloseDate = Date.today();
            if (i < 100) {
                o.AccountId = acc1.Id;
            } else if (i < 200) {
                o.AccountId = acc2.Id;
            } else if (i < 300) {
                o.AccountId = acc3.Id;
            }
            listOPP.add(o);
        }
        insert listOpp;
    }
    
    @isTest
    private static void testMethodSOQLparentToChild() {
        test.startTest();
          Soqldemo2.childToParent_SOQL1();
        test.stopTest();
    }

    @isTest
    private static void testSOQLParentToChild2() {
        //to use records created in setup, we do soql
 

       //create opportunity for accounts created in testSetup method 

       //END of prepare data

       test.startTest();
       SoqlDemo2.parentToChild_SOQL1();
       test.stopTest();

    }
}