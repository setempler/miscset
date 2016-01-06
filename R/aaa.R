#' @name miscset-package
#' @docType package
#' @useDynLib miscset
#' @aliases miscset
#' @keywords misc miscellaneous tools
#' @author Sven E. Templer
#' @title Miscellaneous R Tools
#' @description 
#' The package contains methods to simplify workspace handling, sort,
#' reshape and apply functions on grids of data.frames, scale numeric values,
#' extract unique and duplicate values, perform regular expression based 
#' string operations and ease plotting. Many methods are implemented with 
#' multi-core support from the parallel package or written in C++.
#' @details 
#' The package vignette provides a comprehensive overview and examples for the
#' usage of all available functions in the package. View with 
#' \code{vignette("miscset")}.

NULL

#' @importFrom parallel mclapply
#' @importFrom xtable xtable print.xtable
#' @importFrom gridExtra grid.arrange
#' @importFrom tools startDynamicHelp
#' @importFrom ggplot2 ggplot geom_point theme_bw theme element_rect 
#' scale_x_discrete scale_y_discrete

.onAttach <- function(libname, pkgname) {
  if (interactive()) { packageStartupMessage(
    'miscset version ',
    as.character(packageVersion("miscset")),
    ' | help and features: vignette("miscset")')
  } }
