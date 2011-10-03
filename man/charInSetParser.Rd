%do not edit, edit noweb/qmrparser.nw
\name{charInSetParser}
\alias{charInSetParser}
\title{
  Single character, belonging to a given set, token
}
\description{
  Recognises a single character satisfying a predicate function.
}
\usage{
  
  charInSetParser(fun,
                 action = function(s) list(type="charInSet",value=s), 
                 error  = function(p) list(type="charInSet",pos  =p)) 

}
\arguments{
\item{fun}{Function to determine if character belongs to a set.
           Argument "fun" is a signature function: character -> logical (boolean)}
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
stream  <- streamParserFromString("H")
( charInSetParser(isDigit)(stream) )[c("status","node")]

# ok 
stream  <- streamParserFromString("a")
( charInSetParser(isLetter)(stream) )[c("status","node")]


}

\keyword{token}
