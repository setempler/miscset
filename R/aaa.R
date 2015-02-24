#' Miscellaneous R Tools
#' 
#' Miscellaneous functions to simplify R workspace and data handling. This includes numeric value scaling, string manipulation by regular expressions, plotting 'ggplot' arrays or empty plots, reshaping matrices and applying functions by a grid on data.frames. Furthermore it contains functions to maintain workspaces by enhanced object listing or removing and multiple RData file loading. For performance, multi-core support and C++ functions are implemented.
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
#' @importFrom xtable xtable print.xtable
#' @importFrom data.table as.data.table setkeyv
#' @importFrom gridExtra grid.arrange
#' @importFrom tools startDynamicHelp
#' @importFrom ggplot2 ggplot geom_point theme_bw theme element_rect 
#' scale_x_discrete scale_y_discrete

.onAttach <- function(libname, pkgname) {
  if (interactive()) { packageStartupMessage( # interactive()
    'miscset version ',
    as.character(packageVersion("miscset")),
    ' | help and features: vignette("miscset")')
  } }
