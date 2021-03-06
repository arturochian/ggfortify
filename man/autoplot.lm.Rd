% Generated by roxygen2 (4.1.0): do not edit by hand
% Please edit documentation in R/fortify_stats_lm.R
\name{autoplot.lm}
\alias{autoplot.lm}
\title{Autoplot \code{stats::lm}.}
\usage{
\method{autoplot}{lm}(data, which = c(1:3, 5), fill = "#444444",
  colour = "#444444", label.colour = "#000000", label.size = 4,
  label.n = 3, smooth.colour = "#0000FF", smooth.linetype = "solid",
  ad.colour = "#888888", ad.linetype = "dashed", ad.size = 0.2,
  nrow = NULL, ncol = NULL)
}
\arguments{
\item{data}{\code{stats::lm} instance}

\item{which}{If a subset of the plots is required, specify a subset of the numbers 1:6.}

\item{fill}{Point fill colour}

\item{colour}{Point line colour}

\item{label.colour}{Text colour for point labels}

\item{label.size}{Text size for point labels}

\item{label.n}{Number of points to be laeled in each plot, starting with the most extreme}

\item{smooth.colour}{Line colour for smoother lines}

\item{smooth.linetype}{Line type for smoother lines}

\item{ad.colour}{Line colour for additional lines}

\item{ad.linetype}{Line type for additional lines}

\item{ad.size}{Fill colour for additional lines}

\item{nrow}{Number of facet/subplot rows}

\item{ncol}{Number of facet/subplot columns}
}
\value{
ggplot
}
\description{
Autoplot \code{stats::lm}.
}
\examples{
ggplot2::autoplot(lm(Petal.Width ~ Petal.Length, data= iris))
ggplot2::autoplot(glm(Petal.Width ~ Petal.Length, data= iris), which = 1:6)
}

