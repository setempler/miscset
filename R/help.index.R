#' Open The Package Help Index Page in a Browser
#' 
#' Given a package name or string, start the package help index page
#' in a browser.
#' 
#' @param pkg A character string or variable name of a package.
#' @param browser A character string for a browser command to
#' replace the option 'browser' with. Use the string "rstudio"
#' for calling the internal browser in RStudio.
#' @param encodeIfNeeded Logical value. \code{TRUE} to encode
#' the url. Mostly not necessary. Read More at \link{browseURL}.
#' @param verbose Logical value. \code{TRUE} to print a message with the
#' package name and url.
#' @name help.index
#' @keywords help index browser
#' @author Sven E. Templer (\email{sven.templer@@gmail.com})

#' @export help.index
help.index <- function (pkg, browser = NA, encodeIfNeeded = FALSE, verbose = TRUE) {
  
  pkg <- as.character(substitute(pkg))
  hport <- tools:::httpdPort

  if (!pkg %in% rownames(installed.packages()))
    stop(paste("Package", pkg, "not found."))
  
  if (hport == 0) {
    cat("Starting dynamic help.\n")
    t <- try(tools::startDynamicHelp(), silent = TRUE)
    if (class(t) == "try-error")
      stop("Could not start dynamic help.")
    hport <- tools:::httpdPort
  }

  if (!is.na(browser)) {
    if (tolower(browser) == "rstudio")
        options(browser = function (x) .Call("rs_browseURL", url))
      else
        options(browser = browser)
  }
  
  url <- paste0("http://127.0.0.1:", hport, "/library/", pkg, "/html/00Index.html")
  if (verbose)
    cat("Opening help for", pkg, "with browser", getOption("browser"),
      "\nat the url", url, "\n")
  browseURL(url, encodeIfNeeded = encodeIfNeeded)
  invisible(NULL)
  
}
