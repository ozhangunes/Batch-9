SetDemo.citySet();

SetDemo.randomIntegerSet();

list<integer> listInteger = new list<integer>();
listInteger.add(10);
listInteger.add(15);
listInteger.add(21);
listInteger.add(15);
listInteger.add(15);

Set<Integer> setInt = new Set<Integer>();

setInt = SetDemo.setFromList(listInteger);
System.debug('SetInteger ==>  ' + setInt);

//---------------------------------------------//

Set<String> cities = new Set<String>();
cities.add('Tokyo');
cities.add('Nairobi');
cities.add('Lisbon');
cities.add('Berlin');
cities.add('Tokyo');
cities.add('Berlin');
cities.add('Nairobi');

Set<String> citiesCapitalized = new Set<String>();

citiesCapitalized = SetDemo.capitalizeAllSet(cities);
system.debug(citiesCapitalized);