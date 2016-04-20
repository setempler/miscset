#!/usr/bin/env Rscript

# TODO:
# - check R version from DESCRIPTION to get tgz name

argc <- alist(
  html = 
    rmarkdown::render("vignettes/miscset.Rmd"),
  pdf =
    rmarkdown::render("vignettes/miscset.Rmd", "pdf_document"),
  doc = 
    devtools::document(),
  tgz = 
    devtools::build(manual = T),
  install = 
    devtools::install(".", build_vignettes = TRUE),
  install_tgz = 
    install.packages("../miscset_1.0.0.tar.gz", repos = NULL, type = "source"),
  install_github = 
    devtools::install_github("setempler/miscset", build_vignettes = TRUE),
  all = {
    rmarkdown::render("vignettes/miscset.Rmd"); 
    devtools::document();
    devtools::install(".", build_vignettes = TRUE)
    #devtools::build(manual = T)
  })

a <- commandArgs(TRUE)[1]

if (a %in% names(argc)) {
  eval(argc[[a]])
} else {
  warning(paste(c("use any of:", names(argc)), collapse = " "))
}

