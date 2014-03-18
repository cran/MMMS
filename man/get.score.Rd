\name{get.score}
\alias{get.score}
\title{
Calculation of composite scores based on an interaction model
}
\description{
This function is to calculate composite scores of a multi-marker molecular signature based on an interaction model.
}
\usage{
get.score(time, event, treat, bio, covar = NULL, nfolds = 5, alpha = 0.5, 
          pos.direction = FALSE)
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
  \item{pos.direction}{
    A logical value indicating whether a subgroup with hazard ratio > 1 is desirable. Default is \code{FALSE}, i.e. a hazard ratio < 1 is desirable.
  }
}
\details{
This function is a function called by \code{MMMS()} to calculate MMMS composite scores. An interaction model is considered by assuming that a treatment-specific subgroup exists. The composite scores based on interaction terms and main-effect terms are both calculated via elastic net as implemented by the ``glmnet'' package. The composite scores based on interaction terms are used for identifying treatment-specific subgroups, while those based on main-effect terms are used for adjusting for biomarker main effect.
}
\value{
A list with the following elements:
\item{score}{The composite scores based interaction terms for the treatment arm of interest (\code{treat==1}).}
\item{score.all}{The composite scores based on interaction terms for all patients.}
\item{score.main}{The composite scores based on main-effect terms.}
\item{coefs}{Elnet coefficient estimates for interaction terms.}
\item{coefs.main}{Elnet coefficient estimates for main-effect terms.}
\item{fit}{The \code{glmnet} fitted object for obtaining the MMMS composite scores.}
\item{lam.best}{The optimal \code{lambda} value chosen for obtaining the MMMS composite scores.}
\item{treat}{The treatment variable in the input data.}
\item{alpha}{The \code{alpha} value used for obtaining the MMMS composite scores.}
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
\code{\link{MMMS}}
}
\examples{
  # load the dataset
  data(simdat)
  attach(simdat)
  
  # get composite scores using an interaction model
  score = get.score(time,event,treat,bio,covar,nfolds=5,alpha=0.5,
                    pos.direction=FALSE)
}
