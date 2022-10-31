public with sharing class AccountTriggerHandler {
    public static void updateDescription(List<Account> accTriggerNew, 
                                         List<Account> accTriggerOld,
                                         Map<id, Account> accTriggerNewMap,
                                         Map<id, Account> accTriggerOldMap) {

        for (account eachAcc : accTriggerNew) {
            boolean updateDesc = false;
            if (Trigger.isInsert && eachAcc.Active__c == 'Yes') {
                updateDesc = true;
            }
            if (Trigger.isUpdate) {
                if (eachAcc.Active__c == 'Yes' 
                && accTriggerOldMap.get(eachAcc.Id).Active__c != accTriggerNewMap.get(eachAcc.Id).Active__c) {
                    updateDesc = true;
                }
            }
            if (updateDesc) {
                eachAcc.Description = 'Account is now Active. ENJOY!';
            }
        }
    }

    public static void updateVIPforAllContacts(List<account> accTriggerNew, 
                                            List<account> accTriggerOld,
                                            Map<id, account> accTriggerNewMap,
                                            Map<id, account> accTriggerOldMap) {

        //prepare set of account ids whose VIP field is changed
        set<id> accountIds = new set<id>();
        for (account eachAcc : accTriggerNew) {
               if (eachAcc.VIP__c != accTriggerOldMap.get(eachAcc.id).VIP__c) {
                    accountIds.add(eachAcc.Id);
               } 
        }
        if (!accountIds.isEmpty()) {
            //fetch contacts with VIP for accountIds SET.
            list<contact> listContacts = [SELECT Id, Accountid, VIP__c 
                                          FROM contact 
                                          WHERE AccountId IN :accountIds];
            //in List contacts, we have contacts for ALL updated ACCOUNTS(VIP FIELD)
            for (contact eachContact : listContacts) {
                //account contAccount = accTriggerNewMap.get(eachContact.AccountId);
                //boolean accVIP = accTriggerNewMap.get(eachContact.AccountId).vip__c;
                //update contact's VIP field
                eachContact.vip__c = accTriggerNewMap.get(eachContact.AccountId).vip__c;
            }
            update listContacts;
        }
    }
}
