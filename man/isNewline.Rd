%do not edit, edit noweb/qmrparser.nw
\name{isNewline}
\alias{isNewline}
\title{
Is it a new line character?
}
\description{
Checks whether a character is a new line character.
}
\usage{
isNewline(ch)
}
\arguments{
\item{ch}{character to be checked}
}
\value{
TRUE/FALSE, depending on character being a newline character
}
\examples{
isNewline(' ')
isNewline('\n')
}

\keyword{set of character}
