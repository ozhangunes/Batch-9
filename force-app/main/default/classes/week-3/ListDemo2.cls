public class ListDemo2 {
    public static void iterateListInteger() {
        list<integer> listInteger = new list<integer>();
        listInteger.add(10);
        listInteger.add(15);
        listInteger.add(21);
        listInteger.add(15);
        listInteger.add(15);

        for(integer i = 0 ; i < listInteger.size() ; i++){
            integer eachInteger = listInteger[i];
            System.debug(eachInteger);
        }

        //for-each döngüsü
        for(integer eachInteger : listInteger){
            System.debug(eachInteger);
        }
    }
}
