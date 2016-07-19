# miscset 

A **[GNU R][rproject]** package for miscellaneous tools.

## About

A collection of miscellaneous methods to simplify various tasks,
including plotting, data.frame and matrix transformations, environment
functions, regular expression methods, and string and logical operations, as
well as numerical and statistical tools. Most of the methods are simple but
useful wrappers of common base R functions, which extend S3 generics or
provide default values for important parameters.
  
## Installation

#### From [CRAN][cran]

[![CRAN_Status_Badge][cran_badge]][cran_pkg] [![Downloads][cran_log]][rpkg_org]

```r
install.packages("miscset")
```

#### From github - [latest][github_master] version

[![Travis-CI Build Status][travis_master]][travis]

```r
install.packages("devtools")
devtools::install_github("setempler/miscset", build_vignettes = TRUE)
```

#### From github - other releases

```r
install.packages("devtools")
# define a version by git tag
devtools::install_github("setempler/miscset@1.0.0", build_vignettes = TRUE)
devtools::install_github("setempler/miscset@1.0.1", build_vignettes = TRUE)
# define a commit by hash
devtools::install_github("setempler/miscset@e8fd67b", build_vignettes = TRUE)
```

## Documentation

For an introduction see the package vignette:

* online at [CRAN][cran_vignette]
* online at [github@master][github_vignette]
* online at [github@develop][github_vignette_dev]
* local R session via `vignette("miscset")`

## License 

[![License][gpl_badge]][gpl3]

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

[rproject]: http://r-project.org
[travis_master]: https://travis-ci.org/setempler/miscset.png?branch=master
[travis_develop]: https://travis-ci.org/setempler/miscset.png?branch=develop
[travis]: https://travis-ci.org/setempler/miscset
[cran_badge]: http://www.r-pkg.org/badges/version/miscset
[cran_pkg]: http://cran.r-project.org/package=miscset
[cran]: https://cran.r-project.org
[cran_log]: http://cranlogs.r-pkg.org/badges/miscset?color=brightgreen
[rpkg_org]: http://www.r-pkg.org/pkg/miscset
[gpl_badge]: http://img.shields.io/badge/license-GPL%20%28%3E=%203%29-brightgreen.svg?style=flat
[gpl3]: http://www.gnu.org/licenses/gpl-3.0.html
[cran_vignette]: http://cran.r-project.org/web/packages/miscset/vignettes/miscset.html
[github_vignette]: http://htmlpreview.github.io/?https://github.com/setempler/miscset/blob/master/vignettes/miscset.html
[github_vignette_dev]: http://htmlpreview.github.io/?https://github.com/setempler/miscset/blob/develop/vignettes/miscset.html
[github_dev]: https://github.com/setempler/miscset/tree/develop
[github_master]: https://github.com/setempler/miscset/
