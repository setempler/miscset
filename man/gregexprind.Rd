\name{gregexprind}
\alias{gregexprind}
\title{Pattern Matching and Extraction}
\usage{
gregexprind(pattern, text, n, ...)
}
\arguments{
  \item{pattern}{Character string containing a regular
  expression to be searched in \code{text}.}

  \item{text}{Character vector where the search is
  performed.}

  \item{n}{Numeric value or character string \code{"last"}
  to extract \code{n}th or last position of \code{pattern}
  in each value of \code{text}.}

  \item{...}{Arguments passed to function
  \code{gregexpr()}.}
}
\value{
Numeric vector of length \code{length(text)}.
}
\description{
Function to extract a certain index from \code{gregexpr()}.
}
\details{
See \code{?gregexpr} for further information on arguments.
See \code{?"regular expression"} for the use of regular
expressions.
}
\examples{
gregexprind(c("a"),c("abab","ab","xyz",NA), 1)
gregexprind(c("a"),c("abab","ab","xyz",NA), 2)
gregexprind(c("a"),c("abab","ab","xyz",NA), "last")
}
\author{
Sven E. Templer (\email{sven.templer@gmail.com})
}
\seealso{
\link{gregexpr}, regular expression (\link{regex})
}
\keyword{expression}
\keyword{gregexpr}
\keyword{index}
\keyword{regular}

