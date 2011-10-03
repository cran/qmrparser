%do not edit, edit noweb/qmrparser.nw
\name{streamParser}
\alias{streamParserNextChar}
\alias{streamParserNextChar}
\alias{streamParserNextCharSeq}
\alias{streamParserPosition}
\alias{streamParserClose}
\title{
  Generic interface for character processing, allowing forward and backwards translation.
}
\description{
  Generic interface for character processing. It allows going forward sequentially or backwards to a previous arbitrary position.

  Each one of these functions performs an operation on or obtains information from a character sequence (stream).
}
\usage{
streamParserNextChar(stream)
streamParserNextCharSeq(stream)
streamParserPosition(stream)
streamParserClose(stream)
}
\arguments{
\item{stream}{object containing information about the text to be processed and, specifically, about the next character to be read}
}

\details{
  \itemize{  
    \item{streamParserNextChar}{
      
      Reads next character, checking if position to be read is correct.
    } 

    \item{streamParserNextCharSeq}{
      
      Reads next character, without checking if position to be read is correct. Implemented since it is faster than streamParserNextChar}
      
    \item{streamParserPosition}{
      
      Returns information about text position being read.}

    \item{streamParserClose}{
      
      Closes the stream}  
  }
}

\value{
\item{streamParserNextChar and streamParserNextCharSeq}{
    Three field list:
    \itemize{
    \item{status}{      
      
      "ok" or "eof"}
    \item{char}{
      
      Character read (ok) or "" (eof)}
    \item{stream}{      
      
      With information about next character to be read or same position if end of file has been reached ("eof")}
    }
}

\item{streamParserPosition}{
  Three field list:
    \itemize{
      \item{fileName}{   
        File name or "" if the stream is not associated with a file name}
      \item{line}{      
       
        line number}
      \item{linePos}{   
        
        character to be read position within its line}

      \item{streamPos}{
      
        character to be read position from the text beginning}
    }
}

\item{streamParserClose}{NULL}
}
\seealso{
  \code{\link{streamParserFromFileName}}
  \code{\link{streamParserFromString}}
}

\examples{

stream<- streamParserFromString("Hello world")

cstream <- streamParserNextChar(stream)

while( cstream$status == "ok" ) {
    print(streamParserPosition(cstream$stream))
    print(cstream$char)
    cstream <- streamParserNextCharSeq(cstream$stream)
}

streamParserClose(stream)

}

\keyword{streamParser}
