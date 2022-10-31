@isTest
public with sharing class SalesforceProjectTriggerHandlerTest {
    @isTest
    public static void testFuture1() {
        //prepare Data
        Salesforce_Project__c sp = new Salesforce_Project__c();
        sp.Project_Name__c = 'Test Future';
        sp.Description__c = 'Test Description';
        
        Salesforce_Project__c sp2 = new Salesforce_Project__c();
        sp2.Project_Name__c = 'Test Future2';
        sp2.Description__c = 'Test Description2';
        
        List<salesforce_project__c> insertSP = new List<salesforce_project__c>{sp, sp2};
        Test.startTest();
        insert insertSP;
        Test.stopTest();

        // set<id> setId = new set<id> {sp.id, sp2.id};
        
        // Test.startTest();
        // SalesforceProjectTriggerHandler.updateProjectDescription(setId);
        // Test.stopTest();

        List<salesforce_project__c> resultSP = [SELECT Id, Description__c FROM Salesforce_Project__c];
        system.assert(resultSP[0].Description__c.contains('future'));
    }

    @istest
    private static void testFuture2(){
        //Hazırlık Kısmı
        Salesforce_Project__c sp = new Salesforce_Project__c();
        sp.Project_Name__c = 'Test Future';
        sp.Description__c = 'Test Description';
        sp.Status__c = 'New';

        insert sp;

        List<Salesforce_Ticket__c> listTicket = new List<Salesforce_Ticket__c>();
        for(Integer i = 0 ; i<200 ; i++){
            Salesforce_Ticket__c st = new  Salesforce_Ticket__c();
            st.Subject__c = 'Test Future '+ i;
            st.Status__c = 'Cancelled';
            st.Salesforce_Project__c = sp.Id;
            listTicket.add(st);
        }
        insert listTicket;

        //Hazırlık kısmı tamamlandı.

        //Test Kısmı

        Test.startTest();
        sp.Status__c = 'Completed';
        update sp;
        Test.stopTest();

        // Assertion 
        List<Salesforce_Ticket__c> listTicketTest = [SELECT id, Status__c 
                                                     FROM Salesforce_Ticket__c 
                                                     WHERE Salesforce_Project__c = :sp.id];
        for(Salesforce_Ticket__c stTest : listTicketTest){
            System.AssertEquals('Completed', stTest.Status__c);
        }
    }
}
