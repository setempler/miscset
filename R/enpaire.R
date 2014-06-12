#' Create a Pairwise List from a Matrix
#' 
#' Transform a \code{matrix} or \code{dist} object to a pairwise list.
#' 
#' @param x Object of class \code{matrix}.
#' @param upper Logical, return values from upper triangle.
#' @param lower Logical, return values from lower triangle.
#' @param ... Arguments passed to methods.
#' @return
#' Returns a \code{data.frame}. The first and second column represent the
#' dimension names for a value in \code{x}. The following columns contain
#' the values for the upper or lower triangle.
#' @seealso
#' \link{squarematrix}
#' @examples
#' #
#' 
#' m <- matrix(letters[1:9], 3, 3, dimnames = list(1:3,1:3))
#' enpaire(m)
#' enpaire(m, lower = FALSE)
#' 
#' #
#' @name enpaire
#' @keywords pairwise matrix
#' @author Sven E. Templer (\email{sven.templer@@gmail.com})

#' @rdname enpaire
#' @export enpaire
enpaire <- function (x, ...) {
  UseMethod("enpaire")
}

#' @rdname enpaire
#' @method enpaire default
enpaire.default <- function (x, ...) {
  stop("x must be of class matrix or dist.")
}

#' @rdname enpaire
#' @export enpaire.dist
#' @method enpaire dist
enpaire.dist <- function (x, upper = T, lower = T, ...) {
  x <- as.matrix(x)
  NextMethod("enpaire")
}

#' @rdname enpaire
#' @export enpaire.matrix
#' @method enpaire matrix
enpaire.matrix <- function (x, upper = T, lower = T, ...) {
  if (!upper & !lower)
    stop("Nothing to return, set at least one of upper/lower TRUE.")
  d <- dimnames(x)
  if (is.null(d))
    dimnames(x) <- list(1:nrow(x), 1:ncol(x))
  else
    dimnames(x) <- lapply(dimnames(x), function (y) if (is.null(y)) 1:nrow(x) else y)
  x <- squarematrix(x)
  pairs <- t(combn(rownames(x), 2))
  colnames(pairs) <- c("row", "col")
  u <- l <- NA
  if (upper)
    l <- t(x)[upper.tri(x)]
  if (lower)
    u <- t(x)[lower.tri(x)]
  ret <- data.frame(pairs, lower = l, upper = u, stringsAsFactors = F)
  return(ret)
}
