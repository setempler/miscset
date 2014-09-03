#' Arrange a List of ggplots
#' 
#' Arrange a list of ggplots with \link[gridExtra]{grid.arrange} and
#' output on local graphic device or as pdf/png when a path is supplied.
#' 
#' @param x A list containing at least one ggplot object of class \code{gg}.
#' @param path Optional. A character string that gives the path to export
#' the plot to a file, ending with 'pdf' or 'png' (case insensitive). If
#' missing, then the grid is returned to the current graphic device.
#' @param ncol Number of columns in the grid.
#' @param height,width A numeric value in inches for the size of the output
#' file in case \code{path} is provided. Else ignored.
#' @examples
#' #
#' 
#' \dontrun{
#' library(ggplot2)
#' x <- list(
#'   ggplot(data.frame(a=1:5,b=1:5), aes(x=a,y=b,col=b)) + geom_line(),
#'   ggplot(data.frame(a=1:5,b=1:5), aes(x=a,y=b,shape=factor(b))) + geom_point())
#' ggplotlist(x, 2)}
#' 
#' #
#' @name ggplotlist
#' @author Sven E. Templer \email{sven.templer@@gmail.com}


#' @export ggplotlist
ggplotlist <- function (x, ncol = 1, path, width = 11, height = 8) {
  
  # check the classes
  keep <- sapply(x, function(i) inherits(i, "gg"))
  x <- x[keep]
  if (!any(keep))
    stop("Provide list with at least one ggplot.")
  else if (!all(keep))
    warning("Non-ggplot objects found and dropped.")
  
  # return
  if (!missing(path)) {
    type <- tolower(substr(path, nchar(path)-2, nchar(path)))
    if (type == 'pdf')
      pdf(path, width = width, height = height)
    else if (type == 'png')
      png(path, width = width, height = height, units = 'in', res = 300)
    else
      stop(paste0(type, ' is an invalid ending (use: pdf, png).'))
  }
  do.call(grid.arrange, c(x, ncol=ncol))
  if (!missing(path)) dev.off()
  invisible(NULL)
  
}
