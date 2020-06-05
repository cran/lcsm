## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(lcsm)

## -----------------------------------------------------------------------------
# First create a lavaan object
uni_lcsm_01 <- fit_uni_lcsm(data = data_bi_lcsm, 
                            var = c("x1", "x2", "x3", "x4", "x5"),
                            model = list(alpha_constant = FALSE, 
                                         beta = FALSE, 
                                         phi = FALSE))

uni_lcsm_02 <- fit_uni_lcsm(data = data_bi_lcsm, 
                            var = c("x1", "x2", "x3", "x4", "x5"),
                            model = list(alpha_constant = TRUE, 
                                         beta = FALSE, 
                                         phi = FALSE))

uni_lcsm_03 <- fit_uni_lcsm(data = data_bi_lcsm, 
                            var = c("x1", "x2", "x3", "x4", "x5"),
                            model = list(alpha_constant = TRUE, 
                                         beta = TRUE, 
                                         phi = FALSE))

## -----------------------------------------------------------------------------

extract_fit(uni_lcsm_01, uni_lcsm_02, uni_lcsm_03)


## -----------------------------------------------------------------------------
# Now extract parameter estimates
# Only extract first 7 columns for this example by adding [ , 1:7]
param_uni_lcsm_02 <- extract_param(uni_lcsm_03, printp = TRUE)

# Print table of parameter estimates
knitr::kable(param_uni_lcsm_02, 
             digits = 3, 
             caption = "Parameter estimates for bivariate LCSM")

