#' @name info
#' @keywords session
#' @author Sven E. Templer
#' @title Print enhanced session information
#' @description 
#' Based on and enhancing \code{devtools::session_info}.
#' @param ... Forwarded to other methods.
#' @param width Console width in columns.
#' @seealso 
#' \link[devtools]{session_info}
#' @examples
#' info()
#' devtools::session_info()
#' sessionInfo()
#' @export info
info <- function(..., width = 120) {
  
  oldwidth <- getOption("width")
  options(width = width)
  
  libs <- unique(normalizePath(.libPaths(), winslash = "/"))
  nums <- sapply(libs, function (x) length(list.files(x)))
  rbin <- suppressMessages(system('which R', intern = TRUE))
  dsys <- data.frame(setup = c("R binary"), value = rbin)
  dlib <- data.frame(library = libs, packages = nums, stringsAsFactors = FALSE)

  cat("\n")
  print(session_info(...))
  cat("\n")
  devtools:::rule("Directories")
  print(dsys, right = FALSE, row.names = FALSE)
  print(dlib, right = FALSE, row.names = FALSE)
  cat("\n")
  options(width = oldwidth)
  
}
