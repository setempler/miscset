# miscset

[R](http://r-project.org) package `miscset`.

Miscellaneous functions to simplify R workspace and data handling. Scale numbers by a range, or use enhanced functions with regular expression and string operations. Latex tables, just empty plots or arrangements of ggplots can be exported. Reshaping of matrices or applying functions by grids on data.tables is supported. Functions for maintaining the workspace allow to list properties of objects, remove objects, or load objects from multiple RData files at once. For faster computation, some functions import multicore support from the parallel package. Also, C++ is used for performance included by the package Rcpp.

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


## Installation

Install the package from the official `CRAN` repositories from within an R session:

```
install.packages("miscset")
```

or use the command line tool:

```
R CMD INSTALL miscset
```

For the most up-to-date version install the package `devtools` and use the function `install_github`:

```
install.packages("devtools")
library(devtools)
install_github("setempler/miscset")
```

And to use the package load it with:

```
library(miscset)
```

For documentation use the `vignette` function within an R session:

```
vignette("miscset")
```

or from the web source at [CRAN](http://cran.r-project.org/web/packages/miscset/vignettes/miscset.pdf) or [github](https://github.com/setempler/miscset/blob/master/vignettes/miscset.pdf) for the respective version.
