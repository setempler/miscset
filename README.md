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

* status [![CRAN_Status_Badge][cran_badge]][cran_pkg] [![Downloads][cran_log]][rpkg_org]

```r
install.packages("miscset")
```

#### From github [latest release][github_latest]

* status [![Travis-CI Build Status][travis_latest_Rdevel]][travis] @ R-devel CRAN check

```r
install.packages("devtools")
devtools::install_github("setempler/miscset@*release")
```

#### From github [development release][github_develop]

* status [![Travis-CI Build Status][travis_develop_Rdevel]][travis] @ R-devel CRAN check

```r
install.packages("devtools")
devtools::install_github("setempler/miscset", build_vignettes = TRUE)
```

#### From github by manually selecting release/commit

```r
install.packages("devtools")
# define a version by git tag
devtools::install_github("setempler/miscset@1.0.1", build_vignettes = TRUE)
# define a commit by hash
devtools::install_github("setempler/miscset@e8fd67b", build_vignettes = TRUE)
```

## Documentation

For an introduction see the package vignette:

* online at [CRAN][cran_vignette]
* online at [github][github_vignette]
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
[travis_develop_Rrelease]: https://travis-ci.org/setempler/miscset.png?branch=master
[travis_develop_Rdevel]: https://travis-ci.org/setempler/miscset.png?branch=master
[travis_latest_Rrelease]: https://travis-ci.org/setempler/miscset.png?branch=master
[travis_latest_Rdevel]: https://travis-ci.org/setempler/miscset.png?branch=master
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
[github_develop]: https://github.com/setempler/miscset/
[github_latest]: https://github.com/setempler/miscset/releases/latest
