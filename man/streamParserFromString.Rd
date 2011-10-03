%do not edit, edit noweb/qmrparser.nw
\name{streamParserFromString}
\alias{streamParserFromString}
\title{
  Creates a streamParser from a string
}
\description{
  Creates a list of functions which allow streamParser manipulation (when defined from a character string)
}
\usage{
streamParserFromString(string) 
}
\arguments{
\item{string}{string to be recognised}
}
\details{
  
    See \link[qmrparser]{streamParser}
  }

\value{
  
  A list of four functions which allow stream manipulation:
  
\item{streamParserNextChar}{Functions which takes a streamParser as argument ant returns a \code{list(status,char,stream)}}

\item{streamParserNextCharSeq}{Function which takes a streamParser as argument and returns a \code{list(status,char,stream)}}

\item{streamParserPosition}{Function which takes a streamParser as argument and returns position of next character to be read}

\item{streamParserClose}{Function which closes the stream}
}

\examples{
# reads one character
streamParserNextChar(streamParserFromString("\U00B6"))

# reads a string
stream  <- streamParserFromString("Hello world")

cstream <- streamParserNextChar(stream)

while( cstream$status == "ok" ) {
    print(streamParserPosition(cstream$stream))
    print(cstream$char)
    cstream <- streamParserNextCharSeq(cstream$stream)

streamParserClose(stream)
}

}

\keyword{streamParser}
