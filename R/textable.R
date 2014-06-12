#' Table to Latex
#' 
#' This function enhances \code{xtable} as it writes the latex code to a file
#' and adds a header/footer for the document structure to allow a direct
#' creation of a pdf with for example pdflatex.
#' 
#' @param d Object to transform to a latex table.
#' @param file Character string with output file name. If missing or \code{""},
#' the output is printed to the screen.
#' @param caption Character vector with title of table.
#' @param rownames Logical, include row names of \code{d}.
#' @param landscape Logical, use a landscape format for wider tables.
#' @param pt.size Integer from 10 to 13 for the size of the characters.
#' @param margin Margin between table and page border in cm.
#' @param digits Number of digits to print from numeric values.
#' @param align Character vector with \code{'l'}, \code{'c'}, \code{'r'}
#' for aligning the columns left, centered or right. Length is either one
#' or 1 (for rownames column) + number of columns in \code{d} (even if
#' \code{rownames = FALSE})
#' @param label Character vector with the latex label or HTML anchor.
#' @return
#' Creates a file at the path given in \code{file} containting the latex code
#' with the table and document structure for an A4 latex article.
#' @seealso
#' \link{xtable} 
#' @examples
#' #
#' 
#' textable(head(trees), rownames=T, digits=4, caption='"trees" dataset from R datasets.')
#' 
#' #
#' @name textable
#' @importFrom xtable xtable
#' @author Sven E. Templer (\email{sven.templer@@gmail.com})

#' @rdname textable
#' @export textable
textable <- function (d, file, caption = NULL, rownames = FALSE, landscape = FALSE,
                      pt.size = 10, margin = 2, digits = NULL, align = NULL,
                      label = NULL)
{
	if (!pt.size %in% 10:12)
		stop('pt.size must be 10, 11 or 12.')
	if (!is.null(align) && length(align) == 1)
		align <- rep(align, ncol(d)+1)
  x <- capture.output(print(xtable(
    d, digits=digits, align=align, label=label, caption=caption),
    include.rownames = rownames))
  orientation <- ''
  if (landscape)
    orientation <- 'landscape,'
	out <- paste0(
		'\\documentclass[a4paper,', pt.size,
		'pt]{article}\n\\usepackage[a4paper,',
		orientation,
		'margin=',
		margin,
		'cm]{geometry}\n\\begin{document}\n') #\\small\n
  out <- c(out, x, '\n\\end{document}\n')
  if (missing(file))
    file <- ""
  cat(out, file=file, sep='\n')
	invisible(NULL)
}