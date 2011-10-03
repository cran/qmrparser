%do not edit, edit noweb/qmrparser.nw
\name{isLetter}
\alias{isLetter}
\title{
Is it a letter?
}
\description{
Checks whether a character is a letter

Restricted to ASCII character (does not process ñ, ç, accented vowels...)
}
\usage{
isLetter(ch)
}
\arguments{
\item{ch}{character to be checked}
}
\value{
TRUE/FALSE, depending on the character being a letter.
}
\examples{
isLetter('A')
isLetter('a')
isLetter('9')
}

\keyword{set of character}
