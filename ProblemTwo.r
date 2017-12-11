source("test.R")

# Problem Statement
# For each row [in the input], determine the difference between the largest
# value and the smallest value; the checksum is the sum of all of these
# differences.

# Solution
# One of the more interesting built-in data structures is the DataFrame.
# Think of it a bit like a table which can be sliced to return values by
# row or by column.

# `apply` is similar to `map` from functional programming, and common to many
# other languages. Here, the second argument can be used to select whether we
# should 'apply' to rows or columns of a DataFrame. The function below reads:
# "return a vector with the results of `max` applied to each row in `df`.
rowMax   <- function (df) apply(df, 1, max, na.rm = TRUE)
rowMin   <- function (df) apply(df, 1, min, na.rm = TRUE)
rowSums  <- function (df) sum(rowMax(df) - rowMin(df))

importFile <- function (fname) as.data.frame(read.csv(file = fname, header = FALSE, sep = ","))
problemTwo <- function (input) rowSums(importFile(input))

asserter <- assert(problemTwo)

asserter("ProblemTwo.csv", 18)
