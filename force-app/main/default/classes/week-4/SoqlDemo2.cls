public with sharing class SoqlDemo2 {
    public static void childToParent_SOQL1() {
        list<Contact> listContact = [SELECT Name, Phone, Account.Name, Account.Industry 
                                     FROM Contact 
                                     WHERE Account.Industry = 'Energy'];

        for(contact eachContact : listContact){
            String accName = eachContact.account.name;
            string accIndustry = eachContact.Account.Industry;
            //string accPhone = eachContact.account.phone;

            system.debug('Contact name is ' + eachContact.Name + ', its account name is ' + accName);
        }
    }

    public static void parentToChild_SOQL1() {
        list<account> accountWithOpps = [select id, name, annualrevenue, type, 
                                        (select name, amount, stageName from opportunities where stageName = 'Closed Won') 
                                        from account where type = 'Customer - Direct'];
        for (account eachAcc : accountWithOpps) {
            system.debug('account name is ' + eachAcc.Name + ' and annual revenue is ' + eachAcc.AnnualRevenue);
            system.debug('----');
            List<Opportunity> accOpportunities = eachAcc.Opportunities;
            for (opportunity eachOpp : accOpportunities) {
                system.debug('opp name is ' + eachOpp.Name + ' AND amount is ' + eachOpp.Amount);
            }
            system.debug('============');
        }
    }

    public static void parentToChild_SOQL2(){
        List<Salesforce_Project__c> listSP = [SELECT Name, Project_Name__c, Status__c,
                                              (SELECT Name, Subject__c, Priority__c FROM Salesforce_Tickets__r)
                                              FROM Salesforce_Project__c
                                             ];
        integer totalHP = 0;
        for(Salesforce_Project__c eachSP : listSP){
            System.debug('Project Name is' + eachSP.Project_Name__c + ' and autonumber is ' + eachSP.Name);
            List<Salesforce_Ticket__c> listST = eachSP.Salesforce_Tickets__r;
            System.debug('Total tickets in ' + eachSP.Name + ' are ' + listST.size());
            integer eachProjectHP = 0;
            for (salesforce_ticket__c eachST : listST) {
                //check if eachST priority is HIGH
                if (eachST.Priority__c == 'High') {
                    eachProjectHP++;
                    totalHP++;
                }
            }
            system.debug('projects # of high priority tickets ===> ' + eachProjectHP );
        }
        system.debug('total # of high priority tickets ==> ' + totalHP);
    }
}
