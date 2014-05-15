#' @name leading0
#' @keywords zero
#' @author Sven E. Templer \email{sven.templer@@gmail.com}
#' @title Numeric to Character with Leading Zero(s)
#' @description
#' Transform numeric values to character string prepending leading zero(s).
#' @param num Numeric vector (character also possible) to transform.
#' @param digits Numeric value of minimum length of output strings.
#' @return Character vector with same length of strings of each value. 
#' Original "string" is prepended by zero(s). 
#' String length is at least \code{max(nchar(as.character(num)))}.
#' @examples
#' # use with paste to generate strings of equal lengths (nchar):
#' paste("observation", leading0(1:10, 3), sep="_")

#' @export leading0
leading0 <- function (num, digits = 2) {
  
  char <- as.character(num)
  charn <- nchar(char)
  charm <- max(charn)
  if (charm > digits) { digits <- charm }
  for (i in 1:digits) {
    sub <- char[nchar(char)==i]
    sub <- paste(paste(rep('0',digits-i),sep='',collapse=''),sub,sep='')
    char[nchar(char)==i] <- sub }
  return(char)

}
