public class Cat {
    //parametreless constructor.
    //constructor name is same as calss name
    //Does not return anything.
    public string name;
    public string color;
    public Cat(){
        system.debug('constructor called.');
    }
    //parametirazed constructor.
    //similar to method.
    //BUT does NOT return anything.
    // AND name is same like CLassName
    public Cat(string name, string color) {
        this.name = name;
        this.color = color;
        sleeping();
    }
    public void sleeping(){
        system.debug(this.name + 'is sleeping');
    }
}
// this refers to it class variable everytime whichever class this. refers the class variable 

//methodun icinde olmayan ama class in icinde olan bir variable i cagirmak icin this. diyerek onu cagirabiliriz buldurabiliriz.