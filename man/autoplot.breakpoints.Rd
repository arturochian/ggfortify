% Generated by roxygen2 (4.1.0): do not edit by hand
% Please edit documentation in R/fortify_changepoint.R
\name{autoplot.breakpoints}
\alias{autoplot.breakpoints}
\alias{autoplot.breakpointsfull}
\title{Autoplot \code{strucchange::breakpoints}.}
\usage{
\method{autoplot}{breakpoints}(data, original = NULL,
  cpt.colour = "#FF0000", cpt.linetype = "dashed", ...)
}
\arguments{
\item{data}{\code{strucchange::breakpoints} or \code{strucchange::breakpointsfull} instance.}

\item{original}{Original time series. Mandatory for plotting \code{strucchange::breakpoints} instance.}

\item{cpt.colour}{Line colour for changepoints}

\item{cpt.linetype}{Line type for changepoints}

\item{...}{Keywords passed to autoplot.ts}
}
\value{
ggplot
}
\description{
Autoplot \code{strucchange::breakpoints}.
}
\examples{
library(strucchange)
bp.nile <- breakpoints(Nile ~ 1)
ggplot2::autoplot(bp.nile)
ggplot2::autoplot(bp.nile, is.date = TRUE)
ggplot2::autoplot(breakpoints(bp.nile, breaks = 2), original = Nile)
}

