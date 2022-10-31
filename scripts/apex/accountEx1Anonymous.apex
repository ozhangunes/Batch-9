// Account ac = new Account();
// insert ac;
// //will Line-4 execute?
// system.debug('Apex is simple');

try{
    Account ac = new Account();
    insert ac;
} catch(LimitException dx){
    system.debug('dml went wrong buddy');
}catch(Exception ex){
    System.debug('Something went wrong buddy');
}
system.debug('Apex is simple');