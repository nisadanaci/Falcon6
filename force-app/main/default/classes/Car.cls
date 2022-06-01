public class Car {                           


   //public variable defined directly inside class
   //this can be accessed outside of class
   public string carColor = '';
   public string carName = '';
   
   //private varible.
   //this can be only be accessed within the class
    private integer maxSpeedKMperHour = 150;

      //1. access modifier
      //2. return type
      
      
    public void switchOn() {   
       //this is method body
       //updated code
       Datetime switchOnTime = Datetime.now();              
       system.debug('starting the car.');   
    }

    public void drive(){
       //system.debug(switchOnTime);
       system.debug('driving ' + carName);
      }
      
       public void driveAtMaxSpeed(){
          string drivingDescription = 'driving ' + carName + 'at ' + maxSpeedKMperHour + 'km/h';
          system.debug(drivingDescription);   
    }
}
