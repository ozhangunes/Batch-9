trigger CaseTrigger on Case (before insert, before update) {
    if(Trigger.isInsert){
        System.debug('Before Insert Case');
    }
    if(trigger.isUpdate){
        CaseTriggerHandler.countTriggerExecution++;
        system.debug('Case Trigger Execution Count ==> '+ CaseTriggerHandler.countTriggerExecution);

        CaseTriggerHandler.countTriggerRecords += Trigger.size;
        System.debug('Case trigger record count ==> ' + CaseTriggerHandler.countTriggerRecords);
    }
}