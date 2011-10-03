%do not edit, edit noweb/qmrparser.nw
\name{repetition0N}
\alias{repetition0N}
\title{
        Repeats one parser  
}
\description{

  Repeats a parser indefinitely, while it succeeds. It will return an empty token if the parser never succeeds, 

  Number of repetitions may be zero.
}
\usage{
  
  repetition0N(rpa0, 
               action = function(s)            list(type="repetition0N",value=s   ), 
               error  = function(p,h) list(type="repetition0N",pos=p,h=h)) 

}
\arguments{
\item{rpa0}{parse to be applied iteratively}   
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

  In case of at least one success, \code{action} gets the \code{node} returned by the parser \code{\link{repetition1N}} after applying the parser to be repeated. Otherwise, it gets the \code{node} corresponding to token \code{\link{empty}}: \code{list(type="empty" ,value="")}

  Function\code{error} is never called. It is defined as parameter for the sake of homogeneity with the rest of functions.
  
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
stream  <- streamParserFromString("Hello world")
( repetition0N(symbolic())(stream) )[c("status","node")]


# ok
stream  <- streamParserFromString("123 Hello world")
( repetition0N(symbolic())(stream) )[c("status","node")]

}

\keyword{parser combinator}
