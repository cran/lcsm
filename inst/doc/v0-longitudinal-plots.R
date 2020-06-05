## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup, message=FALSE-----------------------------------------------------
# Load packages
library(lcsm)
library(ggplot2)
library(tidyr)
library(dplyr)
library(stringr)

## -----------------------------------------------------------------------------
# Create a vector of variable names
x_var_list <- c("x1", "x2", "x3", "x4", "x5", "x6")

# Or simply use the paste function and R might work too
paste0("x", 1:6)

## ---- fig.width=7-------------------------------------------------------------
# Create long data set
data_long <- data_bi_lcsm %>% 
  select("id", all_of(x_var_list)) %>% 
  # Pivot data long
  pivot_longer(cols = all_of(x_var_list), names_to = "time", values_to = "value") %>% 
  mutate(
    # Extract number from time variable
    time = str_extract(time, "\\d+"),
    # At the moment the numbers in the time are 'characters'
    # So here it gets transformed to a numeric value
    time = factor(as.numeric(time))
    )

## ---- fig.width=7-------------------------------------------------------------
# Create violin plot  with outliers in colour blue
# Also add boxplot
ggplot(data_long, aes(time, value)) +
  geom_violin() +
  geom_boxplot(width = 0.1, outlier.colour = "blue") +
  theme_classic()


## ---- fig.width=7-------------------------------------------------------------
# Create longitudinal plot for construct x
# Select ransom 1.8% of the sample
plot_trajectories(data = data_bi_lcsm,
                  id_var = "id", 
                  var_list = x_var_list,
                  xlab = "Time", ylab = "Value",
                  connect_missing = FALSE, 
                  random_sample_frac = 0.018, 
                  title_n = TRUE)



## ---- fig.height=5, fig.width=7-----------------------------------------------
# Create plot for construct x
# Add facet_wrap() function from ggplot2
plot_trajectories(data = data_bi_lcsm,
                  id_var = "id", 
                  var_list = x_var_list,
                  xlab = "Time", ylab = "Value",
                  connect_missing = F, 
                  random_sample_frac = 0.018, 
                  title_n = T) +
  facet_wrap(~id)


