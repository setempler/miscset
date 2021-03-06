% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/leading0.R
\name{leading0}
\alias{leading0}
\title{Numeric to Character with Leading Zero(s)}
\usage{
leading0(num, digits = 2)
}
\arguments{
\item{num}{Numeric vector (character also possible) to transform.}

\item{digits}{Numeric value of minimum length of output strings.}
}
\value{
Character vector with same length of strings of each value. 
Original "string" is prepended by zero(s). 
String length is at least \code{max(nchar(as.character(num)))}.
}
\description{
Transform numeric values to character string prepending leading zero(s).
}
\examples{
#

# use with paste to generate strings of equal size:
paste0("observation", leading0(1:10, 3))

#
}
\author{
Sven E. Templer \email{sven.templer@gmail.com}
}
\keyword{zero}
