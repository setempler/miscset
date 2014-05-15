#' @name mgrepl
#' @importFrom parallel mclapply
#' @keywords multiple grep sub gsub
#' @author Sven E. Templer (\email{sven.templer@@gmail.com})
#' @title Multiple Pattern Matching and Replacement
#' @description
#' \code{mgrepl} searches for any or all multiple amount of patterns and
#' return logical values. Combination of the results is done via the logic
#' functions any or all. Multicore feature is made available by the imported
#' function \code{parallel:mclapply}.
#' \code{sub} and \link{gsub} replace a multiple number of patterns in a 
#' vector.
#' @param patterns A character vector containing a regular expressions.
#' (\link{regex}) to be searched in \code{text}.
#' @param text Character vector where the search and replace is performed.
#' @param replacement Character vector with the replacement pattern.
#' @param log.fun For \code{mgrepl}. Logical function (\code{any} or 
#' \code{all}) to evaluate occurence of each pattern in \code{patterns} in each
#' value of \code{text}.
#' @param cores Numeric value for how many cores to use for computation using 
#' \code{mclapply}.
#' @param \dots Further arguments passed to functions \code{grepl()}, \code{sub()} and \code{gsub()}.
#' @return
#' \code{msub} and \link{mgsub}:
#' Same as \code{text} but with all \code{patterns} replaced.
#' \code{mgrepl}:
#' Logical vector of length \code{length(text)} where \code{TRUE} means either
#' any or all patterns in \code{patternlist} are matched in \code{text}
#' depending on \code{log.fun}.
#' @seealso
#' \link{grep}, \link{mclapply}
#'  
#' @examples
#' # Compare different "log.fun" parameters:
#' mgrepl(c("a","b"), c("ab","ac","bc"), any)
#' mgrepl(c("a","b"), c("ab","ac","bc"), all)
#' 
#' # Replace several patterns (gplobally):
#' msub(letters[1:3], "<replaced>", letters[1:5])
#' mgsub(letters[1:2], "<replaced>", c("ab","ba","acb",NA))

#' @export mgrepl
mgrepl <- function(patterns, text, log.fun = any, cores = 1, ...) {

  ina <- is.na(text)
  patterns <- as.list(unlist(patterns))
  f <- match.fun(log.fun)
  i <- mclapply(patterns, function (y) grepl(y, text, ...), mc.cores=cores)
  i <- do.call(cbind, i)
  i <- apply(i, 1, f)
  i[ina] <- NA
  return(i)
  
}

#' @rdname mgrepl
#' @export msub
msub <- function(patterns, replacement, text, ...) {
  
  patterns <- as.list(unlist(patterns))
  for (i in patterns) {
    text <- sub(i, replacement, text, ...)
  }
  return(text)
  
}

#' @rdname mgrepl
#' @export mgsub
mgsub <- function(patterns, replacement, text, ...) {
  
  patterns <- as.list(unlist(patterns))
  for (i in patterns) {
    text <- gsub(i, replacement, text, ...)
  }
  return(text)
  
}
