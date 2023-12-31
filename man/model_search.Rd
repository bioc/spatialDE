% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/classify_SVGs.R
\name{model_search}
\alias{model_search}
\title{Compare model fits with different models}
\usage{
model_search(x, coordinates, de_results, qval_thresh = 0.05, verbose = FALSE)
}
\arguments{
\item{x}{\code{matrix}-like object of normalized counts. E.g. resulting from
\code{\link[=regress_out]{regress_out()}}.}

\item{coordinates}{\code{data.frame} with sample coordinates.
Each row is a sample, the columns with coordinates must be named 'x' and 'y'.}

\item{de_results}{\code{data.frame} resulting from \code{\link[=run]{run()}}.}

\item{qval_thresh}{\code{numeric} scalar, specifying the q-value significance
threshold to filter \code{de_results}. Only rows in \code{de_results} with
\code{qval < qval_thresh} will be kept. To disable, set \code{qval_thresh = NULL}.}

\item{verbose}{\code{logical} controlling the display of the progress bar.}
}
\value{
\code{data.frame} of model_search results.
}
\description{
Classify DE genes to interpretable fitting classes.
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

## Run model search
ms_results <- model_search(
    x = regressed,
    coordinates = mock$coordinates,
    de_results = de_results,
    qval_thresh = NULL
)

}
\references{
Svensson, V., Teichmann, S. & Stegle, O. SpatialDE:
identification of spatially variable genes. Nat Methods 15, 343–346 (2018).
\url{https://doi.org/10.1038/nmeth.4636}
}
