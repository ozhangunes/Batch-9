Calculator2 c2 = new Calculator2();
integer s = c2.add(5 , 100);
system.debug('sum of 5 and 100 is ' + s);

integer x = c2.add(3, 4, 5);
system.debug('x is --->' + x);


Calculator2 ly = new Calculator2();
Date today = date.today();
boolean isLeap = ly.leapYearCheck(today);
system.debug(isLeap);