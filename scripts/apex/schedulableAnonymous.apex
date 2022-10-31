AccountsSchedulable ac = new AccountsSchedulable();

String cronExp = '0 6 10 1/1 * ? *';

system.schedule('accupdatejob', cronExp, ac);