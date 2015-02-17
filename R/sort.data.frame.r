#' Sort data.frame Objects
#' 
#' Sort a data.frame by one or all columns.
#' 
#' @param x ...
#' @param decreasing Logical, sort in decreasing order. See also \link[base]{sort}.
#' @param by Index (integer) or names of columns in \code{x} to sort by in that order.
#' If both \code{by} and \code{bye} are missing, all columns are used to sort in their
#' order.
#' @param bye Unquoted column name or \code{list()} or \code{.()} with unquoted
#' column names to sort \code{x} by. Not evaluated if \code{by} is supplied
#' @param na.last \code{TRUE} to put missing values last, \code{FALSE} to put first or
#' \code{NA} to remove.
#' 
#' @examples
#' #
#' 
#' d <- data.frame(a=c(1,1,1,2,NA),b=c(2,1,3,1,1),c=5:1)
#' d
#' sort(d) # sorted by all columns
#' sort(d, TRUE, by="c") # decreasing by column 'c'
#' sort(d, bye=.(a,c)) # increasing by columns 'a' and then 'c'
#' 
#' #
#' @name sort
#' @aliases sort.data.frame
#' @author Sven E. Templer (\email{sven.templer@@gmail.com})

#' @rdname sort
#' @export sort.data.frame
#' @method sort data.frame
sort.data.frame <- function (x, decreasing = FALSE, by = NULL, bye = NULL, na.last = NA) {
  
  # get expression
  bye <- substitute(bye)
  if (length(bye) == 1 && bye == "NULL")
    bye <- NULL
  
  # determine column index
  if (is.null(by) && is.null(bye))
    by <- seq(ncol(x))
  else if (is.null(by)) {
    if (is.call(bye)) {
      byefun <- as.character(bye[[1]])
      if (!byefun %in% c("list", "."))
        stop("bye must be a single unquoted column name or a list/. with column names.")
      bye[[1]] <- NULL
    }
    by <- as.character(bye)
  }
  
  # get the order
  o <- do.call(order, c(x[,by,drop=F], decreasing = decreasing, na.last = na.last))
  x[o,]
}