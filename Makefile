# Makefile

VIGNETTES     = miscset.Rmd
PACKAGE      := $(shell grep '^Package:' DESCRIPTION | sed -E 's/^Package:[[:space:]]+//')
R_BIN         = $(shell which R)
R             = ${R_BIN} -q --no-save
SED_R         = sed -e '/^>/d' -e 's.^.\ \ \ \ .'
R_BUILD_DEP   = Rcpp devtools knitr rmarkdown roxygen2
R_MIRROR      = https://cloud.r-project.org
COL_GREEN     = \033[0;32m
COL_CYAN      = \033[0;36m
COL_0         = \033[0m

define RCODE_INSTALL
pkgs <- commandArgs(T)
inst <- rownames(installed.packages())
new  <- pkgs[!pkgs %in% inst]
if (length(new)) { install.packages(new, repos = "$(R_MIRROR)") }
endef

export RCODE_INSTALL

### main targets

.PHONY : hello               # say hello (and list make targets)
hello:
	@echo "$(COL_GREEN)*** hello! make targets are:$(COL_0)"
	@cat Makefile | \
		grep -E '^\.PHONY|^###' | \
		sed 's/^\.PHONY\ *\:\ */-\ /'

.PHONY : info                # print info
info: r-info
	@echo "$(COL_GREEN)*** done$(COL_0)"

.PHONY : clean               # clean compiled files
clean: clean-all
	@echo "$(COL_GREEN)*** done$(COL_0)"

.PHONY : dependencies        # install dependencies
dependencies: r-info r-inst r-check
	@echo "$(COL_GREEN)*** done$(COL_0)"

.PHONY : install             # install the package
install: r-info r-check clean-all pkg-doc pkg-install
	@echo "$(COL_GREEN)*** done$(COL_0)"

.PHONY : document            # generate package documentation
document: r-info r-check clean-all pkg-doc
	@echo "$(COL_GREEN)*** done$(COL_0)"

.PHONY : check               # run checks on package (after clean install)
check: r-info r-check clean-all pkg-doc pkg-install pkg-check
	@echo "$(COL_GREEN)*** done$(COL_0)"

.PHONY : uninstall           # uninstall package
uninstall: r-info r-check pkg-uninstall
	@echo "$(COL_GREEN)*** done$(COL_0)"

### helper targets

.PHONY : clean-all           # clean all (rd, src, vignettes)
clean-all: clean-rd clean-src clean-vignettes

.PHONY : clean-rd            # clean man/ directory (rd)
clean-rd:
	@echo "$(COL_GREEN)*** cleaning man/$(COL_0)"
	rm -f man/*.Rd

.PHONY : clean-src           # clean src/ directory
clean-src:
	@echo "$(COL_GREEN)*** cleaning src/$(COL_0)"
	rm -f src/*.{o,so}

.PHONY : clean-vignettes     # clean vignettes/ directory
clean-vignettes:
	@echo "$(COL_GREEN)*** cleaning vignettes/$(COL_0)"
	find vignettes/ -type f `printf "! -name %s " $(VIGNETTES)` -delete

.PHONY : r-info              # show R session information
r-info:
	@echo "$(COL_GREEN)*** printing R session information$(COL_0)"
	@echo '* binary'
	@echo '    ${R_BIN}'
	@echo '* library directories'
	@${R} -e 'cat(.libPaths(), sep = "\\n")' | ${SED_R}
	@echo '* build dependencies'
	@printf '    %s\n' ${R_BUILD_DEP}

.PHONY : r-check             # R build session requirement checks
r-check:
	@echo "$(COL_GREEN)*** checking R dependencies$(COL_0)"
	@echo '* package requirements'
	@for pkg in $(R_BUILD_DEP); do ${R} -e "stopifnot(require($$pkg))"; done 2>&1 | ${SED_R}

.PHONY : r-inst              # install R packages for build
r-inst:
	@echo "$(COL_GREEN)*** installing R dependencies$(COL_0)"
	@echo "$$RCODE_INSTALL" | R -q --no-save --args $(R_BUILD_DEP) | $(SED_R)

.PHONY : pkg-check           # run package check
pkg-check:
	@echo "$(COL_GREEN)*** running package check$(COL_0)"
	@${R} -e 'devtools::check()' | ${SED_R}
	@echo '* duplicated functions'
	@sed -e 's/^[\ \t]*//' -e 's/#.*//' R/* | awk '/[-=][\ \t]+function/{print $1}' | sort | uniq -d

.PHONY : pkg-install         # install package
pkg-install:
	@echo "$(COL_GREEN)*** installing package$(COL_0)"
	@${R} -e 'devtools::install(build_vignettes = TRUE)' | ${SED_R}

.PHONY : pkg-uninstall
pkg-uninstall:
	@echo "$(COL_GREEN)*** uninstalling package$(COL_0)"
	@${R} -e 'if ("miscset" %in% rownames(installed.packages())) {remove.packages("miscset")}' | ${SED_R}

.PHONY : pkg-tarball
pkg-tarball:
	@echo "$(COL_GREEN)*** package tarball$(COL_0)"
	@${R} -e 'devtools::build(manual = TRUE)' | ${SED_R}

.PHONY : pkg-doc
pkg-doc: pkg-rd pkg-vignette-html pkg-vignette-pdf

.PHONY : pkg-rd
pkg-rd:
	@echo "$(COL_GREEN)*** creating package documentation (Rd)$(COL_0)"
	@${R} -e 'devtools::document()' | ${SED_R}

.PHONY : pkg-vignette-html
pkg-vignette-html:
	@echo "$(COL_GREEN)*** creating package vignette (html)$(COL_0)"
	@for vign in $(VIGNETTES); do \
		${R} -e "rmarkdown::render('vignettes/$$vign', rmarkdown::html_document())" | ${SED_R}; done

.PHONY : pkg-vignette-pdf
pkg-vignette-pdf:
	@echo "$(COL_GREEN)*** creating package vignette (pdf)$(COL_0)"
	@for vign in $(VIGNETTES); do \
		${R} -e "rmarkdown::render('vignettes/$$vign', rmarkdown::pdf_document())" | ${SED_R}; done

#README.md: README.Rmd
#	${R} -e "library(methods); knitr::knit('$<')"
#	sed -i.bak 's/[[:space:]]*$$//' README.md
#	rm -f $@.bak

