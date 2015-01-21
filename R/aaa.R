#' Miscellaneous R Tools
#' 
#' The package provides miscellaneous functions to simplify R workspace and
#' data life. For example, one can scale numbers by a range, or use enhanced 
#' functions with regular expression and string operations. Latex tables, just
#' empty plots or arrangements of ggplots can be exported. Reshaping of 
#' matrices or applying functions by grids on data.tables is supported. In 
#' addition, workspace objects can be listed or removed more user friendly and 
#' multiple RData objects can be loaded into a list at once. For faster 
#' computation, some functions import multicore support from the parallel 
#' package. Also C++ is used for performance included by the package Rcpp.
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

#' @importFrom parallel mclapply
#' @importFrom xtable xtable
#' @importFrom data.table as.data.table setkeyv
#' @importFrom gridExtra grid.arrange
#' @importFrom tools startDynamicHelp
#' @importFrom ggplot2 ggplot geom_point theme_bw theme element_rect scale_x_discrete
#' scale_y_discrete

.onAttach <- function(libname, pkgname) {
  if (interactive()) { packageStartupMessage( # interactive()
    'miscset version ',
    as.character(packageVersion("miscset")),
    ' | help and features: vignette("miscset")')
  } }