# stat654
data hw2;
	input y x;
	retain x;
	xsq = x*x;
	datalines;
	1275 230
	1350 235
	1650 250
	2000 277
	3750 522
	4222 545
	5018 625
	6125 713
	6200 735
	8150 820
	9975 992
	12200 1322
	12750 1900
	13014 2022
	13275 2155
;

data anno;
   function='move'; 
   xsys='1'; ysys='1'; 
   x=0; y=0; 
   output;

   function='draw'; 
   xsys='1'; ysys='1'; 
   color='vibg'; 
   x=100; y=100; 
   output;

/*
proc print data=hw2;
run;

proc reg data=hw2;
	
	model y = x;
	plot y*p. / anno=anno ;
	
*/

proc reg data=hw2 plots=qqplot alpha=.1;
	var xsq;
	model y = x / clb ;
	add xsq;
	plot y*p. / anno=anno;


proc reg data=hw2;
	ods graphics off;
	var xsq;
	model y = x / clm;
	add xsq;

		
run;
