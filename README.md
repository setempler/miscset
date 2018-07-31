# miscset [![CRAN][cran_svg]][cran]
**A [GNU R][rproject] package for miscellaneous tools.**

A collection of miscellaneous methods to simplify various tasks,
including plotting, data.frame and matrix transformations, environment
functions, regular expression methods, and string and logical operations, as
well as numerical and statistical tools.

Most of the methods are simple but
useful wrappers of common base R functions, which extend S3 generics or
provide default values for important parameters.

## Documentation

* [![CRAN Documentation][cran_vignette_svg]][cran_vignette]
* local R session via `vignette("miscset")` or `miscset::help.index(miscset)`

## Installation

Install the latest version from **CRAN** via:

```r
install.packages('miscset')
```

Install the development version from **github** via:

```r
install.packages('devtools')
devtools::install_github('setempler/miscset@develop', build_vignettes = TRUE)
```

## Development

* [![Github Source][github_src_svg]][github_src]
* [![Github Releases][github_rel_latest_svg]][github_rel]
* [![Travis CI][travis_svg2]][travis]

Follow and contribute to development on github via:

* [source code](https://github.com/setempler/miscset)
* [issues](https://github.com/setempler/miscset/issues)

## License

* [![license][license_svg]][license]
* see file `LICENSE`

[cran]: https://cran.r-project.org/package=miscset
[cran_svg]: http://www.r-pkg.org/badges/version/miscset
[cran_vignette]: https://CRAN.R-project.org/package=miscset/vignettes/miscset.html
[cran_vignette_svg]: https://img.shields.io/badge/CRAN-Documentation-green.svg
[github_src]: https://github.com/setempler/miscset/
[github_src_svg]: https://img.shields.io/badge/source-releases-green.svg
[github_rel]: https://github.com/setempler/miscset/releases/
[github_rel_svg]: https://img.shields.io/badge/source-releases-green.svg
[github_rel_latest_svg]: https://img.shields.io/github/release/setempler/miscset.svg
[github_vignette]: http://htmlpreview.github.io/?https://github.com/setempler/miscset/blob/master/vignettes/miscset.html
[license]: https://github.com/setempler/miscset/blob/master/LICENSE
[license_svg]: https://img.shields.io/github/license/setempler/miscset.svg
[travis]: https://travis-ci.org/setempler/miscset
[travis_svg2]: https://travis-ci.org/setempler/miscset.svg?branch=develop

[rproject]: http://r-project.org
