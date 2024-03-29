#' Extract labelled parameters of lavaan objects
#'
#' @param lavaan_object lavaan object.
#' @param printp If TRUE convert into easily readable p values.

#' @return This function returns a tibble with labelled parameters.
#' @export
#' @references David Robinson and Alex Hayes (2019). broom: Convert Statistical Analysis Objects into Tidy Tibbles. R package version 0.5.2.
#' \url{https://CRAN.R-project.org/package=broom/}
#' @examples # First create a lavaan object
#' bi_lcsm_01 <- fit_bi_lcsm(data = data_bi_lcsm, 
#'                           var_x = names(data_bi_lcsm)[2:4], 
#'                           var_y = names(data_bi_lcsm)[12:14],
#'                           model_x = list(alpha_constant = TRUE, 
#'                                          beta = TRUE, 
#'                                          phi = FALSE),
#'                           model_y = list(alpha_constant = TRUE, 
#'                                          beta = TRUE, 
#'                                          phi = TRUE),
#'                           coupling = list(delta_lag_xy = TRUE, 
#'                                           xi_lag_yx = TRUE)
#'                                           )
#'
#' # Now extract parameter estimates              
#' extract_param(bi_lcsm_01)

extract_param <- function(lavaan_object, printp = FALSE){
  # Get tidy output tibble from lavaan fit object
  table <- broom::tidy(lavaan_object)

  # Replace empty stings with NA
  table[table == ""] <- NA

  # Remove all rows with NA in label column
  # Parameters that should be extracted need to be labelled in the lavaan model specifications
  # If parameters are not labelled they will get deleted from the summary at this step
  table2 <- table[(stats::complete.cases(table$label)), 3:ncol(table)]

  # Delete rows with duplicate labels
  table3 <- table2[!base::duplicated(table2$label), ]

  if (printp == FALSE){
    return(table3)
  }
  
  if (printp == TRUE){
    
    table3 <- dplyr::mutate(table3, 
                            p.value = ifelse(p.value < .001, "< .001", as.character(round(p.value, digits = 3))),
                            p.value = sub("^0+", "", p.value)
                            )
    
    return(table3)
    
  }
  

  }
