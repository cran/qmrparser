%do not edit, edit noweb/qmrparser.nw
\name{isLowercase}
\alias{isLowercase}
\title{
Is it a lower case?
}
\description{
Checks whether a character is a lower case.
  
Restricted to ASCII character (does not process ñ, ç, accented vowels...)
}
\usage{
isLowercase(ch)
}
\arguments{
\item{ch}{character to be checked}
}
\value{
TRUE/FALSE, depending on character being a lower case character.
}
\examples{
isLowercase('A')
isLowercase('a')
isLowercase('9')
}

\keyword{set of character}
