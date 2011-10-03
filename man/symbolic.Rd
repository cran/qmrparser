%do not edit, edit noweb/qmrparser.nw
\name{symbolic}
\alias{symbolic}
\title{
  Alphanumeric token.
}
\description{
  Recognises an alphanumeric symbol. By default, a sequence of alphanumeric, numeric and dash symbols, beginning with an alphabetical character.
}
\usage{
symbolic     (charFirst=isLetter,
              charRest=function(ch) isLetter(ch) || isDigit(ch) || ch == "-",
              action = function(s) list(type="symbolic",value=s), 
              error  = function(p) list(type="symbolic",pos  =p)) 

}
\arguments{
\item{charFirst}{Predicate of valid characters as first symbol character}
\item{charRest}{Predicate of valid characters as the rest of symbol characters}
  \item{action}{Function to be executed if recognition succeeds. Character stream making up the token is passed as parameter to this function}

  \item{error}{Function to be executed if recognition does not succeed. Position of \code{\link[qmrparser]{streamParser}} obtained with \code{\link{streamParserPosition}} is passed as parameter to this function}  
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
stream  <- streamParserFromString("123")
( symbolic()(stream) )[c("status","node")]

# ok 
stream  <- streamParserFromString("abc123_2")
( symbolic()(stream) )[c("status","node")]

}

\keyword{token}
