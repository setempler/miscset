[![Travis-CI Build Status](https://travis-ci.org/setempler/miscset.png?branch=master)](https://travis-ci.org/setempler/miscset)

# miscset

A **[GNU R](http://r-project.org)** package with miscellaneous tools.

The package contains methods to simplify workspace handling, sort, reshape and apply functions on grids of data.frames, scale numeric values, extract unique and duplicate values, perform regular expression based string operations and ease plotting. Many methods are implemented with multi-core support from the parallel package or written in C++ interfaced with the Rcpp library.

### Installation

Install the package from the official [CRAN](http://cran.r-project.org/web/packages/miscset/index.html) repositories from within an R session:

```
install.packages("miscset")
```

For the most up-to-date version install the package `devtools` and use the function `install_github`:

```
install.packages("devtools")
library(devtools)
install_github("setempler/miscset")
```

### Usage

To use the package load it with:

```
library(miscset)
```

### Documentation

For documentation read the vignette/manual from the version at [CRAN](http://cran.r-project.org/web/packages/miscset/vignettes/miscset.pdf) or [github](https://raw.githubusercontent.com/setempler/miscset/master/vignettes/miscset.pdf). Also you can run the command `vignette("miscset")` within R.

### License

> Copyright (C) 2014 Sven E. Templer [sven.templer at gmail dot com]
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
