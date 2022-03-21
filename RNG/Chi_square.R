library("Rcmdr")
setwd("/home/ajo/gitRepos/simulation/RNG")
my_data <- read.delim("fib_lagged_out.txt")

#Counting the amount of elements in each category "table" function.
my_data$category <- with(my_data, binVariable(Variable, bins = 10, method = "intervals", 
                                             labels = c("1", "2", "3", "4", "5", "6", "7", "8", "9", "10")))

R_data <- data.frame(
  "Variable" = runif(200,0,1)
)

#Counting the amount of elements in each category "table" function.
R_data$category <- with(R_data, binVariable(Variable, bins = 10, method = "intervals", 
                                              labels = c("1", "2", "3", "4", "5", "6", "7", "8", "9", "10")))

MergedDataset <- merge(R_data, my_data, all = TRUE, by = "row.names")
rownames(MergedDataset) <- MergedDataset$Row.names
MergedDataset$Row.names <- NULL

MergedDataset <- within(MergedDataset, {
  Variable.x <- NULL
  Variable.y <- NULL
})


Test=chisq.test(table(MergedDataset), correct=FALSE)
Test
