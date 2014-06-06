#' Miscellaneous R Tools
#' 
#' Set of miscellaneous R tools to simplify the work with several data types and formats.
#' 
#' The package vignette provides a comprehensive overview and examples for the usage
#' of all available functions in the package. Open with \code{vignette("miscset")}.
#' 
#' @name miscset-package
#' @docType package
#' @useDynLib miscset
#' @aliases miscset
#' @keywords misc miscellaneous tools
#' @author Sven E. Templer \email{sven.templer@@gmail.com}

NULL

.onAttach <- function(libname, pkgname) {
  if (interactive()) { packageStartupMessage(
    'Package miscset version ',
    as.character(packageVersion("miscset")),
    '\nFor help and features: vignette("miscset")')
  } }