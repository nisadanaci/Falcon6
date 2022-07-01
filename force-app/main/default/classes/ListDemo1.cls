public class ListDemo1 {
    public static void candidatesList() {
        //1. Creating empty list string
        //collection
        //data type      variable name        creating new instance of list

        List<string>     listCandidates    = new List<string> ();
        listCandidates.add('Nisa');
        listCandidates.add('Elon');
        listCandidates.add('Mark');
        listCandidates.add('Nisa');
        system.debug('Candidates are ' + listCandidates);
    }

    public static string candidatesList(integer index) {


        List<string>     listCandidates    = new List<string> ();
        listCandidates.add('Nisa');
        listCandidates.add('Elon');
        listCandidates.add('Bill');
        listCandidates.add('Nisa');
        system.debug('Candidates are ' + listCandidates);
        string retrnString = '';
        if(index >=0 && index < listCandidates.size()){
        retrnString = listCandidates[index];
        } else {
            retrnString = 'No such value found';
        }
        return retrnString;
    }

    public static void allCats() {
       Cat falconsCat = new Cat('fluffykins', 'white');
       Cat vitapsCat = new Cat('Simba','brown');
       Cat nisasCat = new Cat('Smokey','Gray');
       List<Cat> cats = new List<Cat>();
       cats.add(falconsCat);
       cats.add(vitapsCat);
       cats.add(nisasCat);
       system.debug('all cats are ' + cats);
       //get cat on index =3, if cats list is not empty
    //    if(!cats.isEmpty()){
    //        Cat catAt3 = cats[3];
    //        system.debug('cat at 3 is ' + catAt3);
    //    }
    }

    public static void allCars(){
        car lm = new car();
        lm.carColor = 'red';
        car bm = new car();
        bm.carColor = 'gray';

        list<car> cars = new list<car>();
        cars.add(lm);
        cars.add(bm);
        system.debug(cars);

    }



    public static void randomIntegerList() {
        List<Integer> listInteger = new list<Integer>();
        listInteger.add(10);
        listInteger.add(15);
        listInteger.add(21);
        listInteger.add(5);
        listInteger.add(15);
        listInteger.add(15);
        system.debug('list of random integers ' + listInteger);
        
       // get index 3 value
        //.get()
       //[]  bunlarin ikisi ayni
       integer index3Value = listInteger.get(3);
       integer index3Value2 = listInteger[3];
       system.debug('value at index3 is ' + index3Value2);
    }

    //LIST FOR EACH LOOP
    public static void iterateIntegerList() {
        List<Integer> listInteger = new list<Integer>();
        listInteger.add(10);
        listInteger.add(15);
        listInteger.add(21);
        listInteger.add(5);
        listInteger.add(15);
       //for datatype variablename           variablname
       //of list       to use inside loop     of list
       for (integer   eachInteger :           listInteger){
           //print each variable value
        system.debug(eachInteger);
       }
       
    }
}