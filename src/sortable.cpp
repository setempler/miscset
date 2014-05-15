#include <Rcpp.h>
using namespace Rcpp;

//' @name sortable
//' @keywords table sort
//' @author Sven E. Templer (\email{sven.templer@@gmail.com})
//' @title Return (Sorted) Table
//' @description
//' Same as \code{table(}) from R, but faster (Rcpp) sorted and with the option
//' to exclude \code{NA} counts.
//' @param x Vector to create table of counts
//' @param decr Decreased order if \code{TRUE}.
//' @param na Include \code{NA} if \code{TRUE}.
//' @return
//' Named integer Vector \code{n}.
//' @import Rcpp
//' @export sortable
// [[Rcpp::export]]
IntegerVector sortable(CharacterVector x, bool decr = true, bool na = true) {
  
  IntegerVector   tab = table(x);
  CharacterVector nam = tab.names();
  IntegerVector   ord = match(clone(tab).sort(), tab);
  LogicalVector   tna = is_na(tab);
  int n = tab.size();
  int i, ordi, tabi;
  IntegerVector   ret;
  CharacterVector ren;
  for (i = 0; i < n; i++) {
    decr ? ordi = (n - 1) - i : ordi = i;
    tabi = ord[ordi] - 1;
    if (!tna[tabi]) {
      ret.push_back(tab[tabi]);
      ren.push_back(nam[tabi]);
    } else if (na) {
      ret.push_back(tab[tabi]);
      ren.push_back(NA_STRING);
    }
  }
  ret.names() = ren;
  return ret;
  
}
