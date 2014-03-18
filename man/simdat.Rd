\name{simdat}
\alias{simdat}
\docType{data}
\title{
An example dataset
}
\description{
An example dataset with time-to-event outcomes, biomarker values and covariates.
}
\usage{data(simdat)}
\format{
The data contains a list of length 9:

\code{time}: Time variable.

\code{event}: Event variable.

\code{treat}: Treatment variable.

\code{cont}: Biomarker data -- continuous values.

\code{burden}: Biomarker data -- burden scores of mutations.

\code{snps}: Biomarker data -- genotypes of single nucleotide polymorphisms.

\code{covar}: covariates.

\code{sub.true}: true subgroup size.

\code{bio}: combined biomarker data (\code{cbind(cont,burden,snps)}).
}
\references{
Lin Li, Tobias Guennel, Scott Marshall, Leo Wang-Kit Cheung (2014) A multi-marker molecular signature approach for treatment-specific subgroup identification with survival outcomes. \emph{The Pharmacogenomics Journal}. http://dx.doi.org/10.1038/tpj.2014.9
}
\examples{
data(simdat)
}
\keyword{datasets}
