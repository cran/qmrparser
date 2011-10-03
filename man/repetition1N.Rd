%do not edit, edit noweb/qmrparser.nw
\name{repetition1N}
\alias{repetition1N}
\title{
        Repeats a parser, at least once.
}
\description{
  Repeats a parser application indefinitely while it is successful. It must succeed at least once.

}
\usage{
  
  repetition1N(rpa, 
               action = function(s)   list(type="repetition1N",value=s  ),
               error  = function(p,h) list(type="repetition1N",pos=p,h=h))

}
\arguments{
\item{rpa}{ parse to be applied iteratively }
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
  In case of success, \code{action} gets a list with information about the \code{node} returned by the applied parser. List length equals the number of successful repetitions.
  
  In case of failure, parameter \code{h} from \code{error} gets error information returned by the first attempt of parser application.
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
( repetition1N(symbolic())(stream) )[c("status","node")]


# fail
stream  <- streamParserFromString("123 Hello world")
( repetition1N(symbolic())(stream) )[c("status","node")]

}

\keyword{parser combinator}
