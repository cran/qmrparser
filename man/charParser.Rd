%do not edit, edit noweb/qmrparser.nw
\name{charParser}
\alias{charParser}
\title{
  Specific single character token.
}
\description{
  Recognises a specific single character.
}
\usage{
  
  charParser(char,
            action = function(s) list(type="char",value=s), 
            error  = function(p) list(type="char",pos  =p)) 

}
\arguments{
\item{char}{character to be recognised}
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
\seealso{
  \code{\link{keyword}}
}
\examples{

# fail
stream  <- streamParserFromString("H")
( charParser("a")(stream) )[c("status","node")]

# ok 
stream  <- streamParserFromString("a")
( charParser("a")(stream) )[c("status","node")]

# ok 
( charParser("\U00B6")(streamParserFromString("\U00B6")) )[c("status","node")]

}

\keyword{token}
