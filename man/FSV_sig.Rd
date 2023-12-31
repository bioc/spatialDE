% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plots.R
\name{FSV_sig}
\alias{FSV_sig}
\title{Plot Fraction Spatial Variance vs Q-value}
\usage{
FSV_sig(
  results,
  ms_results = NULL,
  certain_only = FALSE,
  log_x = FALSE,
  do_label = TRUE,
  covariate_names = NULL
)
}
\arguments{
\item{results}{results from SpatialDE.}

\item{ms_results}{model selection results, should be a data frame with
columns \code{g} for gene names and \code{model} for the model selected.}

\item{certain_only}{only plot results with narrow 95\% confidence interval.}

\item{log_x}{Whether to display x axis in log scale.}

\item{do_label}{display gene names for statistically significant genes,
default \code{TRUE}.}

\item{covariate_names}{names of covariates as a reference, default to \code{NULL}.}
}
\value{
A \code{ggplot2} object.
}
\description{
Plot Fraction Spatial Variance vs Q-value
}
\examples{
## Mock up a SpatialExperiment object wit 400 cells and 3 genes
set.seed(42)
spe <- mockSVG(size = 20, tot_genes = 3, de_genes = 1, return_SPE = TRUE)

## Run spatialDE with S4 integration
results <- spatialDE(spe)

## Run model search
msearch <- modelSearch(spe, de_results = results, qval_thresh = NULL,
  verbose = FALSE)

plot <- FSV_sig(results, msearch)

}
\references{
Svensson, V., Teichmann, S. & Stegle, O. SpatialDE: identification of
spatially variable genes. Nat Methods 15, 343–346 (2018).
\url{https://doi.org/10.1038/nmeth.4636}

\href{https://pypi.org/project/SpatialDE/1.1.3/}{\strong{SpatialDE 1.1.3}}: the version
of the Python package used under the hood.
}
\author{
Davide Corso, Milan Malfait, Lambda Moses
}
