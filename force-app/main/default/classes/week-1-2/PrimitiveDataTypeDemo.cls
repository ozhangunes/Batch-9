public class PrimitiveDataTypeDemo {
    public void printBasicDataType() {
        // system.debug('printing primitive datatypes');
        // string batchName = 'batch-9';
        // integer totalCandidates = 70;
        // Boolean isAdminCompleted = true;

        // string batchCandidate = batchName + ' ' + totalCandidates;
        // system.debug(batchCandidate);

        // system.debug(batchName);
        // system.debug(totalCandidates);
        // system.debug(isAdminCompleted);

        // string batchDescription = batchName + ' is fantastic';
        // system.debug(batchDescription);
        // system.debug(batchName + ' is fantastic');

        Decimal decValue = 70.55;
        system.debug(decValue);

        Long longValue = 26644653;
        system.debug(longValue);

        Object obj = 'This is a string';
        Object obj2 = 40.5;
        Object obj3 = true;
        System.debug(obj);
        System.debug(obj2);
        System.debug(obj3);

        Id id1 = '0068d000009MIzu';
        system.debug ('id 1 is -->  ' + id1);
    }
}