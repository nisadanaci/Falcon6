SetDemo.citySet();
SetDemo.randomIntegerSet();

list<integer> l = new list<integer>{4,4,4,5,7,5,1,21,54,54};
l.add(15);


list<integer> l1 = new list<integer>{10,15,20,99,55,44,10,99};
set<integer> set3 = SetDemo.setFromList(l1);
system.debug('set 3= ' + set3);

  Set<String> cities = new Set<String>();
        cities.add('Tokyo');
        cities.add('Lisbon');
        cities.add('Berlin');
        cities.add('Nairobi');
        cities.add('Tokyo');
        cities.add('Berlin');
        cities.add('tokyo');
        cities.add('TOKYO');
        system.debug('set of cities ' + cities);
        set<string> citiesCaps = SetDemo.capatilizeSet(cities);
        system.debug(citiesCaps);