%do not edit, edit noweb/qmrparser.nw
\name{isDigit}
\alias{isDigit}
\title{
Is it a digit?
}
\description{
Checks whether a character is a digit: \{ 0 .. 9 \}.
}
\usage{
isDigit(ch)
}
\arguments{
\item{ch}{character to be checked}
}
\value{
TRUE/FALSE, depending on the character being a digit.
}
\examples{
isDigit('9')
isDigit('a')
}

\keyword{set of character}
