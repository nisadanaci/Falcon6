@isTest
public class CalculatorTest {
    @isTest
   private static void testMessage(){
    Calculater.welcomeMessage();
    Calculater.printNewMessage('message m test class');
    Calculater.printNewMessage2('msg', date.today());
   }
   @isTest
   private static void addTest(){
       Integer i =10;
       Integer j =15;
      integer calAdd = Calculater.add(i, j);
      system.assertEquals(25, calAdd);
   }
   @isTest
   private static void addTest2(){
       Integer calcAdd = Calculater.add(10, 15, 20);
       system.assertEquals(45, calcAdd);
   }
   @isTest
   public static void addTest3(){
       List<Integer> listInt = new List<Integer>{15,15,15};
       Integer calcAdd = Calculater.add(listInt);
       system.assertEquals(45, calcAdd);
   }
}
