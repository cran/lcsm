## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(lcsm)

## ---- fig.width = 6, fig.height = 4-------------------------------------------
# Fit bivariate lcsm and save the results 
uni_lavaan_results <- fit_uni_lcsm(data = data_uni_lcsm, 
                                   var = c("x1", "x2", "x3", "x4", "x5"),
                                   model = list(alpha_constant = TRUE, 
                                                beta = TRUE, 
                                                phi = TRUE)
                                  )

# Save the lavaan syntax that is used to create the layout matrix for semPlot
uni_lavaan_syntax <- fit_uni_lcsm(data = data_uni_lcsm, 
                                  var = c("x1", "x2", "x3", "x4", "x5"),
                                  model = list(alpha_constant = TRUE, 
                                               beta = TRUE, 
                                               phi = TRUE),
                                  return_lavaan_syntax = TRUE)

# Plot the results
plot_lcsm(lavaan_object = uni_lavaan_results,
          lavaan_syntax = uni_lavaan_syntax,
          edge.label.cex = .9,  
          lcsm_colours = TRUE,
          lcsm = "univariate")


## ---- fig.width = 6, fig.height = 4-------------------------------------------
# Fit bivariate lcsm and save the results 
bi_lavaan_results <- fit_bi_lcsm(data = data_bi_lcsm, 
                                 var_x = c("x1", "x2", "x3", "x4", "x5"),
                                 var_y = c("y1", "y2", "y3", "y4", "y5"),
                                 model_x = list(alpha_constant = TRUE, 
                                                beta = TRUE, 
                                                phi = FALSE),
                                 model_y = list(alpha_constant = TRUE, 
                                                beta = TRUE, 
                                                phi = TRUE),
                                 coupling = list(delta_lag_xy = TRUE, 
                                                 xi_lag_yx = TRUE))

# Save the lavaan syntax that is used to create the layout matrix for semPlot
bi_lavaan_syntax <- fit_bi_lcsm(data = data_bi_lcsm, 
                                var_x = c("x1", "x2", "x3", "x4", "x5"),
                                var_y = c("y1", "y2", "y3", "y4", "y5"),
                                model_x = list(alpha_constant = TRUE, 
                                               beta = TRUE, 
                                               phi = FALSE),
                                model_y = list(alpha_constant = TRUE, 
                                               beta = TRUE, 
                                               phi = TRUE),
                                coupling = list(delta_lag_xy = TRUE, 
                                                xi_lag_yx = TRUE),
                                return_lavaan_syntax = TRUE)

# Plot the results
plot_lcsm(lavaan_object = bi_lavaan_results, 
          lavaan_syntax = bi_lavaan_syntax,
          lcsm_colours = TRUE,
          whatLabels = "hide",
          lcsm = "bivariate")


