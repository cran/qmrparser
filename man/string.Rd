%do not edit, edit noweb/qmrparser.nw
\name{string}
\alias{string}
\title{
Token string
}
\description{
 Any character sequence, by default using simple or double quotation marks.
}
\usage{
string(isQuote= function(c) switch(c,'"'=,"'"=TRUE,FALSE),
       action = function(s) list(type="string",value=s), 
       error  = function(p) list(type="string",pos  =p)) 

}
\arguments{
\item{isQuote}{Predicate indicating whether a character begins and ends a string}
  \item{action}{Function to be executed if recognition succeeds. Character stream making up the token is passed as parameter to this function}

  \item{error}{Function to be executed if recognition does not succeed. Position of \code{\link[qmrparser]{streamParser}} obtained with \code{\link{streamParserPosition}} is passed as parameter to this function}  
}
\details{
  Characters preceded by \ are not considered as part of string end.
}  
\value{
  Anonymous function, returning a list.

        \code{function(stream)} -->  \code{ list(status,node,stream) }

  From input parameters, an anonymous function is defined. This function admits just one parameter, stream, with type \code{\link[qmrparser]{streamParser}}, and returns a three-field list:
    \itemize{
      \item{status}{      
        
        "ok" or "fail"} 

      \item{node}{         
        
        With \code{action} or \code{error} function output, depending on the case}

      \item{stream}{      
        
        With information about the input, after success or failure in recognition}
      
    }
  
}
\examples{

# fail
stream  <- streamParserFromString("Hello world")
( string()(stream) )[c("status","node")]

# ok 
stream  <- streamParserFromString("'Hello world'")
( string()(stream) )[c("status","node")]

}

\keyword{token}
