%do not edit, edit noweb/qmrparser.nw
\name{empty}
\alias{empty}
\title{
Empty token
}
\description{
  Recognises a null token. This parser always succeeds.
}
\usage{
  
  empty(action = function(s) list(type="empty",value=s), 
        error  = function(p) list(type="empty",pos  =p)) 

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
\details{
  \code{action} \code{s} parameter is always "".
  Error parameters exists for the sake of homogeneity with the rest of functions. It is not used.
}  
\examples{

# ok
stream  <- streamParserFromString("Hello world")
( empty()(stream) )[c("status","node")]

# ok 
stream  <- streamParserFromString("")
( empty()(stream) )[c("status","node")]

}

\keyword{token}
