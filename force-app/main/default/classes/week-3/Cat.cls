public class Cat {

    public string name;
    public string color;


        //name is same as class name
    //does not return anything
    //this is non-parameterized constructur
    public Cat() {
        system.debug('cat constructor called.');
    }
    //parameterized constructor
    public Cat(string n, string clr){
        name = n;
        color = clr;
        sleeping();
    }

    public void sleeping(){
        system.debug(name + 'is sleeping');
    }
}
