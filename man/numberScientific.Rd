%do not edit, edit noweb/qmrparser.nw
\name{numberScientific}
\alias{numberScientific}
\title{
  Number in scientific notation token.
}
\description{
  Recognises a number in scientific notation, i.e., a floating-point number with an (optional) exponential part.
}
\usage{
  numberScientific(action = function(s) list(type="numberScientific",value=s), 
                   error  = function(p) list(type="numberScientific",pos=p)  ) 

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
( numberScientific()(stream) )[c("status","node")]

# ok 
stream  <- streamParserFromString("-1234e12")
( numberScientific()(stream) )[c("status","node")]

}

\keyword{token}
