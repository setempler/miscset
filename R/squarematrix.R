#' @name squarematrix
#' @keywords square matrix
#' @author Sven E. Templer (\email{sven.templer@@gmail.com})
#' @title Create a Square Matrix
#' @description
#' Transform any m x n (m != n) matrix to a square matrix by column/row names.
#' @param x Object of class \code{matrix}.
#' @return
#' Returns a \code{matrix}.
#' @examples
#' m <- matrix(1:6,2)
#' dimnames(m) <- list(2:3,1:3)
#' m
#' squarematrix(m)

#' @export squarematrix
squarematrix <- function (x) {
  
  if (is.null(dimnames(x))) { stop("Provide dimnames for matrix x.")}
  
  n <- unique(unlist(dimnames(x)))
  o <- matrix(NA, nrow = length(n), ncol = length(n), dimnames = list(n, n))
  
  o[rownames(x), colnames(x)] <- x
  o <- o[sort(rownames(o)), sort(colnames(o))]
  
  return(o)
  
}
