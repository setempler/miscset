#' Number of Unique Values
#' 
#' Return the number of unique values in a vector.
#' 
#' @param x Numeric vector to transform.
#' @param na Logical, \code{TRUE} to include/count \code{NA}.
#' @param ... Arguments forwarded to \link{unique}.
#' 
#' @examples
#' #
#' v <- c("a","b","a")
#' nunique(v)
#' 
#' #
#' @name nunique
#' @keywords unique
#' @author Sven E. Templer \email{sven.templer@@gmail.com}

#' @rdname nunique
#' @export
nunique <- function (x, na = TRUE, ...) {
    
  if (is.factor(x)) {
    if (na)
      nlevels(x) + any(is.na(x))
    else
      nlevels(x)
  } else {
    if (na)
      length(unique(x, ...))
    else
      length(unique(x[!is.na(x)], ...))
  }
  
}
