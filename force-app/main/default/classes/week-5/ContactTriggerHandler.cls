public class ContactTriggerHandler {
    public static void contactUpdateValidation1(List<contact> contTriggerNew, List<contact> contTriggerOld,
                                    Map<id, contact> contTriggerNewMap, Map<id, contact> contTriggerOldMap) {
            //prevent to update contact record IF leadSource is PartnerReferral
            for (contact eachCnt : contTriggerNew) {
                Contact oldContact = contTriggerOldMap.get(eachCnt.id);
                if (oldContact.LeadSource == 'Partner Referral') {
                    eachCnt.LeadSource.addError('Cannot update \'Partner Referral\' contact.');
            }
        }
    }

    public static void contactUpdateValidation2(List<contact> contTriggerNew, List<contact> contTriggerOld,
                                    Map<id, contact> contTriggerNewMap, Map<id, contact> contTriggerOldMap) {

        for (Contact eachContact : contTriggerNew) {
            if (eachContact.LeadSource != contTriggerOldMap.get(eachContact.id).LeadSource) {
                string customValidation = system.label.ContactValidation2;
                eachContact.LeadSource.addError(customValidation);
            }
        }
    }

    public static void updateAccNumberOfContacts(List<Contact> contTriggerNew, List<Contact> contTriggerOld){
        set<id> accountIds = new set<id>();
        if(Trigger.isInsert || Trigger.isUpdate || Trigger.isUndelete){
            for(Contact eachCont : contTriggerNew){
                accountIds.add(eachCont.AccountId);
            }
        }

        if(Trigger.isUpdate || Trigger.isDelete){
            for(Contact eachCont : contTriggerOld){
                accountIds.add(eachCont.AccountId);
            }
        }

        if(!accountIds.isEmpty()){
            List<Account> listAcc = [SELECT id, Number_of_Contacts__c,(Select id From Contacts) FROM Account WHERE Id IN:accountIds];

            List<Account> updateAcc = new List<Account>();
            for(Account eachAcc : listAcc){
                eachAcc.Number_of_Contacts__c = eachAcc.Contacts.size();
                updateAcc.add(eachAcc);
            }
            update updateAcc;
        }
    }
}
