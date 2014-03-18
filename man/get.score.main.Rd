\name{get.score.main}
\alias{get.score.main}
\title{
Calculation of composite scores based on a main-effect model
}
\description{
This function is to fit a main-effect model assuming no treatment-specific subgroups exist (under the null).
}
\usage{
get.score.main(time, event, treat, bio, covar = NULL, nfolds = 5, 
               alpha = 0.5)
}
\arguments{
  \item{time}{
    A numeric vector containing the follow up time for right censored data.
  }
  \item{event}{
    A numeric vector containing the status indicator, normally 0=alive, 1=dead.
  }
  \item{treat}{
    A numeric vector containing the treatment indicator: 1=treatment of interest, 0=alternative treatment (e.g. placebo or standard of care).
  }
  \item{bio}{
    A numeric data frame or matrix containing biomarker values.
  }
  \item{covar}{
    A numeric matrix containing clinical covariates. Default is \code{NULL} for not including any covariates.
  }
  \item{nfolds}{
    The number of folds for cross validation in choosing tuning parameters. The function \code{cv.glmnet()} in the ``glmnet'' package is called, which requires cross validation to choose the tuning parameter ``lambda''. Default is 5.
  }
  \item{alpha}{
    A scalar for the elasticnet mixing parameter as in the ``glmnet'' package (0=ridge, 1=lasso). A fixed value is supposed to be used, without searching for the optimal alpha value. Default is 0.5.
  }
}
\details{
This function is a function called by \code{MMMS()} to obtain bootstrap-based p-values. A main-effect model is considered by assuming that no treatment-specific subgroups exist. This function is used for obtaining (semi)parametric bootstrap samples under the null.
}
\value{
A list with the following elements:
\item{fit}{The \code{glmnet} fitted object assuming no subgroups exist.}
\item{lam.best}{The optimal \code{lambda} value chosen when assuming no subgroups exist.}
\item{fit.selected}{An object returned by \code{coxph()} using selected biomarkers when assuming no subgroups exist.}
\item{sfit}{An object returned by \code{survfit()} for bootstrap sampling.}
}
\references{
Lin Li, Tobias Guennel, Scott Marshall, Leo Wang-Kit Cheung (2014) A multi-marker molecular signature approach for treatment-specific subgroup identification with survival outcomes. \emph{The Pharmacogenomics Journal}. http://dx.doi.org/10.1038/tpj.2014.9
}
\author{
Author: Lin Li, Tobias Guennel,Scott Marshall, Leo Wang-Kit Cheung

Contributors: Brigid M. Wilson, Dilan C. Paranagama

Maintainer: Lin Li <lli@biostatsolutions.com>
}
\seealso{
\code{\link{MMMS}}, \code{\link{get.score}}
}
\examples{
  # load the dataset
  data(simdat)
  attach(simdat)
  
  # get composite scores using a main-effect model
  main.only=get.score.main(time,event,treat,bio,covar,nfolds=5,alpha=0.5)

}