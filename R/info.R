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
  libs <- paste0(libs, " (", sapply(libs, function (x) length(list.files(x))), ")")
  names(libs) <- rep("library", length(libs))
  rbin <- suppressMessages(system('which R', intern = TRUE))
  names(rbin) <- "binary"
  repo <- getOption("repos")
  repo <- paste0(repo, " (", names(repo), ")")
  names(repo) <- rep("repository", length(repo))
  
  sys <- c(rbin, repo, libs)
  si <- session_info(...)
  si$platform <- c(sys, si$platform)
  class(si$platform) <- "platform_info"
  
  cat("\n")
  print(si)
  cat("\n")
  
  options(width = oldwidth)
  
}
