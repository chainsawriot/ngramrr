require(ngram)
ngramrr <- function(x, ngmin = 1, ngmax = 2) {
    if (ngmin >= ngmax) {
        stop("ngmin must be larger than ngmax")
    }
    y <- paste(x, " ")
    return(Reduce(c, Map(function(n) get.ngrams(ngram(y,n)), ngmin:ngmax )))
}
text <- c("A B C", "B C B C D", "A C D")
trigram <- function(x) ngramrr(x, 1,3)
tdm <- TermDocumentMatrix(Corpus(VectorSource(text)), control = list(tokenize = trigram))
## wrong the frequency is incorrect because ngram will not return frequency, shit
MC_tokenizer(text)
