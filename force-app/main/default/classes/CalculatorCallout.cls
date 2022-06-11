public with sharing class CalculatorCallout {
   public static Double addition(Double num1, Double num2){
    CalculatorServices.CalculatorImplPort calculator = new CalculatorServices.CalculatorImplPort();
    return calculator.doAdd(num1, num2);
   }
   //add two double number
   public static Double subtraction(Double num1, Double num2){
    CalculatorServices.CalculatorImplPort calc = new CalculatorServices.CalculatorImplPort();
    return calc.doSubtract(num1, num2);
   }
   //multiply two double numer
   public static Double multiplication(Double num1, Double num2){
    CalculatorServices.CalculatorImplPort calc = new CalculatorServices.CalculatorImplPort();
    return calc.doMultiply(num1, num2);
   }
   //divide two double number
   public static Double division(Double num1, Double num2){
    CalculatorServices.CalculatorImplPort calc = new CalculatorServices.CalculatorImplPort();
    return calc.doDivide(num1, num2);
   }
}

