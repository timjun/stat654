


data hw2;
	input y x;
	retain x; retain y;
	xsq = x*x;
	yinv = 1/y;
	xinv = 1/x;
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


proc print data=hw2;
run;

proc reg data=hw2;
	model yinv = xinv;

proc autoreg data=hw2 plots=none;
	model yinv = xinv;
	
proc reg data=hw2 plots=predictions(x=x);
	model y = x xsq;
	
proc autoreg data=hw2 plots=none;
	model y = x xsq;
