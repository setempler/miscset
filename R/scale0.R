#' @name scale0
#' @keywords scale
#' @author Sven E. Templer \email{sven.templer@@gmail.com}
#' @title Scale to Range 0 to 1
#' @description
#' Scale numeric values to a range from 0 to 1.
#' @param x Numeric vector to transform.
#' @return Numeric vector
#' @examples
#' #
#' scale0(-1:3)

#' @export scale0
scale0 <- function (x) {
  xmin <- min(x, na.rm=T)
  x <- x - xmin
  xmax <- max(x, na.rm=T)
  x <- x / xmax
  return(x)
}
