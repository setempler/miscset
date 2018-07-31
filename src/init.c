#include <R.h>
#include <Rinternals.h>
#include <stdlib.h> // for NULL
#include <R_ext/Rdynload.h>

/*
 * This file's purpose is to
 * fix R-devel 2017-02-22 r72246 NOTE
 * Found no calls to: 'R_registerRoutines', 'R_useDynamicSymbols'
 * see https://github.com/RcppCore/Rcpp/issues/636
 * generated by R-devel
 * tools::package_native_routine_registration_skeleton(".")
 */

/* FIXME:
  Check these declarations against the C/Fortran source code.
*/
  
/* .Call calls */
extern SEXP _miscset_ntri(SEXP);

static const R_CallMethodDef CallEntries[] = {
  {"_miscset_ntri", (DL_FUNC) &_miscset_ntri, 1},
  {NULL, NULL, 0}
};

void R_init_miscset(DllInfo *dll)
{
  R_registerRoutines(dll, NULL, CallEntries, NULL, NULL);
  R_useDynamicSymbols(dll, FALSE);
}
