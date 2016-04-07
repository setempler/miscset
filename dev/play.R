
library(miscset)
set.seed(12)
s <- s2 <- sample(LETTERS[1:4], 9, replace = TRUE)
s2[1:2] <- rev(s2[1:2])
d <- data.frame(group = rep(letters[c(3,1,2)], each = 3), 
                value = s,
                level = factor(s2),
                stringsAsFactors = FALSE)

collapse(d,'.',1)
collapse(d, NULL, 1)
collapse(d, NULL, 2)
collapse(d, NULL, 2,.sortby = T)

dt <- as.data.table(d)
dt[,lapply(.SD, miscset::collapse),by="group"]

dt[,lapply(.SD, miscset::collapse, sep=NULL),by="group"]
dt[,as.list(lapply(.SD, miscset::collapse, sep=NULL)),by="group"]


d <- structure(list(c(1,3,1), list(1:4, 2:5, 1)), row.names = as.character(1:3), names = letters[1:2], class = "data.frame")
d <- as.data.table(d)
str(d)
setkey(d,a)

add1 <- function (x) {x+1}
d[,lapply(.SD, lapply, add1), by="a"]

cby <- function(x) {list(as.numeric(unlist(x)))}
d[,lapply(.SD, cby), by="a"]


