public class AccountsBatch implements Database.Batchable<SObject>, Database.Stateful{
    integer numberOfRecords = 0;
    integer count = 0;
    public Database.QueryLocator start(Database.BatchableContext bc) {
        //write query
        //Sobject is Account
        System.debug('batch started. Congrats');
        Database.QueryLocator ql = Database.getQueryLocator([SELECT Id, Description FROM Account]);
        return ql;
    }

    public void execute(Database.BatchableContext bc, List<Account> scope){
        System.debug('Execute method running');
        //dmls
        for(Account acc : scope){
            acc.Description += '...Update via Batch.';
        }

        numberOfRecords+= scope.size();
        count++;
        system.debug('count is ' + count);
        system.debug('number of records updated till now is ' + numberOfRecords);

        update scope;
    }

    public void finish(Database.BatchableContext bc){
         System.debug('Finish method executed. Batch done. Simple');
        system.debug('count is ' + count);
        system.debug('number of records updated till now is ' + numberOfRecords);
    }
}
