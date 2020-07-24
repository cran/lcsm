## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(lcsm)
library(lavaan)

## -----------------------------------------------------------------------------
# First fit some latent change score models

# No change model
uni_lcsm_01 <- fit_uni_lcsm(data = data_uni_lcsm, 
                            var = c("x1", "x2", "x3", "x4", "x5"),
                            model = list(alpha_constant = FALSE, 
                                         beta = FALSE, 
                                         phi = FALSE))
# Constant change only model
uni_lcsm_02 <- fit_uni_lcsm(data = data_uni_lcsm, 
                            var = c("x1", "x2", "x3", "x4", "x5"),
                            model = list(alpha_constant = TRUE, 
                                         beta = FALSE, 
                                         phi = FALSE))

# Constant change and proportional change (Dual change model)
uni_lcsm_03 <- fit_uni_lcsm(data = data_uni_lcsm, 
                            var = c("x1", "x2", "x3", "x4", "x5"),
                            model = list(alpha_constant = TRUE, 
                                         beta = TRUE, 
                                         phi = FALSE))


## -----------------------------------------------------------------------------
# Extract fit statistics
fit_uni_lcsm <- extract_fit(uni_lcsm_01, uni_lcsm_02, uni_lcsm_03)

# Print table of parameter estimates
knitr::kable(fit_uni_lcsm, 
             digits = 3, 
             caption = "Parameter estimates for bivariate LCSM")


## -----------------------------------------------------------------------------
# Now extract parameter estimates
param_uni_lcsm_02 <- extract_param(uni_lcsm_03, printp = TRUE)

# Print table of parameter estimates
knitr::kable(param_uni_lcsm_02, 
             digits = 3, 
             caption = "Parameter estimates for bivariate LCSM")


