require(tau)
require(tm)

taungram <- function(text, n = 1, tolower = FALSE, split = "[[:space:]]+", ...) {
    r <- textcnt(text, method = 'string', n = n, tolower = tolower, split = split, ...)
    #return(r)
    g <- (Reduce(c, sapply(1:length(r), function(x) rep(names(r[x]), r[x]))))
    #gsub(" ", "/", g)
}

ngramrr <- function(x, ngmin = 1, ngmax = 2) {
    if (ngmin >= ngmax) {
        stop("ngmin must be larger than ngmax")
    }
    y <- paste(x, " ")
    return(Reduce(c, Map(function(n) taungram(y, n), ngmin:ngmax )))
}
