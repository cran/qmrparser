%do not edit, edit noweb/qmrparser.nw
\name{isHex}
\alias{isHex}
\title{
Is it an hexadecimal digit?
}
\description{
Checks whether a character is an hexadecimal digit.
}
\usage{
isHex(ch)
}
\arguments{
\item{ch}{character to be checked}
}
\value{
TRUE/FALSE, depending on character being an hexadecimal digit.
}
\examples{
isHex('+')
isHex('A')
isHex('a')
isHex('9')
}

\keyword{set of character}
