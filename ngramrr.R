require(ngram)
ngramrrx <- function(x, ngmin = 1, ngmax = 2) {
    if (ngmin >= ngmax) {
        stop("ngmin must be larger than ngmax")
    }
    y <- paste(x, " ")
    return(Reduce(c, Map(function(n) get.ngrams(ngram(y,n)), ngmin:ngmax )))
}
text <- c("A B C", "B C B C D", "A C D")
trigramx <- function(x) ngramrrx(x, 1,3)
tdm <- TermDocumentMatrix(Corpus(VectorSource(text)), control = list(tokenize = trigramx))
## wrong the frequency is incorrect because ngram will not return frequency, shit
MC_tokenizer(text)

require(tau)
taungram <- function(text, n = 1, tolower = FALSE,...) {
    r <- textcnt(text, method = 'string', n = n, tolower = tolower, ...)
    g <- (Reduce(c, sapply(1:length(r), function(x) rep(names(r[x]), r[x]))))
    gsub(" ", "/", g)
}

ngramrr <- function(x, ngmin = 1, ngmax = 2) {
    if (ngmin >= ngmax) {
        stop("ngmin must be larger than ngmax")
    }
    y <- paste(x, " ")
    return(Reduce(c, Map(function(n) taungram(x, n), ngmin:ngmax )))
}
ngramrrstupid <- function(x, ngmin = 1, ngmax = 2) {
    if (ngmin >= ngmax) {
        stop("ngmin must be larger than ngmax")
    }
    y <- paste(x, " ")
    return(paste(Reduce(c, Map(function(n) taungram(x, n), ngmin:ngmax )), collapse = " "))
}
require(tm)
text <- c("on9 無極限", "好 撚 on9 呀 你 on9 仔", "on9 仔 你 去 仆街 喇") # should not remove number
trigram <- function(x) ngramrr(x, 1 , 3)
#MC_tokenizer(c("A B C", "B C B C D", "A C D"))

tdm <- TermDocumentMatrix(Corpus(VectorSource(iconv(text, to='utf-8'))), control = list(tokenize = trigram)) # don't know why it didn't work

trigram <- function(x) ngramrrstupid(x, 1 , 3)
stupid <- sapply(text, ngramrrstupid)

stupid.tdm <- TermDocumentMatrix(Corpus(VectorSource(stupid)), control = list(wordLengths=c(1, Inf)))
