public with sharing class LoopDemo {
    public void print_int_while() {
        integer i = 0;
        while (i < 10) {
            system.debug(i);
            i++;
        }
    }

    public void print_N_numbers(integer n){
        for (integer i = 0 ; i < n ; i++){
            system.debug(i);
        }
    }

    public void print_N_odd_numbers(integer startInt, integer endInt){
        if(startInt > endInt){
            system.debug('start number CANNOT be greater than end number. Ok?');
        } else {
            for(Integer i = startInt; i <= endInt; i++){
                integer modI = math.mod(i,2);
                if (modI == 1){
                    system.debug(i);
                }
            }
        }
    }
}
