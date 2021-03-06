% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/lload.R
\name{lload}
\alias{lload}
\title{Load RData Objects to a List}
\usage{
lload(path = ".", pattern = ".RData", recursive = FALSE,
  simplify = TRUE, verbose = TRUE)
}
\arguments{
\item{path}{Character string with the path, as used in \link{list.files}.}

\item{pattern}{A regular expression for file name patterns, as used in
\link{list.files}.}

\item{recursive}{Logical. Search the path recursive.}

\item{simplify}{Logical, unlist when there are only unique object names.}

\item{verbose}{Logical. Print information on screen about loading process.}
}
\value{
Returns a list of length n, when there are n data files loaded. All objects
are stored in sublists. Names are according to files, and names of sublists
to objects per file. If simplified, the list is of length m, when there are
m objects in total loaded.
}
\description{
Load multiple .RData files and return a (simplified) list.
}
\seealso{
\link{load}
}
\author{
Sven E. Templer
}
