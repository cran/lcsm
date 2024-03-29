% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/fit_lcsm.R
\name{fit_bi_lcsm}
\alias{fit_bi_lcsm}
\title{Fit bivariate latent change score models}
\usage{
fit_bi_lcsm(
  data,
  var_x,
  var_y,
  model_x,
  model_y,
  coupling,
  add = NULL,
  mimic = "Mplus",
  estimator = "MLR",
  missing = "FIML",
  return_lavaan_syntax = FALSE,
  ...
)
}
\arguments{
\item{data}{Wide dataset.}

\item{var_x}{List of variables measuring one construct of the model.}

\item{var_y}{List of variables measuring another construct of the model.}

\item{model_x}{List of model specifications (logical) for variables specified in \code{var_x}.
\itemize{
\item{\code{alpha_constant}}{ (Constant change factor)},
\item{\code{alpha_piecewise}}{ (Piecewise constant change factors)},
\item{\code{alpha_piecewise_num}}{ (Changepoint of piecewise constant change factors.
In an example with 10 repeated measurements, setting \code{alpha_piecewise_num} to 5 would estimate two seperate constant change factors, a first one for changes up to timepoint 5, and a second one for changes from timepoint 5 onwards (in this example timepoint 10).},
\item{\code{alpha_linear}}{ (Linear change factor)},
\item{\code{beta}}{ (Proportional change factor)},
\item{\code{phi}}{ (Autoregression of change scores)}.
}}

\item{model_y}{List of model specifications for variables specified in \code{var_y}.
\itemize{
\item{\code{alpha_constant}}{ (Constant change factor)},
\item{\code{alpha_piecewise}}{ (Piecewise constant change factors)},
\item{\code{alpha_piecewise_num}}{ (Changepoint of piecewise constant change factors.
In an example with 10 repeated measurements, setting \code{alpha_piecewise_num} to 5 would estimate two seperate constant change factors, a first one for changes up to timepoint 5, and a second one for changes from timepoint 5 onwards (in this example timepoint 10).},
\item{\code{alpha_linear}}{ (Linear change factor)},
\item{\code{beta}}{ (Proportional change factor)},
\item{\code{phi}}{ (Autoregression of change scores)}.
}}

\item{coupling}{List of model specifications (logical) for coupling parameters.
\itemize{
\item{\code{coupling_piecewise}}{ (Piecewise coupling parameters)},
\item{\code{coupling_piecewise_num}}{ (Changepoint of piecewise coupling parameters)},
\item{\code{delta_xy}}{ (True score y predicting subsequent change score x)},
\item{\code{delta_yx}}{ (True score x predicting subsequent change score y)},
\item{\code{xi_xy}}{ (Change score y predicting subsequent change score x)},
\item{\code{xi_yx}}{ (Change score x predicting subsequent change score y)}.
}}

\item{add}{String, lavaan syntax to be added to the model}

\item{mimic}{See \code{mimic} argument in \link[lavaan]{lavOptions}.}

\item{estimator}{See \code{estimator} argument in \link[lavaan]{lavOptions}.}

\item{missing}{See \code{missing} argument in \link[lavaan]{lavOptions}.}

\item{return_lavaan_syntax}{Logical, if TRUE return the lavaan syntax used for simulating data. To make it look beautiful use the function \link[base]{cat}.}

\item{...}{Additional arguments to be passed to \link[lavaan]{lavOptions}.}
}
\value{
This function returns a lavaan class object.
}
\description{
Fit bivariate latent change score models.
}
\examples{
# Fit 
fit_bi_lcsm(data = data_bi_lcsm, 
            var_x = names(data_bi_lcsm)[2:4], 
            var_y = names(data_bi_lcsm)[12:14],
            model_x = list(alpha_constant = TRUE, 
                           beta = TRUE, 
                           phi = FALSE),
            model_y = list(alpha_constant = TRUE, 
                           beta = TRUE, 
                           phi = TRUE),
            coupling = list(delta_lag_xy = TRUE, 
                            xi_lag_yx = TRUE)
                            )
}
\references{
Ghisletta, P., & McArdle, J. J. (2012). Latent Curve Models and Latent Change Score Models Estimated in R. Structural Equation Modeling: A Multidisciplinary Journal, 19(4), 651–682. \doi{10.1146/annurev.psych.60.110707.163612}.

Grimm, K. J., Ram, N., & Estabrook, R. (2017). Growth Modeling—Structural Equation and Multilevel Modeling Approaches. New York: The Guilford Press.

McArdle, J. J. (2009). Latent variable modeling of differences and changes with longitudinal data. Annual Review of Psychology, 60(1), 577–605. \doi{10.1146/annurev.psych.60.110707.163612}.

Yves Rosseel (2012). lavaan: An R Package for Structural Equation Modeling. Journal of Statistical Software, 48(2), 1-36.
\doi{10.18637/jss.v048.i02}.
}
