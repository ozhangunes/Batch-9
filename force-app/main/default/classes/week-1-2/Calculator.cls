public with sharing class Calculator {

    public void printNewMessage(string msg1){
        //msg is the variable which is supposed to be used INSIDE method.
        //it nothing to do with outside of the method.
        system.debug(msg1);
    }


    public string printAndReturnMessage(string msg){
        string returnStr = msg + '...OK Cool';
        return returnStr;
    }
}
