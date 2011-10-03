%do not edit, edit noweb/qmrparser.nw
\name{option}
\alias{option}
\title{
          Optional parser
}
\description{
  Applies a parser to the text. If it does not succeed, an empty token is returned.

    Optional parser never fails.
}
\usage{
  
  option(ap, 
         action = function(s  ) list(type="option",value=s    ), 
         error  = function(p,h) list(type="option",pos  =p,h=h)) 
  
}
\arguments{
\item{ap}{Optional parser}
\item{action}{Function to be executed if recognition succeeds. It takes as input parameters information derived from parsers involved as parameters}

\item{error}{Function to be executed if recognition does not succeed. I takes two parameters:
             \itemize{
               \item  \code{p} 
               
               with position where parser, \code{\link[qmrparser]{streamParser}},  starts its recognition, obtained with \code{\link{streamParserPosition}}
               
               \item \code{h}
               
               with information obtained from parsers involved as parameters, normally related with failure(s) position in component parsers.
               
               Its information depends on how parser involved as parameters are combined and on the \code{error} definition in these parsers.
             }
           }

}
\details{

  In case of success, \code{action} gets the \code{node} returned by parser passed as optional. Otherwise, it gets the \code{node} corresponding to token \code{\link{empty}}: \code{list(type="empty" ,value="")}
  
  Function \code{error} is never called. It is defined as parameter for the sake of homogeneity with the rest of functions. 

}
\value{
Anonymous functions, returning a list.


      \code{function(stream)} -->  \code{ list(status,node,stream) }

From these input parameters, an anonymous function is constructed. This function admits just one parameter, stream, with \code{\link[qmrparser]{streamParser}} class, and returns a three-field list:
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

# ok
stream  <- streamParserFromString("123 Hello world")
( option(numberNatural())(stream) )[c("status","node")]


# ok
stream  <- streamParserFromString("123 Hello world")
( option(string())(stream) )[c("status","node")]

}
\keyword{parser combinator}
