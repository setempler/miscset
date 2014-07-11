#' Apply a Function by a Grid on a List
#' 
#' \code{gapply} applies a function on a \code{data.frame} by using named list
#'  entries as grid. Support of multicore processing via \code{mclapply}.\cr
#' \code{levels} is a method to retrieve the grid of a \code{gapply} object.\cr
#' \code{as.data.frame} is a simplified rbind version which adds the grid
#' to the output.
#' 
#' The output of \code{gapply} is a list inheriting from the S3 class gapply which stores
#' the grid of the original data. Support for subsetting grid entries is not yet
#' supported.
#' 
#' @param d A data.frame or data.table object.
#' @param by A character vector with colnames for the grid to subset.
#' @param fun A function to apply on \code{d}.
#' @param ... Additional arguments to \code{fun} or to \code{as.data.frame} method.
#' @param drop Drop grid columns for \code{fun}.
#' @param cores Number of multicores as \code{mc.cores} in \code{mclapply}.
#' @param x Object of class \code{gapply}.
#' @param keyv Character vector for \code{data.table} keys.
#' 
#' @seealso
#' \link{mclapply}, \link[data.table]{setkeyv}
#' @examples
#' #
#' 
#' f <- function (x) c(conc.diff = diff(range(x$conc)), uptake.sum=sum(x$uptake))
#' d <- gapply(CO2, c('Type', 'Treatment'), f)
#' d
#' levels(d)
#' as.data.frame(d)
#' 
#' #
#' @name gapply
#' @author Sven E. Templer (\email{sven.templer@@gmail.com})

#' @export gapply
gapply <- function (d, by, fun, ..., drop = F, cores = 1) {
  fun <- match.fun(fun)
  d <- as.data.frame(d, stringsAsFactors=F)
  gr <- lapply(d[,by,drop=F], unique)
  gr <- expand.grid(gr, stringsAsFactors=F)
  n <- names(d)[!names(d) %in% by]
  r <- mclapply(1:nrow(gr), function (i) {
    ii <- apply(do.call(cbind, lapply(by, function (y) d[,y] == gr[i,y])), 1, all)
    di <- d[ii,]
    if (drop)
      di <- di[,n,drop=F]
    if (nrow(di) == 0)
      return(NULL)
    else
      fun(di, ...)
  }, mc.cores = cores)
  i <- which(sapply(r, function (x) !is.null(x)))
  r <- r[i]
  gr <- gr[i,]
  if (length(by) == 1) {
    gr <- as.data.frame(gr, stringsAsFactors=F)
    names(gr) <- by
  }
  attr(r, 'grid') <- gr
  class(r) <- c('gapply')
  return(r)
}

#' @rdname gapply
#' @export levels.gapply
#' @method levels gapply
levels.gapply <- function (x) {
  attr(x, 'grid')
}

#' @rdname gapply
#' @export as.data.frame.gapply
#' @method as.data.frame gapply
as.data.frame.gapply <- function (x, ...) {
  g <- levels(x)
  use <- sapply(x, function(y) {
    is <- FALSE
    is <- is.data.frame(y) && nrow(y) > 0 || length(y) > 0
    return(is)
  })
  if (!any(use))
    stop("No elements are data.frames.")
  x <- x[use]
  g <- g[use, , drop=F]
  g <- split(g, 1:nrow(g))
  ret <- Map(function(x, g) {
    data.frame(as.data.frame(rbind(x), ...), g, stringsAsFactors=F)
  }, x=x, g=g)
  ret <- do.call(rbind, ret)
  row.names(ret) <- NULL
  return(ret)
}

#' @rdname gapply
#' @export as.data.table.gapply
#' @method as.data.table gapply
as.data.table.gapply <- function (x, keyv = NULL, ...) {
  if (!require(data.table))
    stop("Package data.table not installed.")
  ret <- as.data.table(as.data.frame(x, ...))
  if (!is.null(keyv))
    setkeyv(ret, keyv)
  return(ret)
}

# gapply <- function (d, g, fun, ..., drop = F, cores = 1) {
#   if (!require(data.table))
#     stop("Require package data.table installation.")
#   if (!is.data.frame(d))
#     stop("Provide a data.frame. Lists not yet supported.")
#   if (!is.data.table(d))
#     d <- data.table(d)
#   fun <- match.fun(fun)
#   k <- key(d)
#   gr <- lapply(d[,g,with=F,drop=F], unique)
#   gr <- expand.grid(gr, stringsAsFactors=F)
#   gr <- data.table(gr)
#   n <- names(d)[!names(d) %in% g]
#   r <- mclapply(1:nrow(gr), function (i, d, f, g, gr) {
#     setkeyv(gr, g)
#     gi <- gr[i,]
#     setkeyv(gi, g)
#     setkeyv(d, g)
#     #return(list(d, gi))
#     di <- d[gi]
#     return(di)
#     if (drop)
#       di <- di[,n,with=F]
#     #print(di)
#     f(di, ...)
#   }, d=d, gr=gr, f=fun, g=g, mc.cores = cores)
#   setkeyv(d, k)
#   attr(r, 'grid') <- gr
#   class(r) <- c('gapply')
#   return(r)
# }
