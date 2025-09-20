# Sampling
n <- 100
x <- sample(1:10, n, replace = TRUE)
summary(x)
mean(x)
plot(table(x))

median(x)
quantile(x)

sum((x - mean(x))^2) / n
# there's no R builtin function for population variance


sum((x - mean(x))^2) / (n - 1)
var(x) # R builtin function for sample variance

var(x) * (n - 1) / n


table(x)
boxplot(x)

# Relative frequencies
plot(table(x) / n)

# which sum up to 1
fi <- table(x) / n
fi
sum(fi)
cumsum(fi)

plot.ecdf(x, main = "Empirical Distribution Function")
