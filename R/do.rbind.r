#' Bind data.frames in a List by Rows
#' 
#' Same as do.call(rbind, x), but adding a column with the
#' name of each table. Missing names are replaced by integers.
#' 
#' @param x List with data.frames. Non data.frame objects are dropped.
#' @param idcol Name for column with ids in output.
#' @name do.rbind
#' @return
#' Returns a data.frame
#' @author Sven E. Templer

#' @export
do.rbind <- function (x, idcol = "Name") {
  
  # check for data.frames
  u <- sapply(x, inherits, "data.frame")
  if (any(!u))
    warning("Dropping non data.frame elements from 'x'.")
  x <- x[u]
  if (!length(x)>0)
    stop("No data.frame objects in 'x'.")
  
  # get names
  n <- names(x)
  if (is.null(n))
    n <- seq_along(x)
  r <- sapply(x, nrow)
  i <- rep(n, r)
  
  # bind
  x <- do.call(rbind, x)
  x[[idcol]] <- i
  
  # return
  return(x)
  
}
