



x = 0:10
b1 = 1
b2 = c(1/8,1,8,64)
b3 = 1
y=function(x){b1*exp(-b2*exp(-b3*x))}  #gompertz model

z=sapply(x,y)   # matrix of values for the 4 parameter values of b2 over x

plot(x,type="n",col="red",ylim=c(-.05,1.05),ylab="y",xlab="x")
lines(z[1,],col="black",type="b",pch=1)
lines(z[2,],col="blue",type="b",pch=2)
lines(z[3,],col="green",type="b",pch=3)
lines(z[4,],col="red",type="b",pch=4)
legend(9,.5,c("b2 = 1/8","b2 = 1","b2 = 8","b2 = 64"),col=c("black","blue","green","red"),pch=c(1,2,3,4))
