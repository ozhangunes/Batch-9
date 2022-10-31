public  class CalculatorSimple {
    public static integer add(integer a, integer b){
        integer sum = a + b;
        return sum;
    }

    public static integer add(integer a, integer b, integer c){
        integer sum = a + b + c;
        return sum;
    }

    public static integer add(List<integer> intList) {
        // list<integer> intList = new list<integer>();
        // intList.add(10);
        // intList.add(15);
        // intList.add(21);
        // intList.add(15);
        // intList.add(15);

        integer returnSum = 0;
        //10, 15, 21    
        for (integer eachInteger : intList) {
            //1. r = 0 + 10; r = 10
            //2. r = 10 + 15; r=25
            //3. r = 25+ 21; r=46
            returnSum = returnSum + eachInteger;
        }
        return returnSum;
    }
}