AccountsBatch ab = new AccountsBatch();
Id batchId = Database.executeBatch(ab); // 200'er li gruplar halinde

AccountsBatch ab = new AccountsBatch();
Id batchId = Database.executeBatch(ab, 5);