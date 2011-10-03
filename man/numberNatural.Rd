%do not edit, edit noweb/qmrparser.nw
\name{numberNatural}
\alias{numberNatural}
\title{
  Natural number token.
}
\description{
  A natural number is a sequence of digits.
}
\usage{
  numberNatural(action = function(s) list(type="numberNatural",value=s), 
                error  = function(p) list(type="numberNatural",pos  =p))
}
\arguments{
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
stream  <- streamParserFromString("Hello world")
( numberNatural()(stream) )[c("status","node")]

# ok 
stream  <- streamParserFromString("123")
( numberNatural()(stream) )[c("status","node")]

}

\keyword{token}
