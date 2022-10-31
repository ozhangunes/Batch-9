@isTest
public class CalculatorTest {
    @isTest
    private static void testCalculator(){
        Calculator c1 = new Calculator();
        c1.printNewMessage('Message For Test');
    }

    @isTest
    private static void testCalPrint2(){
        // Calculator c2 = new Calculator();
        // String resultStr = c2.printAndReturnMessage('Message For Test');
        // String expectedValue = 'Message For Test...OK Cool';

        // system.assertEquals(expectedValue, resultStr);


        Calculator calc = new Calculator();
        string returnmsg = calc.printAndReturnMessage('this is coming from a test method, again. so chill.');
        string expectedReturnMsg = 'this is coming from a test method, again. so chill....OK Cool';
        system.assertEquals(expectedReturnMsg, returnmsg);
    }
}
