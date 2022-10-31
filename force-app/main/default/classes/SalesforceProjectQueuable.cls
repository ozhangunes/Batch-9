public with sharing class SalesforceProjectQueuable implements Queueable{
    list<Salesforce_Project__c> sfList;

    public SalesforceProjectQueuable(list<Salesforce_Project__c> sfListPr) {
        sfList = sfListPr;
    }

    public void execute(QueueableContext qc){
        List<Salesforce_Project__c> updateListSF = new List<Salesforce_Project__c>();
        for(Salesforce_Project__c sf : sfList){
            Salesforce_Project__c sfUpdate = new Salesforce_Project__c();
            sfUpdate.id = sf.id;
            sfUpdate.Description__c = '. updated from Queuable';
            updateListSF.add(sfUpdate);
            System.debug('Queuable Working');
        }
        update updateListSF;
    }
}
