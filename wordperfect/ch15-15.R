# ----------- Chapter 14: Word Perfect -----------
 
 library(XML)
 library(tm)
 
 #read the speech - the actual file location will need to be updated
 sbaFile <- 'https://raw.githubusercontent.com/cpaniaguam/dsa201f21/main/wordperfect/sba.txt'

 #use scan
 sba <- scan(sbaFile, character(0),sep = "\n")
 sba <- scan(sbaFile, character(0))
 head(sba, 3)
 
 #use readLines
 sba <- readLines(sbaFile)
 head(sba, 3)
 
 #Use a web file: Note the web location for the speech
 sbaLocation <- URLencode("http://www.historyplace.com/speeches/anthony.htm")
 
 # Read and parse HTML file
 doc.html = htmlTreeParse(sbaLocation, useInternal = TRUE)
 
 # Extract all the paragraphs (HTML tag is p, starting at
 # the root of the document). Unlist flattens the list to
 # create a character vector.
 sba = unlist(xpathApply(doc.html, '//p', xmlValue))
 head(sba, 3)
 
 words.vec <- VectorSource(sba)
 words.corpus <- Corpus(words.vec)
 words.corpus
 words.corpus <- tm_map(words.corpus, content_transformer(tolower))
 words.corpus <- tm_map(words.corpus, removePunctuation)
 words.corpus <- tm_map(words.corpus, removeNumbers)
 words.corpus <- tm_map(words.corpus, removeWords, stopwords("english"))
 tdm <- TermDocumentMatrix(words.corpus)
 tdm
 
 m <- as.matrix(tdm)
 wordCounts <- rowSums(m)
 wordCounts <- sort(wordCounts, decreasing=TRUE)
 head(wordCounts)
 
 library(wordcloud)
 cloudFrame <- data.frame(word = names(wordCounts), freq=wordCounts)
 
 wordcloud(cloudFrame$word, cloudFrame$freq)
 
 wordcloud(names(wordCounts), wordCounts, min.freq=2, max.words=50, rot.per=0.35, 
           colors=brewer.pal(8, "Dark2"))
 
 
# ------------------ Chapter 15: Happy Words? ------------------
 pos <- "https://raw.githubusercontent.com/cpaniaguam/dsa201f21/main/wordperfect/positive-words.txt"
 neg <- "https://raw.githubusercontent.com/cpaniaguam/dsa201f21/main/wordperfect/negative-words.txt"
 p <- scan(pos, character(0),sep = "\n")
 n <- scan(neg, character(0),sep = "\n")
 head(p, 10)
 p <- p[-1:-34]
 n <- n[-1:-34]
 head(p, 10)
 head(n,10)
 
 totalWords <- sum(wordCounts)
 words <- names(wordCounts)
 matched <- match(words, p, nomatch = 0) 
 head(matched,10)
 matched[9]
 p[1083]
 words[9]
 
 mCounts <- wordCounts[which(matched != 0)]
 length(mCounts)
 mWords <- names(mCounts)
 nPos <- sum(mCounts)
 nPos
 
 matched <- match(words, n, nomatch = 0)
 nCounts <- wordCounts[which(matched != 0)]
 nNeg <- sum(nCounts)
 nWords <- names(nCounts)
 nNeg
 length(nCounts)
 
 totalWords <- length(words)
 ratioPos <- nPos/totalWords
 ratioPos
 ratioNeg <- nNeg/totalWords
 ratioNeg
