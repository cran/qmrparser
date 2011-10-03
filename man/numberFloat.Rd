%do not edit, edit noweb/qmrparser.nw
\name{numberFloat}
\alias{numberFloat}
\title{
  Floating-point number token.
}
\description{
  Recognises a floating-point number, i.e., an integer with a decimal part. One of them (either integer or decimal part) must be present.
}
\usage{
  numberFloat(action = function(s) list(type="numberFloat",value=s), 
              error  = function(p) list(type="numberFloat",pos  =p)) 

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
( numberFloat()(stream) )[c("status","node")]

# ok 
stream  <- streamParserFromString("-456.74")
( numberFloat()(stream) )[c("status","node")]

}

\keyword{token}
