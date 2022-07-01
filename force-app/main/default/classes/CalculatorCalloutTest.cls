@isTest
public with sharing class CalculatorCalloutTest {
  @istest  
  public static void doAddTest(){
    //prepare data
    //1. set mock
    Test.setMock(WebServiceMock.class, new CalculatorCalloutMockAdd());
    //start test
    Test.startTest();
    double d1 = CalculatorCallout.addition(1, 2);
    Test.stopTest();

    system.assertEquals(3, d1);
  }

  @istest  
  public static void doSubtractTest(){
    //prepare data
    //1. set mock
    Test.setMock(WebServiceMock.class, new CalculatorCalloutMockSubtract());
    //start test
    Test.startTest();
    double d1 = CalculatorCallout.subtraction(10, 7);
    Test.stopTest();

    system.assertEquals(3, d1);
  }
  @istest  
  public static void doMultiplyTest(){
    //prepare data
    //1. set mock
    Test.setMock(WebServiceMock.class, new CalculatorCalloutMockMultiply());
    //start test
    Test.startTest();
    double d1 = CalculatorCallout.multiplication(1, 3);
    Test.stopTest();

    system.assertEquals(3, d1);
  }
  @istest  
  public static void doDivideTest(){
    //prepare data
    //1. set mock
    Test.setMock(WebServiceMock.class, new CalculatorCalloutMockDivide());
    //start test
    Test.startTest();
    double d1 = CalculatorCallout.division(30, 10);
    Test.stopTest();

    system.assertEquals(3, d1);
  }
}