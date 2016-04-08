# build vignette R markdown > html

# restart session before!
rmarkdown::render('vignettes/miscset.Rmd')
#rmarkdown::render('vignettes/miscset.Rmd', "pdf_document")

# build documentation with roxygen

devtools::document()
devtools::build(manual = T)

# check

devtools::install(build_vignettes = TRUE)
install.packages("../miscset_1.0.0.tar.gz", repos = NULL, type = "source")
install.packages("../miscset_1.0.1.tar.gz", repos = NULL, type = "source")
#devtools::install_github("setempler/miscset", build_vignettes = TRUE)

#devtools::release()
vignette("miscset")
