# ngramrr
A fast ngram tokenizer for R so that we don't need to install RWeka just for NGramTokenizer().

## usage

```{r}
require(ngramrr)
require(tm)
nirvana <- c("hello hello hello how low", "hello hello hello how low", "hello hello hello how low", "hello hello hello", "with the lights out", "it's less dangerous", "here we are now", "entertain us", "i feel stupid", "and contagious", "here we are now", "entertain us", "a mulatto", "an albino", "a mosquito", "my libido", "yeah", "hey yay")

ngramrr(nirvana[1], ngmax = 3)
tdm <- TermDocumentMatrix(Corpus(VectorSource(nirvana)), control = list(tokenize = function(x) ngramrr(x, ngmin = 1, ngmax=2)))
inspect(tdm)
```
