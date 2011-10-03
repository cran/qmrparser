%do not edit, edit noweb/qmrparser.nw
\name{isUppercase}
\alias{isUppercase}
\title{
Is it an upper case?
}
\description{
Checks whether a character is an upper case.
  
Restricted to ASCII character (does not process ñ, ç, accented vowels...)
}
\usage{
isUppercase(ch)
}
\arguments{
\item{ch}{character to be checked}
}
\value{
TRUE/FALSE, depending on character being an upper case character.
}
\examples{
isUppercase('A')
isUppercase('a')
isUppercase('9')
}

\keyword{set of character}
