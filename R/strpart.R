#' Split String and Return Part
#' 
#' Return the nth part of a splitted string.
#' 
#' @param x Character vector.
#' @param split Regular expression splitting strings.
#' @param n Number of part to extract.
#' @param ... Arguments passed to \code{strsplit}.
#' @param roll Logical, if to use the last when less than maximum parts.
#' @return
#' A character vector of the extracted parts.
#' @seealso
#' \link{strsplit}
#' @examples
#' #
#' 
#' strpart(c("abc","abcb","abc"), "", 4)
#' strpart(c("abc","abcb","abc"), "", 4, roll=TRUE)
#' 
#' #
#' @name strpart
#' @keywords extract part string
#' @author Sven E. Templer (\email{sven.templer@@gmail.com})

#' @export strpart
strpart <- function (x, split, n, ..., roll = F) {
  x <- strsplit(x, split, ...)
  if (roll)
    x <- unlist(lapply(x, function (y) tail(y, 1)))
  else
    x <- unlist(lapply(x, function (y) y[n]))
  return(x)
}
