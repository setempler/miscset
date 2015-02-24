# miscset

[R](http://r-project.org) package `miscset`.

[![Travis-CI Build Status](https://travis-ci.org/setempler/miscset.png?branch=master)](https://travis-ci.org/setempler/miscset)

Miscellaneous functions to simplify R workspace and data handling. This includes numeric value scaling, string manipulation by regular expressions, plotting 'ggplot' arrays or empty plots, reshaping matrices and applying functions by a grid on data.frames. Furthermore it contains functions to maintain workspaces by enhanced object listing or removing and multiple RData file loading. For performance, multi-core support and C++ functions are implemented.

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

## License

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
