#' @name ciplot
#' @author Sven E. Templer
#' @title Barplot with confindence intervals
#' @description 
#' Create barplots of a list of numeric values and arrows
#' according to the confidence interval, standard deviation,
#' interquartile range, etc.
#' @param x List of numeric values
#' @param heigth.fun Function to apply on each list object
#' to calculate the height of the bars from.
#' @param range.fun Function to calculate the range of the
#' arrows (e.g. a confidence interval). See details.
#' @details 
#' sd_range <- function (x) { m <- mean(x); s <- sd(x); c(m-s,m+s)}



#' @rdname ciplot
#' @export
ciplot <- function (x, ...) { UseMethod("ciplot") }

#' @rdname ciplot
#' @export
ciplot.default <- function (x, height.fun = mean, range.fun = ci, ..., arrows.args = list()) {
  heights <- sapply(x, height.fun)
  arrows <- lapply(x, range.fun)
  bars <- barplot(heights, ...)
  arrows.args <- list(x0 = bars[,1])
}

