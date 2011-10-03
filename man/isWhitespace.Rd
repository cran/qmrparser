%do not edit, edit noweb/qmrparser.nw
\name{isWhitespace}
\alias{isWhitespace}
\title{
Is it a white space?
}
\description{
Checks whether a character belongs to the set \{blank, tabulator, new line, carriage return, page break \}.
}
\usage{
isWhitespace(ch)
}
\arguments{
\item{ch}{character to be checked}
}
\value{
TRUE/FALSE, depending on character belonging to the specified set.
}
\examples{
isWhitespace(' ')
isWhitespace('\n')
isWhitespace('a')
}

\keyword{set of character}


