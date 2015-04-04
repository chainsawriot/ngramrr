taungram <- function(text, n = 1, tolower = FALSE, split = "[[:space:]]+", ...) {
    r <- textcnt(text, method = 'string', n = n, tolower = tolower, split = split, ...)
    return(Reduce(c, sapply(1:length(r), function(x) rep(names(r[x]), r[x]))))
}

tauchar <- function(text, n = 1, tolower = FALSE, split = "[[:space:]]+", rmEOL = FALSE, ...) {
    r <- textcnt(text, method = 'ngram', n = n, tolower = tolower, split = split, ...)
    g <- unlist(sapply(1:length(r), function(x) rep(names(r[x]), r[x])))
    if (rmEOL) {
        g <- g[grep("_", g, invert = TRUE)]
    }
    return(g)
}
ngramrr <- function(x, char = FALSE, ngmin = 1, ngmax = 2, rmEOL = TRUE) {
    if (ngmin > ngmax) {
        stop("ngmax must be higher than ngmin")
    }
    y <- paste(x, collapse = " ")
    if (char) {
        return(tauchar(x, n = ngmax, rmEOL = rmEOL))
    }
    sentencelength <- length(unlist(strsplit(y, split = " ")))
    if (sentencelength > ngmax) {
        return(Reduce(c, Map(function(n) taungram(y, n), seq(from = ngmin, to = ngmax))))
    } else {
        return(Reduce(c, Map(function(n) taungram(y, n), seq(from = ngmin, to = sentencelength ))))
    }
}
