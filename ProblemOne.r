source("test.R")

# to find numbers which match the following number, rotate the vector
# and select elements which match at the same index

# generate a vector of offset indices
# length is `n`, rotated left by `rot`
# e.g. rotation(4) -> 2 3 4 1
#      rotation(4, 2) -> 3 4 1 2
rotation <- function (n, offs = 1) {
    rotVec <- (1:n + offs) %% n
    rotVec[rotVec == 0] <- n
    rotVec
}
rotLeft     <- function (vec) vec[rotation(length(vec))]
sumAdjacent <- function (vec) sum(vec[vec == rotLeft(vec)])
prepareVec  <- function (str) as.numeric(unlist(strsplit(str, "")))
problemOne  <- function (input) sumAdjacent(prepareVec(input))

# Do our testing!
asserter <- assert(problemOne)

asserter("1122", 3)
asserter("1111", 4)
asserter("1234", 0)
asserter("91212129", 9)
