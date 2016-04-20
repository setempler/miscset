# miscset [![Travis-CI Build Status](https://travis-ci.org/setempler/miscset.png?branch=master)](https://travis-ci.org/setempler/miscset) [![CRAN_Status_Badge](http://www.r-pkg.org/badges/version/miscset)](http://cran.r-project.org/package=miscset) [![Downloads](http://cranlogs.r-pkg.org/badges/miscset?color=brightgreen)](http://www.r-pkg.org/pkg/miscset) [![License](http://img.shields.io/badge/license-GPL%20%28%3E=%203%29-brightgreen.svg?style=flat)](http://www.gnu.org/licenses/gpl-3.0.html)

A **[GNU R](http://r-project.org)** package.

### About

A collection of miscellaneous methods to simplify various tasks,
including plotting, data.frame and matrix transformations, environment
functions, regular expression methods, and string and logical operations, as
well as numerical and statistical tools. Most of the methods are simple but
useful wrappers of common base R functions, which extend S3 generics or
provide default values for important parameters.
  
### Installation

From CRAN:

```r
install.packages("miscset")
```

From github (latest stable version):

```r
install.packages("devtools")
devtools::install_github("setempler/miscset", build_vignettes = TRUE)
```

From github (development version):

```r
install.packages("devtools")
devtools::install_github("setempler/miscset@develop", build_vignettes = TRUE)
```
### Documentation

For an introduction see the package vignette.

```r
vignette("miscset")
```

Also on
[CRAN](http://cran.r-project.org/web/packages/miscset/vignettes/miscset.html) or
[github](http://htmlpreview.github.io/?https://github.com/setempler/miscset/blob/master/vignettes/miscset.html).

### License 

> Copyright (C) 2016 Sven E. Templer [sven.templer at gmail dot com]
> 
> This program is free software: you can redistribute it and/or modify
> it under the terms of the GNU General Public License as published by
> the Free Software Foundation, either version 3 of the License, or
> (at your option) any later version.
>
> This program is distributed in the hope that it will be useful,
> but WITHOUT ANY WARRANTY; without even the implied warranty of
> MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the 
> GNU General Public License for more details.
>
> You should have received a copy of the GNU General Public License
> along with this program. If not, see <http://www.gnu.org/licenses/>.
