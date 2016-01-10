#' @name miscset-package
#' @docType package
#' @useDynLib miscset
#' @aliases miscset
#' @keywords misc miscellaneous tools
#' @author Sven E. Templer
#' @title Miscellaneous R Tools
#' @description 
#' Miscellaneous methods that simplify tasks from multiple areas. 
#' This comprises plotting, data.frame and matrix transformations, environment functions, 
#' regular expression methods, string and logical operations and numerical 
#' and statistical tools. Most of the methods are simple but useful wrappers 
#' of common base R functions by extending S3 generics or setting default parameters.
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
