.PHONY : info doc install tarball html pdf clean all

PACKAGE := $(shell grep '^Package:' DESCRIPTION | sed -E 's/^Package:[[:space:]]+//')
R = R -q
VIGNETTE = vignettes/${PACKAGE}.Rmd

info:
	@echo "package: ${PACKAGE}"
	@echo "vignette: ${VIGNETTE}"
	@echo "available make targets:\n"
	@awk '/^doc:$$/,0' Makefile | grep -v '^#' | sed '/^$$/d'

doc:
	@${R} -e 'devtools::document()'

install:
	@${R} -e 'devtools::install(build_vignettes = TRUE)'

tarball:
	@${R} -e 'devtools::build(manual = TRUE)'

html:
	@${R} -e 'rmarkdown::render("${VIGNETTE}", rmarkdown::html_document())'

pdf:
	@${R} -e 'rmarkdown::render("${VIGNETTE}", rmarkdown::pdf_document())'

clean:
	find vignettes/ -type f ! -name "${PACKAGE}.html" ! -name "${PACKAGE}.Rmd" -delete

#README.md: README.Rmd
#	${R} -e "library(methods); knitr::knit('$<')"
#	sed -i.bak 's/[[:space:]]*$$//' README.md
#	rm -f $@.bak

all: doc html install clean
	
