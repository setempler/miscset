context("test-scale0.R")

n <- 1:10

test_that("length of input/output is identical", {
  length(n) == length(scale0(n))
})
