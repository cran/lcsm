% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/extract_fit.R
\name{extract_fit}
\alias{extract_fit}
\title{Extract fit statistics of lavaan objects}
\usage{
extract_fit(..., details = FALSE)
}
\arguments{
\item{...}{lavaan object(s)}

\item{details}{Logical, if TRUE return all fit statistics.
By default this is set to FALSE, a selection (chisq, npar, aic, bic, cfi, rmsea, srmr) of fit statistics is returned.}
}
\value{
This function returns a tibble.
}
\description{
Extract fit statistics of lavaan objects
}
\examples{
# First create a lavaan object
\dontrun{
bi_lcsm_01 <- fit_bi_lcsm(data = data_bi_lcsm, 
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

# Now extract fit statistics  

extract_fit(bi_lcsm_01)
}
}
\references{
David Robinson and Alex Hayes (2019). broom: Convert Statistical Analysis Objects into Tidy Tibbles. R package version 0.5.2.
\url{https://CRAN.R-project.org/package=broom/}.
}
