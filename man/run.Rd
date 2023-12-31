% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/run.R
\name{run}
\alias{run}
\title{Perform SpatialDE test}
\usage{
run(x, coordinates, verbose = FALSE)
}
\arguments{
\item{x}{\code{matrix}-like object of normalized counts. E.g. resulting from
\code{\link[=regress_out]{regress_out()}}.}

\item{coordinates}{\code{data.frame} with sample coordinates.
Each row is a sample, the columns with coordinates must be named 'x' and 'y'.}

\item{verbose}{\code{logical} controlling the display of the progress bar.}
}
\value{
A \code{data.frame} with DE results where each row is a gene and columns
contain relevant statistics.

The most important columns are:
\itemize{
\item \code{g}: the name of the gene
\item \code{pval}: the p-value for spatial differential expression
\item \code{qval}: the q-value, indicating significance after correcting for
multiple testing
\item \code{l}: A parameter indicating the distance scale a gene changes expression
over
}
}
\description{
Wraps the \code{run} function from the
\href{https://github.com/Teichlab/SpatialDE}{SpatialDE} Python package.
}
\examples{
## Mock up a SpatialExperiment object wit 400 cells and 3 genes
set.seed(42)
mock <- mockSVG(size = 20, tot_genes = 3, de_genes = 1)

stabilized <- stabilize(mock$counts)
sample_info <- mock$coordinates
sample_info$total_counts <- colSums(mock$counts)
regressed <- regress_out(counts = stabilized, sample_info = sample_info)

## Run SpatialDE
de_results <- run(regressed, coordinates = mock$coordinates)

}
\references{
Svensson, V., Teichmann, S. & Stegle, O.
SpatialDE: identification of spatially variable genes.
Nat Methods 15, 343–346 (2018). \url{https://doi.org/10.1038/nmeth.4636}
}
