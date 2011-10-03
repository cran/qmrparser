%do not edit, edit noweb/qmrparser.nw
\name{alternation}
\alias{alternation}
\title{
Alternative phrases
}
\description{
  Applies parsers until one succeeds or all of them fail.
}
\usage{
  
  alternation(..., 
              action = function(s)   list(type="alternation",value=s), 
              error  = function(p,h) list(type="alternation",pos  =p,h=h) ) 
  
}
\arguments{
  \item{...}{list of alternative parsers to be executed}
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
  
  In case of success, \code{action} gets the \code{node} from the first parse to succeed.
  
  In case of failure, parameter \code{h} from \code{error} gets a list, with information about failure from all the parsers processed.
  
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
( alternation(numberNatural(),symbolic())(stream) )[c("status","node")]


# fail
stream  <- streamParserFromString("123 Hello world")
( alternation(string(),symbolic())(stream) )[c("status","node")]


}
\keyword{parser combinator}
