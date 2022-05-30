library(FrF2)

ExperimentDesign <- expand.grid(A = gl(2, 1, labels = c("-", "+")),
                                B = gl(2, 1, labels = c("-", "+")),
                                C = gl(2, 1, labels = c("-", "+")),
                                D = gl(2, 1, labels = c("-", "+")))
ExperimentDesign

write.csv(ExperimentDesign, "design.csv", row.names = F)

y <- c(0.995, 0.98, 0.975, 0.97,
       0.98, 0.96, 0.94, 0.95,
       0.98, 0.97, 0.94, 0.91,
       0.96, 0.91, 0.93, 0.88)
y <- rev(y)
ep <- cbind(ExperimentDesign, y)
ep

write.csv(ep, "design.csv", row.names = F)

library(unrepx)
yates(y)

# Test linear regression for DOE. Not discussed in report. 
fit <- lm(formula = y ~ (A + B + C + D)^3, data = ExperimentDesign)
summary(fit)
par(mfrow=c(2,2))
plot(fit)
