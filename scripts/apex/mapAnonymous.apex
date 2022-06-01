//map(collections)
//key dtattype,
       //value dtattype  variable name   new instanceof smae of map.
map<string, string>mapCntCurrency = new map<string, string>();

// dtattype of key value should match what we have initiliazed
//variablename.put(key,value)
mapCntCurrency.put('USA', 'Dollar');
mapCntCurrency.put('Japan', 'Yen');
mapCntCurrency.put('France', 'Euro');
mapCntCurrency.put('India', 'Rupees');//1.
mapCntCurrency.put('India', 'Rupee');//2 same key, what will happen?
mapCntCurrency.put('Turkey', 'Lira');
system.debug('map of country vs currencey : ' + mapCntCurrency);

string IndiaCurrency = mapCntCurrency.get('india');
string country ='Turkey';
system.debug('Country is ' + country);
string TurkeyCurrency = mapCntCurrency.get(country); //Valid? Yes

system.debug('India Currency = ' + IndiaCurrency);
system.debug('Turkey Currency = ' + TurkeyCurrency);

Set<string> countrySet = mapCntCurrency.keySet();
system.debug('countries in map: ' + countrySet);

list<string> currencyList = mapCntCurrency.values();
system.debug('currencies in map: ' + currencyList);

// map<integer, list<string>> mapOfIntList = new map<integer, list<string>>();//valid yes
// mapOfIntList.values();
// 1.List<String>
// 2.list<list<string>>

//{El Salvador, France, India, Japan, Turkey, USA} --->countries
Set<string> countriesSet = mapCntCurrency.keySet();
//for loop on KEY SET
//for(string eachKey: mapCntCurrency.keySET())-> we can also write this
for (string eachKey : countrySet) {
      string printString = 'country is ' + eachKey;
      //get its value using .get(key) method
      system.debug(printString); 
      string eachCurrency = mapCntCurrency.get(eachKey);
      system.debug(eachCurrency);
}