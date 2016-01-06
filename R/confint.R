#' @name confint
#' @author Sven E. Templer
#' @title Confidence intervals for numeric vectors
#' @description
#' Calculate confidence intervals for values of a numeric vector.
#' @param x A numeric vector
#' @param level Size of confidence (0 < size < 1).
#' @param q.fun Function for quantile calculation.
#' e.g. \code{qnorm}, \code{qt}
#' @param ret.attr Logical, to include the mean value and function arguments
#' as attributes of the returned object.
#' @return 
#' Returns a numeric vector with the lower and upper range of the
#' confidence interval.
#' @examples
#' #
#' 
#' confint(1:3)
#' confint(1:3, ret.attr = FALSE)
#' 
#' #

#' @rdname confint
#' @export
confint.numeric <- function (x, level = .95, q.fun = qnorm, ret.attr = TRUE) {
  if (any(level >= 1, level <= 0)) stop("level out of range")
  level <- 1 - (1 - level)/2
  n <- length(x)
  s <- sd(x)
  i <- q.fun(level) * s / sqrt(n)
  m <- mean(x, na.rm = TRUE)
  r <- c(m - i, m + i)
  if (ret.attr) {
    attr(r, "mean") <- m
    attr(r, "level") <- level
    attr(r, "quantile") <- q.fun
  }
  return(r)
}