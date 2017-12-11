source("test.R")

rowMax   <- function (df) apply(df, 1, max, na.rm = TRUE)
rowMin   <- function (df) apply(df, 1, min, na.rm = TRUE)
rowSums  <- function (df) sum(rowMax(df) - rowMin(df))

importFile <- function (fname) as.data.frame(read.csv(file = fname, header = FALSE, sep = ","))
problemTwo <- function (input) rowSums(importFile(input))

asserter <- assert(problemTwo)

asserter("ProblemTwo.csv", 18)
