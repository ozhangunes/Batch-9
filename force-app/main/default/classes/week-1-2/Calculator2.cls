public class Calculator2 {
    public integer add(integer a, integer b){
        integer sum = a + b;
        return sum;
    }

    public integer add(integer a, integer b, integer c){
        integer sum = a + b + c;
        return sum;
    }

    public boolean leapYearCheck (date dt){
        integer year = dt.year();
        boolean isLeap = date.isLeapYear(year);
        return isLeap;
    }
}
