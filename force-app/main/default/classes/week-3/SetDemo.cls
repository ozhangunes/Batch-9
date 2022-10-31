public with sharing class SetDemo {
    public static void citySet(){
        Set<String> cities = new Set<String>();
        cities.add('Tokyo');
        cities.add('Nairobi');
        cities.add('Lisbon');
        cities.add('Berlin');
        cities.add('Tokyo');
        cities.add('Berlin');
        cities.add('Nairobi');

        system.debug('Set of cities = ' + cities);
    }

    public static void randomIntegerSet() {
        set<integer> setInteger = new Set<Integer>();
        setInteger.add(10);
        setInteger.add(15);
        setInteger.add(21);
        setInteger.add(15);
        setInteger.add(15);
        system.debug('set of random integers: ' + setInteger);
    }

        public static Set<Integer> setFromList(List<Integer> intList){
            Set<Integer> setOfInt = new Set<Integer>();
            
            setOfInt.addAll(intList);//addAll is used to add all the elements from a list or a set.
            return setOfInt;
        }

        public static Set<String> capitalizeAllSet(Set<String> setString){
            Set<String> returnSet = new Set<String>();

            for(String eachStr : setString){
                string tempStr = eachStr.toUpperCase();
                returnSet.add(tempStr);
            }
            return returnSet;
        }
}
