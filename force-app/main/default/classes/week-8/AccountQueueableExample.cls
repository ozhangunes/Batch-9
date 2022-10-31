public class AccountQueueableExample implements Queueable{
    List<Account> listAcc;
    public AccountQueueableExample(List<Account> accList) {
        listAcc = accList;
    }

    public void execute(QueueableContext qc){
        List<Account> updateAcc = new List<Account>();
        for(Account acc : listAcc){
            Account a = new Account();
            a.Id = acc.Id;
            a.Name = acc.Name + ' --SI';
            updateAcc.add(a);
        }
        update updateAcc;
    }
}
