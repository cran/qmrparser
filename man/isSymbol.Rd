%do not edit, edit noweb/qmrparser.nw
\name{isSymbol}
\alias{isSymbol}
\title{
Is it a symbol?
}
\description{
Checks whether a character is a symbol, a special character.
}
\usage{
isSymbol(ch)
}
\arguments{
\item{ch}{character to be checked}
}
\details{
These characters are considered as symbols:  

'!' , '\%' , '&' , '$' , '#' , '+' , '-' , '/' , ':' , '<' , '=' , '>' , '?' , '@' , '\\' , '~' , '^' , '|' , '*'

}
\value{
TRUE/FALSE, depending on character being a symbol.
}
\examples{
isSymbol('+')
isSymbol('A')
isSymbol('a')
isSymbol('9')
}

\keyword{set of character}
