StatConfInt <- ggproto

#' @title Create Confidence Intervals
#' 
#' @description Add confidence intervals to EDF plots.
#' 
#' @details The function conf_int creates a custom stat for 
#' {ggplot2} to add confidence intervals to other EDF stats. 
#' 
#' @param aes(y) The only parameter required of this function is a y parameter 
#' passed through the aes() function of the ggplot() call. 
#' @param ... conf_int supports the passing of additional 
#' parameters, allowing for customization of graphics seen in other stats and 
#' geoms. For more information of what additional arguments can be passed, look 
#' at the help files for ggplot() and any stats and geoms being used.
#' 
#' @return This function in combination with a call to ggplot() and a call to 
#' stat_per_sum or stat_cum_per_poly return a ggplot2 graphic object that can 
#' display a percentile summary graph or cumulative percentage polygon with 
#' confidence intervals.
#' 
#' @author Kathryn Cronquist
#' @author Thea De Jong
#' @author Ben Stano
#' 
#' @examples
#' ## Display percentile summary graph of mpg, with blue scatterplot and dashed 
#' quantile lines, and red confidence intervals
#' ggplot(mtcars, aes(y = mpg)) + 
#' stat_per_sum(color = "blue") +
#' stat_quant(linetype = "dashed") +
#' conf_int(linetype = "solid", color = "red")
#' 
#' @export

stat_conf_int <- function