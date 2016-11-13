# miscset [![releases][github_svg]][github] [![CRAN][cran_svg]][cran] [![travis CI][travis_svg]][travis] [![license][license_svg]][license]

**A [GNU R][rproject] package for miscellaneous tools.**

A collection of miscellaneous methods to simplify various tasks,
including plotting, data.frame and matrix transformations, environment
functions, regular expression methods, and string and logical operations, as
well as numerical and statistical tools. Most of the methods are simple but
useful wrappers of common base R functions, which extend S3 generics or
provide default values for important parameters.
  
## Installation

From within R, run one of the following:

```r
# latest CRAN version
install.packages("miscset")
# latest released version
devtools::install_github("setempler/miscset@*release")
# latest development version
devtools::install_github("setempler/miscset")
# older release version
devtools::install_github("setempler/miscset@1.0.1")
```

## Documentation

For an introduction see the package vignette:

* online at [CRAN][cran_vignette]
* online at [github][github_vignette]
* local R session via `vignette("miscset")`

## License 

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

[cran]: http://cran.r-project.org/package=miscset
[cran_svg]: http://www.r-pkg.org/badges/version/miscset
[github]: https://github.com/setempler/miscset/releases/
[github_svg]: https://img.shields.io/github/release/setempler/miscset.svg
[license]: https://github.com/setempler/miscset/blob/master/LICENSE
[license_svg]: https://img.shields.io/github/license/setempler/miscset.svg
[travis]: https://travis-ci.org/setempler/miscset
[travis_svg]: https://travis-ci.org/setempler/miscset.svg?branch=master

[rproject]: http://r-project.org
[cran_vignette]: http://cran.r-project.org/web/packages/miscset/vignettes/miscset.html
[github_vignette]: http://htmlpreview.github.io/?https://github.com/setempler/miscset/blob/master/vignettes/miscset.html
