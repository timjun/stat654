



PROC IMPORT DATAFILE= "/home/tjun20/ch211.xlsx" 
   OUT=ch211
   DBMS=XLSX
   REPLACE;
   getnames= YES;
   


data newch211;
	set ch211;
	retain Soaktime;
	if Soaktime <= 2 then SoaktimeLow = 1;
		else SoaktimeLow = 0;
	if Soaktime <= 4 and Soaktime > 2 then SoaktimeMed = 1;
		else SoaktimeMed = 0;
	if Soaktime > 4 then SoaktimeHigh = 1;
		else SoaktimeHigh = 0;
			

PROC PRINT DATA=newch211;

proc reg data=newch211 plots=qqplot;
	model Pitch = Temp Soaktime Soakpct Difftime Diffpct / clb;
	
proc reg data=newch211 plots=qqplot;
	model Pitch = Soaktime Difftime / clb;
	
proc reg data=newch211 plots=qqplot;
	model Pitch = SoaktimeLow SoaktimeMed Difftime / clb;
