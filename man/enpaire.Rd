\name{enpaire}
\alias{enpaire}
\alias{enpaire.dist}
\alias{enpaire.matrix}
\title{Create a Pairwise List from a Matrix}
\usage{
enpaire(x, ...)

\method{enpaire}{dist}(x, upper = T, lower = T, ...)

\method{enpaire}{matrix}(x, upper = T, lower = T, ...)
}
\arguments{
  \item{x}{Object of class \code{matrix}.}

  \item{upper}{Logical, return values from upper triangle.}

  \item{lower}{Logical, return values from lower triangle.}

  \item{...}{Arguments passed to methods.}
}
\value{
Returns a \code{data.frame} with column 1 and 2 as
row/column pair name, column 3 and 4 with upper and lower
matrix values for each pair.
}
\description{
Transform a matrix or dist object to a pairwise list.
}
\examples{
#
m <- matrix(letters[1:9], 3, 3, dimnames = list(1:3,1:3))
enpaire(m)
}
\author{
Sven E. Templer (\email{sven.templer@gmail.com})
}
\seealso{
\link{squarematrix}
}
\keyword{matrix}
\keyword{pairwise}

