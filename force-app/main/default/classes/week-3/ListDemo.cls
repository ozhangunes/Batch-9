public class ListDemo {
    public static void candidatesList() {
        //null is null. null is NOT empty. Empty is not NULL.
        List<string> listCandidates = new list<string>();
        listCandidates.add('Marc');
        listCandidates.add('Elon');
        listCandidates.add('Bill');
        listCandidates.add('Marc');
        system.debug('candidates list is ' + listCandidates);
    }
 
    public static void randomIntegerList() {
        list<integer> listInteger = new list<integer>{10, 15, 21, 15, 15};
        listInteger.add(10);
        listInteger.add(15);
        listInteger.add(21);
        listInteger.add(15);
        listInteger.add(55);
 
        system.debug('random integer list IS ' + listInteger);
 
        integer index3value = listInteger.get(3);
        system.debug('index 3 value => ' + index3value);
 
        integer index2value = listInteger[2];
        system.debug('index 2 value = ' + index2value);

        integer index9value = listInteger[9];
        system.debug('index 9 value = ' + index9value);
    }

    public static string candidatesList(integer i){
        List<string> listCandidates = new List<string>();
        listCandidates.add('Marc');
        listCandidates.add('Elon');
        listCandidates.add('Bill');
        listCandidates.add('Marc');
        system.debug('candidates list is ' + listCandidates);
        string returnStr = '';

        if(i >= 0 && i<listCandidates.size()){
            returnStr = listCandidates[i];
        }else{
            returnStr = 'No Values FOUND';
        }
        return returnStr;
    }

    public static void allCats(){
        Cat fluffy = new Cat('fluffykins' , 'white');
        Cat vitapCat = new Cat('simba' , 'brown');
        Cat subramaniCat = new Cat('smokey' , 'grey');

        List<Cat> cats = new List<Cat>();
        cats.add(fluffy);
        cats.add(vitapCat);
        cats.add(subramaniCat);
        cats.add(fluffy);

        system.debug('all cats are ' + cats);

        if (!cats.isEmpty()) {
            Cat index3 = cats[3];
            System.debug(index3);
        }
    }
 }
