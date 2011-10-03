%do not edit, edit noweb/qmrparser.nw
\name{streamParserFromFileName}
\alias{streamParserFromFileName}
\title{
  Creates a streamParser from a file name
}
\description{
  Creates a list of functions which allow streamParser manipulation (when defined from a file name)
}
\usage{
streamParserFromFileName(fileName,encoding = getOption("encoding")) 
}
\arguments{
\item{fileName}{file name}
\item{encoding}{file encoding}
}
\details{
  
    See \link[qmrparser]{streamParser}

    This function implementation uses function \link{seek}.
    
    Documentation about this function states: 
      
      "
      Use of 'seek' on Windows is discouraged.  We have found so many
      errors in the Windows implementation of file positioning that
      users are advised to use it only at their own risk, and asked not
      to waste the R developers' time with bug reports on Windows'
      deficiencies.
    "
    
    If "fileName" is a url, \link{seek} is not possible.
    
    In order to cover these situations, streamPaserFromFileName functions are converted in:
      
      \code{
        \link{streamParserFromString}(\link{readLines}( fileName, encoding=encoding))      
      }
    
    Alternatively, it can be used:
    
    \code{\link{streamParserFromString}} with:
      \code{
        \link{streamParserFromString}(\link{readLines}(fileName))
      }
    
     or
    
     \code{
       \link{streamParserFromString}(
                              \link{iconv}(\link{readLines}(fileName), encodingOrigen,encodingDestino)                          
                          )
     }

   Since streamParserFromFileName also uses \code{\link{readChar}}, this last option is the one advised in Linux if encoding is different from Latin-1 or UTF-8. As documentation states, \code{\link{readChar}} may generate problems if file is in a multi-byte non UTF-8 encoding:
       
   "
          'nchars' will be interpreted in bytes not characters in a
     non-UTF-8 multi-byte locale, with a warning.
   "     
}
\value{
  A list of four functions which allow stream manipulation:

\item{streamParserNextChar}{Function which takes a streamParser as argument and returns a \code{list(status,char,stream)}}

\item{streamParserNextCharSeq}{Function which takes a streamParser as argument and returns \code{list(status,char,stream)}}

\item{streamParserPosition}{Function which takes a streamParser as argument and returns position of next character to be read}

\item{streamParserClose}{Closes the stream}
}

\examples{
  name    <- system.file("extdata","datInTest01.txt", package = "qmrparser")
  
  stream  <- streamParserFromFileName(name)
  
  cstream <- streamParserNextChar(stream)
  
  while( cstream$status == "ok" ) {
    print(streamParserPosition(cstream$stream))
    print(cstream$char)
    cstream <- streamParserNextCharSeq(cstream$stream)
  }
  
  streamParserClose(stream)
  
}

\keyword{streamParser}
