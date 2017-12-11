source("test.R")

# Problem statement
# The captcha requires you to review a sequence of digits (your puzzle input)
# and find the sum of all digits that match the next digit in the list.
# The list is circular, so the digit after the last digit is the first digit
# in the list.

# Preamble
# R has exceptional built-in support for vector operations. For now, we're
# using the term 'vector' and 'list' interchangeably. The key point here is
# that we want to 'think in vectors' and avoid explicit loop constructs which
# can detract from the meaning of the code.

# Solution
# One way of testing equality of consecutive numbers in a list is to construct
# A copy of the list, offset by one and check whether elements at the same index
# are equal. Since we want this check to 'wrap around', instead of just using an
# offset, we can rotate our list instead.

# The square bracket accessor in R has some interesting features.
# Passed a vector of indices, it will return a new vector with elements plucked
# from the source at the indices specified.
# For instance: c(5,4,3,2)[4:1] returns the array in reverse.
# So a left-rotated vector of length `n` can be easily attained by passing the
# vector 2, 3, 4, ..., n, 1
rotVec <- function (n, offs = 1) {
    vect <- (1:n + offs) %% n
    vect[vect == 0] <- n
    vect
}
rotLeft <- function (vec) vec[rotVec(length(vec))]

# Like many other vector operators, `==` is applied element-wise. Comparison
# between two vectors of equal length returns a new vector with `TRUE` where
# elements at the same index are equal. Conveniently, passing a vector of
# booleans to `[]` returns elements from the source at which the corresponding
# elements in the passed vector are `TRUE`.
sumAdjacent <- function (vec) sum(vec[vec == rotLeft(vec)])

# Finally, parse our input from string to a vector of ints.
prepareVec <- function (str) as.numeric(unlist(strsplit(str, "")))
problemOne <- function (input) sumAdjacent(prepareVec(input))

# Time to run our test cases!
asserter <- assert(problemOne)

asserter("1122", 3)
asserter("1111", 4)
asserter("1234", 0)
asserter("91212129", 9)
