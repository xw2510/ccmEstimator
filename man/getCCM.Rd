% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/getCCM.R
\name{getCCM}
\alias{getCCM}
\title{Comparative Causal Mediation Analysis}
\usage{
getCCM(Y,T1,T2,M,data = NULL,
  noInteraction = TRUE,sigLevel = 0.05,
  boots = 1000)
}
\arguments{
\item{Y}{numeric outcome variable. Should be a vector if a data frame is not provided through the \code{data} argument, or the ("character") name of the variable in the data frame if provided.}

\item{T1}{binary indicator for first treatment. Should be a vector if a data frame is not provided through the \code{data} argument, or the ("character") name of the variable in the data frame if provided.}

\item{T2}{binary indicator for second treatment. Should be a vector if a data frame is not provided through the \code{data} argument, or the ("character") name of the variable in the data frame if provided.}

\item{M}{numeric mediator variable. Should be a vector if a data frame is not provided through the \code{data} argument, or the ("character") name of the variable in the data frame if provided.}

\item{data}{an optional data frame containing the variables to be used in analysis.}

\item{noInteraction}{logical. If \code{TRUE} (the default), the assumption of no interaction between the treatments and mediator is employed in the analysis.}

\item{sigLevel}{significance level to use in construction of confidence intervals. Default is 0.05 (i.e. 95 percent confidence intervals).}

\item{boots}{number of bootstrap resamples taken for construction of confidence intervals.}
}
\value{
A \code{ccmEstimation} object, which contains the estimates and confidence intervals for the two comparative causal mediation analysis estimands, as well as the ATE and ACME for each treatment.
Note, however, that the individual ACME estimates are reported only for descriptive purposes, as the comparative causal mediation analysis methods are not designed to produce unbiased or consistent estimates of the individual ACMEs (see Bansak 2020 for details). Users should consider alternative methods if interested in individual ACME estimates.

User should input the \code{ccmEstimation} object into the \code{summary()} function to view the estimation results.
Note also that the comparative causal mediation analysis results and interpretation of the results
will be printed in the console.
}
\description{
Function to perform comparative causal mediation analysis to compare the mediation effects of different treatments via a common mediator.
Function requires two separate treaments (as well as a control condition) and one mediator.
}
\details{
Function will automatically assess the comparative causal mediation analysis scope conditions
(i.e. for each comparative causal mediation estimand, a numerator and denominator that are both estimated with the desired statistical significance and of the same sign).
Results will be returned for each comparative causal mediation estimand only if scope conditions are met for it.
See "Scope Conditions" section in Bansak (2020) for more information.
Results will also be returned for the ATE and ACME for each treatment.

If \code{noInteraction = TRUE} (the default setting), function will automatically assess the possibility of interactions between treatments and mediator and return a warning in case evidence of such interactions are found.
}
\examples{
#Example from application in Bansak (2020)
data(ICAapp)
set.seed(321, kind = "Mersenne-Twister", normal.kind = "Inversion")
ccm.results <-
   getCCM(Y = "dapprp", T1 = "trt1", T2 = "trt2", M = "immorp", data = ICAapp,
   noInteraction = TRUE, sigLevel = 0.05, boots = 1000)
summary(ccm.results)
}
\references{
Bansak, K. (2020). Comparative causal mediation and relaxing the assumption of no mediator-outcome confounding: An application to international law and audience costs. Political Analysis, 28(2), 222-243.
}
\author{
Kirk Bansak and Xiaohan Wu
}
