public class Calculater {
    public static void welcomeMessage(){
        system.debug('welcome to apex calC');
    }
    //method name: printNewMessage
    //# of parameters: 1
    //data type of paremeter: string
    //return type void
    public static void printNewMessage(string msg){
        // use parameter variable name inside the method
        system.debug(msg);    
    }
    public static void printNewMessage2(string msg, Date dt){
        system.debug(msg);
        system.debug(dt);
    }

    public static integer add(integer a, integer b){
        integer sum = a + b;
        return sum;
    }
      //add method with 3 params
    public static integer add(integer a, integer b , integer c){
        return a+b+c;
  }
// LIST FOR EACH LOOP ANONYMOUS FILE IN CALCULATER CLASS
  public static integer add(list<integer> intList) {
      //create a temp variable
      //o store Sum of all integers
      integer sum =0;
      //10,15,20
      //sum= sum+10;
      //sum= sum+15;
      //sum= sum+20;
      for(integer eachInt: intList){
          system.debug('eachInt - ' + eachInt);
          sum += eachInt;
        system.debug('sum ' + sum);
      }
      return sum;
  }
}
