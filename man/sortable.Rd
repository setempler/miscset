\name{sortable}
\alias{sortable}
\title{Return (Sorted) Table}
\usage{
sortable(x, decr = TRUE, na = TRUE)
}
\arguments{
  \item{x}{Vector to create table of counts}

  \item{decr}{Decreased order if \code{TRUE}.}

  \item{na}{Include \code{NA} if \code{TRUE}.}
}
\value{
Named integer Vector \code{n}.
}
\description{
Same as \code{table(}) from R, but faster (Rcpp) sorted and
with the option to exclude \code{NA} counts.
}
\author{
Sven E. Templer (\email{sven.templer@gmail.com})
}
\keyword{sort}
\keyword{table}

