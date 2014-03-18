\name{MMMS}
\alias{MMMS}
\alias{extract.list}
\alias{get.p.boot}
\alias{sample.tte}
\alias{score2subgroup.all}
\alias{subset.list}
\title{
Subgroup identification using a multi-marker molecular signature approach
}
\description{
Identification of a treatment-specific subgroup for time-to-event outcomes using a multi-marker molecular signature approach
}
\usage{
MMMS(time, event, treat, bio, covar = NULL, pct.lb = 20, pct.ub = 80, n.boot = 1000, 
     pos.direction = FALSE, nfolds = 5, alpha = 0.5, verbose = FALSE, seed = NULL)
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
  \item{pct.lb}{
    A scalar indicating the lower bound of the search range for desired subgroup sizes in percentage (e.g. 20 means 20\%).
  }
  \item{pct.ub}{
    A scalar indicating the upper bound of the search range for desired subgroup sizes in percentage (e.g. 80 means 80\%).
  }
  \item{n.boot}{
    A scalar indicating the number of bootstraps for calculating the bootstrap p-value for the subgroup effect. Default is 1000, which is a recommended value.
  }
  \item{pos.direction}{
    A logical value indicating whether a subgroup with hazard ratio > 1 is desirable. Default is \code{FALSE}, i.e. a hazard ratio < 1 is desirable.
  }
  \item{nfolds}{
    The number of folds for cross validation in choosing tuning parameters. The function \code{cv.glmnet()} in the ``glmnet'' package is called, which requires cross validation to choose the tuning parameter ``lambda''. Default is 5.
  }
  \item{alpha}{
    A scalar for the elasticnet mixing parameter as in the ``glmnet'' package (0=ridige, 1=lasso). A fixed value is supposed to be used, without searching for the optimal alpha value. Default is 0.5.
  }
  \item{verbose}{
    A logical value indicating whether bootstrap progress should be printed. Default is \code{FALSE}.
  }
  \item{seed}{
    An integer for setting random seed, if provided. Default is \code{NULL} for not setting any seed.
  }
}
\details{
\code{MMMS()} calls several functions that could also be used separately: \code{get.score()}, \code{get.score.main()}, \code{get.subgroup()}, etc.

As is described in Li et al. (2014), the bootstrap p-value is based on a statistically valid test whose type I error is approximately controlled at the nominal level. However, caution is needed for interpreting the estimates of subgroup size and treatment-by-subgroup interaction effect, as bias has been observed in these estimates. Approaches for correcting bias in the estimates may be implemented in future versions of the ``MMMS'' package.
}

\value{
A list with the following elements:
\item{score.obj}{The object returned by \code{get.score()}.}
\item{score}{The composite scores based on interaction terms.}
\item{score.main}{The composite scores based on main-effect terms.}
\item{coefs}{Elnet coefficient estimates for interaction terms.}
\item{coefs.main}{Elnet coefficient estimates for main-effect terms.}
\item{fit}{The \code{glmnet} fitted object for obtaining the MMMS composite scores.}
\item{lambda}{The optimal \code{lambda} value chosen for obtaining the MMMS composite scores.}
\item{alpha}{The \code{alpha} value used for obtaining the MMMS composite scores.}
\item{subgrp.obj}{The object returned by \code{get.subgroup()}.}
\item{subgrp.size}{The size (in percentage) of the optimal subgroup identified.}
\item{subgrp.fit}{The fitted model object for the optimal subgroup identified.}
\item{subgrp.cut}{The cutpoint of the composite score \code{score} for the optimal subgroup identified.}
\item{subgrp.pval}{The p-value of the treatment-by-subgroup effect based on \code{n.boot} bootstraps. \code{NA} is returned if \code{n.boot=0}.}
\item{n.boot}{The number of bootstraps considered for calculating \code{subgrp.pval}.}
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
\code{\link{get.score}}, \code{\link{get.subgroup}}.
}
\examples{
# load the dataset
data(simdat)
    
# estimate the MMMS (No bootstrap is considered for a quick illustration)
mmms = with(simdat,MMMS(time,event,treat,bio,covar,pct.lb=20,pct.ub=80,n.boot=0,
                        pos.direction=FALSE,nfolds=5,alpha=0.5,verbose=TRUE,seed=12345))
}
