#' @name rmall
#' @keywords remove all
#' @author Sven E. Templer \email{sven.templer@@gmail.com}
#' @title Remove All Objects from Global Environment
#' @description
#' Remove all objects from the global environment.
#' @param ... Arguments forwarded to \code{ls} to get all objects.
#' @seealso
#' \link{rm}, \link{ls}

#' @export rmall
rmall <- function (...) {
  n <- ls(envir=.GlobalEnv, ...)
  rm(list=n, envir=.GlobalEnv)
  invisible(NULL)
}
