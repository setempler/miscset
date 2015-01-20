#' Table to Latex
#' 
#' This function enhances \code{xtable}: It can write the latex code of the
#' table directly to a file and optionally adds a header/footer for the
#' document structure. Also a system command can be given to convert the
#' tex file to a pdf document, for example.
#' 
#' @details
#' Example for a system call:\cr
#' \code{cmd = "pdflatex -output-directory /path/to/files/"}
#' 
#' @param d Object (will be coerced to data.frame) to transform to a latex table.
#' @param file Character string with output file name. If missing or \code{""},
#' the output is printed to the screen.
#' @param caption Character vector with title of table.
#' @param label Character vector with the latex label or HTML anchor.
#' @param align Character vector with \code{'l'}, \code{'c'}, \code{'r'}
#' for aligning the columns left, centered or right. Length is either one
#' or 1 (for rownames column) + number of columns in \code{d} (even if
#' \code{rownames = FALSE})
#' @param rownames Logical, include row names of \code{d}.
#' @param topcapt Logical, put caption and label before 'tabular'.
#' @param digits Number of digits to print from numeric values.
#' @param as.document Logical. \code{TRUE} to add the document definition to
#' the output. The document class is an article and the package a4paper is
#' included.
#' @param landscape Logical, use a landscape format for wider tables.
#' Only with \code{as.document=TRUE}.
#' @param pt.size Integer from 10 to 13 for the size of the characters.
#' Only with \code{as.document=TRUE}.
#' @param margin Margin between table and page border in cm.
#' Only with \code{as.document=TRUE}.
#' @param cmd A character vector with the system command to apply
#' on the output file. Only if \code{file} is given and \code{as.document}
#' is \code{TRUE}. \code{NULL} or an empty string does not call \link{system}.
#' @return
#' Returns a character vector invisible. If \code{file} is set, then the
#' content is written to a file. Else it is printed to the console.
#' @seealso
#' \link{xtable} 
#' @examples
#' #
#' 
#' textable(head(trees), rownames=TRUE, digits=4, caption='R "trees" dataset.')
#' 
#' #
#' @name textable
#' @author Sven E. Templer (\email{sven.templer@@gmail.com})

NULL

precapt <- function (x) {
  icapt <- which(grepl("\\caption", x, fixed = T))
  ocapt <- if (length(icapt)) {
    icapt - 1 + which(grepl("}", x[icapt:length(x)],fixed = T))[1]
  } else {
    integer()
  }
  ilab <- which(grepl("\\label", x, fixed = T))
  olab <- if (length(ilab)){
    ilab -1 + which(grepl("}", x[ilab:length(x)],fixed = T))[1] 
  } else {
    integer()
  }
  io <- c(if (length(icapt)) icapt:ocapt, if (length(ilab)) ilab:olab)
  itab <- which(grepl("begin.tabular", x))
  if (!length(itab))
    stop("begin of tabular not found")
  io <- c(1:(itab-1), io, setdiff(itab:length(x), io))
  x <- x[io]
  return(x)
}

#' @rdname textable
#' @export textable
textable <- function (
  d, file, caption = NULL, label = NULL, align = NULL, rownames = FALSE, topcapt = TRUE,
  digits = NULL, as.document = FALSE, landscape = FALSE, margin = 2, pt.size = 10, cmd = NULL)
{
  
	if (!is.null(align) && length(align) == 1)
		align <- rep(align, ncol(d)+1)
	tex <- capture.output(print(xtable(
    	d, digits=digits, align=align, label=label, caption=caption),
    	include.rownames = rownames))
  if (topcapt) {
    tex <- precapt(tex)
  }
  if (as.document) {
    if (!pt.size %in% 10:12)
      stop('pt.size must be 10, 11 or 12.')
    orientation <- ''
    if (landscape)
      orientation <- 'landscape,'
    tex.head <- paste0(
      '\\documentclass[a4paper,', pt.size,
      'pt]{article}\n\\usepackage[a4paper,',
      orientation,
      'margin=',
      margin,
      'cm]{geometry}\n\\begin{document}\n') #\\small\n
    tex <- c(tex.head, tex, '\n\\end{document}\n')
  }
	if (missing(file))
		file <- ""
	cat(tex, file=file, sep='\n')
  if (as.document && !missing(file) && nchar(file)>0 && !is.null(cmd) && nchar(cmd)>0)
    system(paste(cmd, file), wait = FALSE)
	invisible(tex)
}