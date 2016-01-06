#' @name ciplot
#' @keywords barplot error bars
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
#' Use standard deviation to calculate range:\cr
#' sd_range <- function (x) { m <- mean(x); s <- sd(x); c(m-s,m+s)}



#' @rdname ciplot
#' @export
ciplot <- function (x, ...) { UseMethod("ciplot") }

#' @rdname ciplot
#' @export
ciplot.default <- function (x, height.fun = mean, range.fun = confint, ylim,
                            ..., arrows.args = list()) {
  
  heights <- sapply(x, height.fun)
  arrows.r <- lapply(x, range.fun)
  arrows.left <- sapply(arrows.r, min)
  arrows.right <- sapply(arrows.r, max)
  if (missing(ylim)) {
    al <- min(0, arrows.left)
    al <- ifelse(al < 0, al * 1.1, al * 0.9)
    ar <- max(0, arrows.right * 1.1)
    ylim <- c(al, ar)
  }
    
  bars <- barplot(heights, ylim = ylim, ...)
  arrows.x <- sapply(bars, as.vector)
  arrows.args <- c(list(x0 = arrows.x, x1 = arrows.x, y0 = arrows.left, y1 = arrows.right, 
                        code = 3, angle = 90), arrows.args)
  do.call(arrows, arrows.args)
  invisible(list(heights, arrows.r))
}

