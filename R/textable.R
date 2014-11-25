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
#' @param d Object to transform to a latex table.
#' @param file Character string with output file name. If missing or \code{""},
#' the output is printed to the screen.
#' @param as.document Logical. \code{TRUE} to add the document definition to
#' the output. The document class is an article and the package a4paper is
#' included.
#' @param landscape Logical, use a landscape format for wider tables.
#' @param caption Character vector with title of table.
#' @param rownames Logical, include row names of \code{d}.
#' @param align Character vector with \code{'l'}, \code{'c'}, \code{'r'}
#' for aligning the columns left, centered or right. Length is either one
#' or 1 (for rownames column) + number of columns in \code{d} (even if
#' \code{rownames = FALSE})
#' @param pt.size Integer from 10 to 13 for the size of the characters.
#' @param margin Margin between table and page border in cm.
#' @param digits Number of digits to print from numeric values.
#' @param label Character vector with the latex label or HTML anchor.
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

#' @rdname textable
#' @export textable
textable <- function (
  d, file, as.document = TRUE, landscape = FALSE,
  caption = NULL, rownames = TRUE, align = NULL, 
  pt.size = 10, margin = 2, digits = NULL, label = NULL,
  cmd = NULL)
{
  
	if (!is.null(align) && length(align) == 1)
		align <- rep(align, ncol(d)+1)
	tex <- capture.output(print(xtable(
    	d, digits=digits, align=align, label=label, caption=caption),
    	include.rownames = rownames))
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