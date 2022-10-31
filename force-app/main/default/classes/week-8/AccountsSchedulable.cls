public class AccountsSchedulable implements Schedulable{
    public static void execute(SchedulableContext sc) {
        //here we can write any apex code.
        //list
        //for each
        //update

        //to call batch here.
        Database.executeBatch(new AccountsBatch());
    }
}