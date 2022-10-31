trigger AccountTrigger2 on Account (before insert, after insert, before update, after update) {

    system.debug('====trigger start======');

    if(trigger.isBefore){
        for(Account eachAcc : Trigger.new){
            if(trigger.isInsert){
                if(eachAcc.Active__c == 'Yes'){
                    eachAcc.Description = 'Account is now Active. Enjoy buddy!';
                }
            }

            if(trigger.isUpdate){
                if(eachAcc.Active__c == 'Yes' ){
                    eachAcc.Description = 'Account is now Active. Enjoy buddy!';
                   }
            }
        }
    }
    system.debug('====trigger end====');



}