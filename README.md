# ngramrr
A fast ngram tokenizer for R so that we don't need to install RWeka just for NGramTokenizer().

## usage

```{r}
require(ngramrr)
require(tm)
require(magrittr)

nirvana <- c("hello hello hello how low", "hello hello hello how low",
"hello hello hello how low", "hello hello hello",
"with the lights out", "it's less dangerous", "here we are now", "entertain us",
"i feel stupid", "and contagious", "here we are now", "entertain us",
"a mulatto", "an albino", "a mosquito", "my libido", "yeah", "hey yay")

ngramrr(nirvana[1], ngmax = 3)

Corpus(VectorSource(nirvana)) %>%
TermDocumentMatrix(control = list(tokenize = function(x) ngramrr(x, ngmax =3))) %>%
inspect

# Character ngram

Corpus(VectorSource(nirvana)) %>%
TermDocumentMatrix(control = list(tokenize = function(x) ngramrr(x, char = TRUE, ngmax =3))) %>%
inspect

# dtm2 and tdm2 wrappers

dtm2(nirvana, ngmax = 3, removePunctuation = TRUE)
```

