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

#' @importFrom parallel mclapply
#' @importFrom xtable xtable
#' @importFrom data.table as.data.table setkeyv
#' @importFrom gridExtra grid.arrange
#' @importFrom tools startDynamicHelp
#' @importFrom ggplot2 ggplot geom_point theme_bw theme element_rect scale_x_discrete
#' scale_y_discrete

.onAttach <- function(libname, pkgname) {
  if (interactive()) { packageStartupMessage(
    'miscset version ',
    as.character(packageVersion("miscset")),
    ' | help and features: vignette("miscset")')
  } }