## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(lcsm)

## ----sim-uni-data-------------------------------------------------------------
# Simulate some data 
sim_uni_lcsm(timepoints = 5, 
             model = list(alpha_constant = TRUE, beta = FALSE, phi = TRUE), 
             model_param = list(gamma_lx1 = 21, 
                                sigma2_lx1 = 1.5,
                                sigma2_ux = 0.2,
                                alpha_j2 = -0.93,
                                sigma2_j2 = 0.1,
                                sigma_j2lx1 = 0.2,
                                phi_x = 0.3),
             sample.nobs = 1000,
             na_pct = 0.3)


## ---- sim-bi-syn--------------------------------------------------------------
# Return lavaan syntax based on the following argument specifications
simsyntax <- sim_bi_lcsm(timepoints = 5, 
                         model_x = list(alpha_constant = TRUE, beta = TRUE, phi = FALSE),
                         model_x_param = list(gamma_lx1 = 21,
                                              sigma2_lx1 = .5,
                                              sigma2_ux = .2,
                                              alpha_g2 = -.4,
                                              sigma2_g2 = .4,
                                              sigma_g2lx1 = .2,
                                              beta_x = -.1),
                         model_y = list(alpha_constant = TRUE, beta = TRUE, phi = TRUE),
                         model_y_param = list(gamma_ly1 = 5,
                                              sigma2_ly1 = .2,
                                              sigma2_uy = .2,
                                              alpha_j2 = -.2,
                                              sigma2_j2 = .1,
                                              sigma_j2ly1 = .02,
                                              beta_y = -.2,
                                              phi_y = .1),
                         coupling = list(delta_lag_xy = TRUE, 
                                         xi_lag_yx = TRUE),
                         coupling_param = list(sigma_su = .01,
                                               sigma_ly1lx1 = .2,
                                               sigma_g2ly1 = .1,
                                               sigma_j2lx1 = .1,
                                               sigma_j2g2 = .01,
                                               delta_lag_xy = .13,
                                               xi_lag_yx = .4),
                        return_lavaan_syntax = TRUE)

## ---- sim-bi-syn-print--------------------------------------------------------
cat(simsyntax)

