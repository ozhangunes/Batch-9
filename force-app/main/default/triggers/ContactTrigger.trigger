trigger ContactTrigger on Contact (before insert, after insert, before update, after update, after delete, after undelete) {
    if (Trigger.isBefore && Trigger.isUpdate) {
        //call validation methods.
        ContactTriggerHandler.contactUpdateValidation1(Trigger.New, Trigger.Old,  Trigger.NewMap, Trigger.OldMap);
        ContactTriggerHandler.contactUpdateValidation2(Trigger.New, Trigger.Old,  Trigger.NewMap, Trigger.OldMap);
    }

    if(trigger.isAfter){
        ContactTriggerHandler.updateAccNumberOfContacts(Trigger.New, Trigger.Old);
    }
}