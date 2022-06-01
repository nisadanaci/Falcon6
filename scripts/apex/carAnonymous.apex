Car bm = new Car();
//access variable using object(bm)
bm.carColor = 'black';
bm.carName = 'bwm';
//system.debug('car color = ' + bm.carColor);
bm.switchOn();
system.debug('car obj 1 = ' + bm);

//try to access private variable
Car lm = new Car();
lm.carColor = 'red';
lm.carName = 'lambo';
//system.debug('car color : ' +lm.carColor);
lm.switchOn();
system.debug('car obj 2 = '+ lm);
//lm.maxSpeedKMperHour = 100;

car vw = new car();
vw.carColor ='white';
vw.carName = 'polo';
vw.drive();
vw.driveAtMaxSpeed();
system.debug('vw = '+ vw);



car c = new car();
c.carName = 'c';
// the answer is nothing these are two tehese obj if car  custom obj it has two fields car name and color calling this one record car name is =c
//one have record one data not assigning second record it is not work like that it is empty
car d = new car();
system.debug(d.carName); ///the reason is car name is empty initially
