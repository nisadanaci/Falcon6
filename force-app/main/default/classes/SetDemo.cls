public class SetDemo {
    public static void citySet(){
        //1. Creating empty set string 
        //Collections
        Set<String> cities = new Set<String>();
        //add.() method similar to List
    
        system.debug('set of cities ' + cities);
        cities.add('Tokyo');
        cities.add('Lisbon');
        cities.add('Berlin');
        cities.add('Nairobi');
        cities.add('Tokyo');
        cities.add('Berlin');
        cities.add('tokyo');
        cities.add('TOKYO');
    }
    public static void randomIntegerSet(){
        Set<Integer> setInteger = new Set<Integer>();
        setInteger.add(10);
        setInteger.add(15);
        setInteger.add(21);
        setInteger.add(15);
        setInteger.add(15);
        system.debug('set of random integers ' + setInteger);
    }
    public static set<integer> setFromList(List<Integer> intList){
        Set<Integer> intSet = new Set<Integer>();
        intSet.addAll(intList);
        return intSet;
    }


    public static set<string> capatilizeSet(set<string> setString){
        set<string> upperCaseSet = new set<string>();
        for(string eachString : setString) {
            string tempStr = eachString.toUpperCase();
            upperCaseSet.add(tempStr);

        }
        return upperCaseSet;
    }
}