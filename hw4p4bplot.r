
y=c(1275,1350,1650,2000,3750,4222,5018,6125,6200,8150,9975,12200,12750,13014,13275)
x=c(230,235,250,277,522,545,625,713,735,820,992,1322,1900,2022,2155)

poly<-function(x) -.00358*(x^2) +15.10860*x - 2292.77419
inv<-function(x) 1/((.1743/x)-.000055)

plot(x,y,main="Fit Plots: Squared vs Inverse",ylab="Surgical Cases", xlab="Worker Hours Per Month")
lines(x,poly(x))
lines(x,inv(x),lty=2)
legend(1500,5000,legend=c("squared","inverse"), lty=c(1,2))
