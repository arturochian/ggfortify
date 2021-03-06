% Generated by roxygen2 (4.1.0): do not edit by hand
% Please edit documentation in R/fortify_changepoint.R
\name{fortify.cpt}
\alias{fortify.breakpoints}
\alias{fortify.breakpointsfull}
\alias{fortify.cpt}
\title{Convert \code{changepoint::cpt} and \code{strucchange::breakpoints} to data.frame.}
\usage{
\method{fortify}{cpt}(data, original = NULL, is.date = NULL)
}
\arguments{
\item{data}{\code{chantepoint::cpt} or \code{strucchange::breakpoints} instance}

\item{original}{Original time series attached to \code{strucchange::breakpoints}}

\item{is.date}{Logical frag indicates whether the \code{stats::ts} is date or not.
If not provided, regard the input as date when the frequency is 4 or 12.}
}
\value{
data.frame
}
\description{
Convert \code{changepoint::cpt} and \code{strucchange::breakpoints} to data.frame.
}
\examples{
library(changepoint)
ggplot2::fortify(cpt.mean(AirPassengers))
ggplot2::fortify(cpt.var(AirPassengers))
ggplot2::fortify(cpt.meanvar(AirPassengers))

library(strucchange)
bp.nile <- breakpoints(Nile ~ 1)
ggplot2::fortify(bp.nile)
ggplot2::fortify(breakpoints(bp.nile, breaks = 2))
ggplot2::fortify(breakpoints(bp.nile, breaks = 2), original = Nile)
}

