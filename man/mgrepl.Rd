\name{mgrepl}
\alias{mgrepl}
\alias{mgsub}
\alias{msub}
\title{Multiple Pattern Matching and Replacement}
\usage{
mgrepl(patterns, text, log.fun = any, cores = 1, ...)

msub(patterns, replacement, text, ...)

mgsub(patterns, replacement, text, ...)
}
\arguments{
  \item{patterns}{A character vector containing a regular
  expressions. (\link{regex}) to be searched in
  \code{text}.}

  \item{text}{Character vector where the search and replace
  is performed.}

  \item{replacement}{Character vector with the replacement
  pattern.}

  \item{log.fun}{For \code{mgrepl}. Logical function
  (\code{any} or \code{all}) to evaluate occurence of each
  pattern in \code{patterns} in each value of \code{text}.}

  \item{cores}{Numeric value for how many cores to use for
  computation using \code{mclapply}.}

  \item{\dots}{Further arguments passed to functions
  \code{grepl()}, \code{sub()} and \code{gsub()}.}
}
\value{
\code{msub} and \link{mgsub}: Same as \code{text} but with
all \code{patterns} replaced. \code{mgrepl}: Logical vector
of length \code{length(text)} where \code{TRUE} means
either any or all patterns in \code{patternlist} are
matched in \code{text} depending on \code{log.fun}.
}
\description{
\code{mgrepl} searches for any or all multiple amount of
patterns and return logical values. Combination of the
results is done via the logic functions any or all.
Multicore feature is made available by the imported
function \code{parallel:mclapply}. \code{sub} and
\link{gsub} replace a multiple number of patterns in a
vector.
}
\examples{
# Compare different "log.fun" parameters:
mgrepl(c("a","b"), c("ab","ac","bc"), any)
mgrepl(c("a","b"), c("ab","ac","bc"), all)

# Replace several patterns (gplobally):
msub(letters[1:3], "<replaced>", letters[1:5])
mgsub(letters[1:2], "<replaced>", c("ab","ba","acb",NA))
}
\author{
Sven E. Templer (\email{sven.templer@gmail.com})
}
\seealso{
\link{grep}, \link{mclapply}
}
\keyword{grep}
\keyword{gsub}
\keyword{multiple}
\keyword{sub}

