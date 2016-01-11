# build vignette R markdown > html

library(devtools)
library(rmarkdown)
render('vignettes/miscset.Rmd')

# build documentation with roxygen

document()
build(manual = T)


# check

install.packages("../miscset_1.0.tar.gz", repos = NULL)
#devtools::install_github("setempler/miscset")
vignette("miscset")
