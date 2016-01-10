# build vignette R markdown > html

library(devtools)
library(rmarkdown)
render('vignettes/miscset.Rmd')

# build documentation with roxygen

document()

