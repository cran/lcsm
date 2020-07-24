## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(lcsm)

## -----------------------------------------------------------------------------
uni_lcsm_syntax <- specify_uni_lcsm(timepoints = 5,
                                    var = "x",  
                                    change_letter = "g",
                                    model = list(alpha_constant = TRUE, 
                                                 beta = TRUE, 
                                                 phi = TRUE))

## -----------------------------------------------------------------------------
# To get a readable output use cat() function
cat(uni_lcsm_syntax)

## -----------------------------------------------------------------------------
# Specify bivariate LCS model
lavaan_bi_lcsm_delta_01 <- specify_bi_lcsm(timepoints = 5, 
                                           var_x = "x",
                                           model_x = list(alpha_constant = TRUE, 
                                                          beta = TRUE, 
                                                          phi = TRUE),
                                           var_y = "y",  
                                           model_y = list(alpha_constant = TRUE, 
                                                          beta = TRUE, 
                                                          phi = TRUE),  
                                           coupling = list(delta_lag_xy = TRUE, 
                                                           delta_lag_yx = TRUE),
                                           change_letter_x = "g",
                                           change_letter_y = "j")

## -----------------------------------------------------------------------------
# To get a readable output use cat() function
cat(lavaan_bi_lcsm_delta_01)

## -----------------------------------------------------------------------------
# Specify bivariate LCS model
lavaan_bi_lcsm_xi_01 <- specify_bi_lcsm(timepoints = 5, 
                                        var_x = "x",
                                        model_x = list(alpha_constant = TRUE, 
                                                       beta = TRUE, 
                                                       phi = TRUE),
                                        var_y = "y",  
                                        model_y = list(alpha_constant = TRUE, 
                                                       beta = TRUE, 
                                                       phi = TRUE),  
                                        coupling = list(xi_lag_xy = TRUE, 
                                                        xi_lag_yx = TRUE),
                                        change_letter_x = "g",
                                        change_letter_y = "j")

## -----------------------------------------------------------------------------
# To get a readable output use cat() function
cat(lavaan_bi_lcsm_xi_01)

