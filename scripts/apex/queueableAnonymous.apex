List<Account> accs = [SELECT id, Name FROM Account];
AccountQueueableExample aq = new AccountQueueableExample(accs);
Id jobId = system.enqueueJob(aq);
System.debug(jobId);