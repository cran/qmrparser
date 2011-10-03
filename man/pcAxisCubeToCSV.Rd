%do not edit, edit noweb/qmrparser.nw
\name{pcAxisCubeToCSV}
\alias{pcAxisCubeToCSV}
\title{
  Exports a PC-AXIS cube into CSV in several files.
}
\description{
  It generates four csv files, plus four more depending on "keyword" parameters in PC-AXIS file.
}
\usage{
pcAxisCubeToCSV(prefix,pcAxisCube) 
}
\arguments{
\item{prefix}{prefix for files to be created}
\item{pcAxisCube}{PC-AXIS cube}
}
\details{
  Created files names are:
\itemize{
\item{prefix+"pxCube.csv"}{} 
\item{prefix+"pxCubeVariable.csv"}{} 
\item{prefix+"pxCubeVariableDomain.csv"}{} 
\item{prefix+"pxCubeData.csv"}{} 
\item{prefix+"pxCube"+name+".csv"}{ With name = A0,A1,A2 ...} 
}
}
\value{
NULL
}
\examples{

  name     <- system.file("extdata","datInSFexample6_1.px", package = "qmrparser")
  stream   <- streamParserFromFileName(name,encoding="UTF-8")
  cstream  <-  pcAxisParser(stream)
  if ( cstream$status == 'ok' ) {
    cube <- pcAxisCubeMake(cstream)
    
    pcAxisCubeToCSV(prefix="datInSFexample6_1",pcAxisCube=cube)     

  }
}
\keyword{PC-AXIS}
