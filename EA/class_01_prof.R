# generate a sample and basic statistics
x <- sample(1:10, 100, replace = TRUE)
summary(x)
mean(x)
plot(table(x))

plot(table(sample(1:10, 100, replace = TRUE)))

median(x)
quantile(x)

var(x)   #s'2
sum((x - mean(x))^2) / 100   # s2
sum((x - mean(x))^2) / 99   # s'2

mean((x - mean(x))^2)   # s2
mean(x^2) - mean(x)^2   # s2

n <- 100
var(x) * (n - 1) / n

table(x)
boxplot(x)
plot(table(x) / n)

plot.ecdf(x, main = "Empirical Distribution Function")

fi <- table(x) / n
fi
sum(fi)
cumsum(fi)

y <- runif(100)   # sample of a continuous variable
table(y)   # wrong
summary(y)
hh <- hist(y, freq = FALSE)
hh


#slide 13 - Empirical distribution function
n <- 100
sample1 <- sample(10, size = n, replace = TRUE)
frel <- table(sample1) / n
plot(frel, xlab = "ball number", ylab = "relative frequency", main = "sample diagram")
plot.ecdf(sample1, xlab="ball number", ylab="relative frequency",main="empirical distribution function")

#slide 30 - Binomial distribution
n <- 10
p <- 0.5

x <- 0:n
fx <- dbinom(x,size=n,prob=p)
plot(x, fx, pch=20, type="p",main=paste("Bi(",n,",",p,")"))
lines(x,fx,type="h")

pbinom(3,size=n,prob=p)	#P(X<=3) = 0.171875
dbinom(3,size=n,prob=p)	#P(X=3) = 0.1171875
qbinom(0.171875,size=n,prob=p)


#slide 32 - Hypergeometric distribution
N <- 100
n <- 10
p <- 0.5

x <- 0:n
fx <- dhyper(x,m=N*p,n=N*(1-p),k=n)
plot(x, fx, pch=20, type="p",main=paste("H(",N,",",n,",",p,")"))
lines(x,fx,type="h")

phyper(3,m=N*p,n=N*(1-p),k=n)	#P(X<=3) = 0.15892
dhyper(3,m=N*p,n=N*(1-p),k=n)	#P(X=3) = 0.1130964
qhyper(0.15892,m=N*p,n=N*(1-p),k=n)



#slide 34 - Poisson distribution
l <- 1.5

x <- 0:10
fx <- dpois(x,lambda=l)
plot(x, fx, pch=20, type="p",main=paste("Po(",l,")"))
lines(x,fx,type="h")

ppois(3,lambda=l)	#P(X<=3) = 0.9343575
dpois(3,lambda=l)	#P(X=3) = 0.1255107
qpois(0.9343575,lambda=l)



#slide 38 - Normal distribution
miu <- 5
sigma2 <- 25; sigma <- sqrt(sigma2)

x <- seq(-4,4,by=0.01)*sigma + miu
fx <- dnorm(x,mean=miu,sd=sigma)
plot(x, fx, pch=20, type="l",main=paste("N(",miu,",",sigma2,")"))

pnorm(3,mean=miu,sd=sigma)	#P(X<=3) = 0.3445783
pnorm((3-miu)/sigma)	      #P(Z<=-0.4) = 0.3445783
qnorm(0.3445783,mean=miu,sd=sigma)


#slide 40 - Bivariate Normal distribution
library(mvtnorm)

mu <- c(0, 0)
#correlation = 0
Sigma <- matrix(c(1, 0, 0, 1), nrow = 2)
data1 <- rmvnorm(n = 1000, mean = mu, sigma = Sigma)
plot(data1, main = "Bivariate Normal data",
     xlab = "X", ylab = "Y", pch = 19, col = rgb(0, 0, 1, 0.3))

x <- seq(-4, 4, length = 100)
y <- seq(-4, 4, length = 100)
grid <- expand.grid(X = x, Y = y)
z <- matrix(dmvnorm(grid, mean = mu, sigma = Sigma), nrow = 100)

persp(x, y, z, col = "lightblue", zlab = "Density", main = "Bivariate Normal Distribution")

#correlation = 0.3
Sigma <- matrix(c(1, 0.3, 0.3, 1), nrow = 2)
data1 <- rmvnorm(n = 1000, mean = mu, sigma = Sigma)
plot(data1, main = "Bivariate Normal data",
     xlab = "X", ylab = "Y", pch = 19, col = rgb(0, 0, 1, 0.3))

z <- matrix(dmvnorm(grid, mean = mu, sigma = Sigma), nrow = 100)
persp(x, y, z, col = "lightblue", zlab = "Density", main = "Bivariate Normal")

#correlation = 0.8
Sigma <- matrix(c(1, 0.8, 0.8, 1), nrow = 2)
data1 <- rmvnorm(n = 1000, mean = mu, sigma = Sigma)
plot(data1, main = "Bivariate Normal data",
     xlab = "X", ylab = "Y", pch = 19, col = rgb(0, 0, 1, 0.3))

z <- matrix(dmvnorm(grid, mean = mu, sigma = Sigma), nrow = 100)
persp(x, y, z, col = "lightblue", zlab = "Density", main = "Bivariate Normal")


#slide 44 - Exponential distribution
lambda <- 2

x <- seq(0,5,by=0.01)
fx <- dexp(x,rate=lambda)
plot(x, fx, pch=20, type="l",main=paste("Exp(",lambda,")"))

Fx <- pexp(x,rate=lambda)
plot(x, Fx, pch=20, type="l",main=paste("Exp(",lambda,")"))

pexp(3,rate=lambda)	#P(X<=3) = 0.9975212
qexp(0.9975212,rate=lambda)


#slide 49 - problem 1
n <- 200
p <- 0.15
1 - pbinom(20, size = n, prob = p)  #exact probability

#slide 50 - problem 2
lb <- 120
ppois(129,lambda=lb)-ppois(100,lambda=lb)  #exact probability