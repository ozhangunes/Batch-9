trigger AccountTrigger on Account (before insert, before update, after insert, after update) {

    //check if switch is on or off for account object.

    TriggerSwitch__c accountSwitch = TriggerSwitch__c.getInstance('account');
    if(accountSwitch.switch__c == false){
        return;
    }
    system.debug('====trigger start======');
    if (trigger.isBefore ) {
        AccountTriggerHandler.updateDescription(Trigger.New, Trigger.Old, Trigger.NewMap, Trigger.OldMap);
    }

    if (Trigger.isAfter && Trigger.isInsert) {

        AccountQueueableExample aq = new AccountQueueableExample(Trigger.new);
        system.enqueueJob(aq);
    }
    
    if (Trigger.isAfter && Trigger.isUpdate) {
        AccountTriggerHandler.updateVIPforAllContacts(Trigger.New, Trigger.Old, Trigger.NewMap, Trigger.OldMap);
    }
    
    system.debug('====trigger end====');

    /*if(trigger.isBefore){
        for(Account eachAcc : Trigger.new){
            Boolean updateDesc = false;
            if(trigger.isInsert && eachAcc.Active__c == 'Yes'){
                updateDesc = true;
            }
            if(trigger.isUpdate){
                if(eachAcc.Active__c == 'Yes' && 
                   trigger.oldMap.get(eachAcc.id).Active__c != trigger.newMap.get(eachAcc.id).Active__c){
                    updateDesc = true;
                }
            }
            if(updateDesc){
                eachAcc.Description = 'Account is now Active. Enjoy buddy!';
            }
        }
    }*/
    //--------------------------------------------------
   /* system.debug('====trigger start======');
    //key, value
    if (trigger.isAfter && trigger.isUpdate) {

        integer countWSChanged = 0;

        Map<id, account> newMapAcc = trigger.newmap;
        Map<id, account> oldMapAcc = trigger.oldMap;
        set<id> accIds = newMapAcc.keySet();

        for (Id eachId : accIds) {
            //eachId is updated Account's ID (if any field is updated.)
            //we want to check OLD Account's webiste != New Account's website
            account oldAcc = oldMapAcc.get(eachId);
            string oldWebSite = oldAcc.Website;

            account newAcc = newMapAcc.get(eachId);
            string newWebSite = newAcc.Website;
            
            if (oldWebSite != newWebsite) {
                countWSChanged++;
                //For Account accName, website is changed to newWebsite
                system.debug('For account ' + newAcc.name + ', website is change to ' + newWebSite);
            }
        }
        system.debug('total # account where website is changed ==> ' + countWSChanged);
    }
    system.debug('====trigger end====');
    
 
 
    //---------------------------------------
    /*
 
    Map<id, account> newMapAcc = trigger.newMap;
    map<id, account> oldMapAcc = trigger.oldMap;
    if (trigger.isUpdate && trigger.isAfter){
        //get keyset from maps
        Set<Id> accIds = newMapAcc.keyset();
        for (id eachId : accIds) {
            System.debug('eachId ==> ' + eachId);
            //get value from key in newMap and oldMap
            Account newAccount = newMapAcc.get(eachId);
            System.debug('New Account Name ==> ' + newAccount.Name);
            Account oldAccount = oldMapAcc.get(eachId);
            System.debug('Old Account Name ==> ' + oldAccount.Name);
        }
    }
    */

 /*   
    Map<id, account> newMapAcc = trigger.newMap;
    map<id, account> oldMapAcc = trigger.oldMap;
    if (trigger.isInsert && trigger.isBefore) {
        system.debug('before insert Trigger.OldMap ==> ' + oldMapAcc);//null
        system.debug('before insert Trigger.NewMap ==> ' + newMapAcc);//n
    }
    if (trigger.isInsert && trigger.isAfter) {
        system.debug('after insert Trigger.OldMap ==> ' + oldMapAcc);
        system.debug('after insert Trigger.NewMap ==> ' + newMapAcc);
    }
    if (trigger.isUpdate && trigger.isBefore) {
        system.debug('before update Trigger.OldMap ==> ' + oldMapAcc);
        system.debug('before update Trigger.NewMap ==> ' + newMapAcc);
    }
    if (trigger.isUpdate && trigger.isAfter) {
        system.debug('after update Trigger.OldMap ==> ' + oldMapAcc);
        system.debug('after update Trigger.NewMap ==> ' + newMapAcc);
    }
    system.debug('====trigger end====');
*/
//--------------------------------------------

    //trigger.new   ALWAYS  gives List<sObject>. ALWAYS. Even if we updating/inserting JUST one record.
        //ALWAYS list<sObject>
/*------------------------------------------------
    if (Trigger.isAfter && Trigger.isUpdate) {
        List<account> oldAccounts = trigger.old;
        for (Account eachAccOld : oldAccounts) {
            system.debug('old id ==> ' + eachAccOld.Id + ' old name ==> ' + eachAccOld.Name);
        }
        List<account> newAccounts = trigger.new;
        for (Account eachAccnew : newAccounts) {
            system.debug('new id ==> ' + eachAccnew.Id + ' new name ==> ' + eachAccnew.Name);
        }
    }
    system.debug('====trigger end====');
        
    
        /*
         if (trigger.isInsert && trigger.isBefore) {
            system.debug('before insert Trigger.Old ==> ' + trigger.old);
        }
        if (trigger.isInsert && trigger.isAfter) {
            system.debug('after insert Trigger.Old ==> ' + trigger.old);
        }
        if (trigger.isUpdate && trigger.isBefore) {
            system.debug('before update Trigger.Old ==> ' + trigger.old);
        }
        if (trigger.isUpdate && trigger.isAfter) {
            system.debug('after update Trigger.Old ==> ' + trigger.old);
        }


    List<account> newAccounts = trigger.new;
        //why?? Trigger RUNS only once when we process multiple records at a time.
        system.debug('number of records --> ' + newAccounts.size());
    if (trigger.isBefore && trigger.isInsert) {
        system.debug('before trigger trigger.new ==> ' + newAccounts);
        for (account acc : newAccounts) {
            system.debug('acc id ==> ' + acc.Id + ' + acc name ==> ' + acc.Name);
        }
    }
    if (trigger.isAfter && trigger.isInsert) {
        system.debug('after trigger trigger.new ==> ' + newAccounts);
        for (account acc : newAccounts) {
            system.debug('acc id ==> ' + acc.Id + ' + acc name ==> ' + acc.Name);
        }
    }

    if (trigger.isBefore && trigger.isUpdate) {
        system.debug('before trigger trigger.new ==> ' + newAccounts);
        for (account acc : newAccounts) {
            system.debug('acc id ==> ' + acc.Id + ' + acc name ==> ' + acc.Name);
        }
    }
    if (trigger.isAfter && trigger.isUpdate) {
        system.debug('after trigger trigger.new ==> ' + newAccounts);
        for (account acc : newAccounts) {
            system.debug('acc id ==> ' + acc.Id + ' + acc name ==> ' + acc.Name);
        }
    }

/*    system.debug('====trigger start======');
    // trigger.new ALWAYS gives List<sObject> 
    List<Account> newAccount = trigger.new;

    if(trigger.isAfter){
        system.debug('After trigger trigger.new =>>' + newAccount);
        System.debug('number of records' + newAccount.size());
    }
    
    system.debug('====trigger end====');
*/

    // if(trigger.isAfter){
    //     System.debug(trigger.new);
    // }

    //------------------------------------
    /*if (trigger.isBefore) {
        system.debug('BEFORE(insert or update) trigger called.');
        if (trigger.isInsert) {
            system.debug('before insert trigger called');
        }
        if(trigger.isUpdate){
            system.debug('before update trigger called');
        }
    }
    if (trigger.isAfter) {
        system.debug('AFTER(insert or update) trigger called.');
        if (trigger.isInsert) {
            system.debug('after insert trigger called');
        }
        if(trigger.isUpdate){
            system.debug('after update trigger called');
        }
    }*/


    /*    system.debug('====trigger start======');
    //.isBefore -> true when in BEFORE trigger
    //.isInsert -> true when in INSERT trigger
    if (Trigger.isBefore && Trigger.isInsert) {
        system.debug('Before insert account trigger called.');
    } 
    if (Trigger.isAfter && Trigger.isInsert) {
        system.debug('After insert account trigger called.');
    }
    
    if (Trigger.isBefore && Trigger.isUpdate) {
        system.debug('Before update account trigger called.');
    } 
    if (Trigger.isAfter && Trigger.isUpdate) {
        system.debug('After update account trigger called.');
    }

    system.debug('====trigger end====');*/

    /*
        if(Trigger.isInsert){
        system.debug('before insert Account Trigger');
        
    }
    if(Trigger.isUpdate){
        system.debug('before update account trigger called');
    }
    */


    /*
    //print before insert debug only in BEFORE TRIGGER
    if (Trigger.isBefore) {
        system.debug('before insert account trigger called.');
    }
    ////print after insert debug only in AFTER TRIGGER
    if (Trigger.isAfter) {
        system.debug('AFTER insert account trigger called.');
    }*/

}