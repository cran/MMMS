\name{get.subgroup}
\alias{get.subgroup}
\title{
Searching for a treatment-specific subgroup
}
\description{
Searching for a treatment-specific subgroup based on MMMS composite scores.
}
\usage{
get.subgroup(score.info, data, lb = 20, ub = 80)
}
\arguments{
  \item{score.info}{
    The object returned by \code{get.score()}.
  }
  \item{data}{
    A list containing input data used for calculating composite scores. The list should have at the least the following elements: \code{$time}, \code{$event}, \code{$treat}, and \code{$covar}, which are the same as those used for calculating the composite scores.
  }
  \item{lb}{
    A scalar indicating the lower bound of the search range for desired subgroup sizes in percentage (e.g. 20 means 20\%).
  }
  \item{ub}{
    A scalar indicating the lower bound of the search range for desired subgroup sizes in percentage (e.g. 80 means 80\%).
  }
}
\details{
This function is a function called by \code{MMMS()} to search for an optimal treatment-specific subgroup. A range of desired subgroup sizes can be specified. When no subgroup can be found within the range, values of \code{NA} will be returned.
}
\value{
A list with the following elements:
\item{pct}{All possible subgroup sizes within the desired range.}
\item{cutoff}{All possible cutoffs for the composite scores (based on interaction terms) that give subgroup sizes within the desired range.}
\item{i.best}{The index with respect to \code{pct} and \code{cutoff} that corresponds to the optimal subgroup.}
\item{fit.best}{The fitted model based on the subgroup defined by the optimal cutoff.}
\item{pct.best}{The subgroup size of the subgroup defined by the optimal cutoff.}
\item{cutoff.best}{The optimal cutoff.}
\item{chisq.best}{The chi-square statistic for the treatment-by-subgroup interaction for the subgroup defined by the optimal cutoff.}
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
  
  # get composite scores using an interaction model
  score = get.score(time,event,treat,bio,covar,nfolds=5,alpha=0.5,
                    pos.direction=FALSE)  

  # get subgroup
  subgrp = get.subgroup(score,simdat,lb=20,ub=80)
}