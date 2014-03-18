\name{MMMS-package}
\alias{MMMS-package}
\docType{package}
\title{
Multi-Marker Molecular Signature for Treatment-specific Subgroup Identification
}
\description{
The package implements a multi-marker molecular signature (MMMS) approach for treatment-specific subgroup identification. Time-to-event outcomes are currently supported, based on the approach described in Li et al. (2014). Other types of outcomes (e.g. binary and continuous outcomes) may be supported in future versions.
}
\details{
\tabular{ll}{
Package: \tab MMMS\cr
Type: \tab Package\cr
Version: \tab 0.1\cr
Date: \tab 2014-03-18\cr
License: \tab GPL-3\cr
}
The package contains one main function: \code{MMMS()}, which estimates composite scores for a multi-marker molecular signature (MMMS), identifies a subgroup based on the scores, and assesses the significance of the treatment-specific subgroup effect on the outcome of interest. \code{MMMS()} calls several functions that can also be called separately: \code{get.score()}, \code{get.score.main()}, \code{get.subgroup()}, etc.
}
\author{
Author: Lin Li, Tobias Guennel,Scott Marshall, Leo Wang-Kit Cheung

Contributors: Brigid M. Wilson, Dilan C. Paranagama

Maintainer: Lin Li <lli@biostatsolutions.com>
}
\references{
Lin Li, Tobias Guennel, Scott Marshall, Leo Wang-Kit Cheung (2014) A multi-marker molecular signature approach for treatment-specific subgroup identification with survival outcomes. \emph{The Pharmacogenomics Journal}. http://dx.doi.org/10.1038/tpj.2014.9
}
\keyword{ package }
