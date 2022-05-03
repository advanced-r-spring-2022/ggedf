StatConfInt <- ggproto("StatConfInt", Stat,
                       
                       compute_group = function(data, scales) {
                         data <- data.frame(x = data$y)
                         new_data <- data.frame(x = apply(data, 2, function(x) ecdf(x) (sort(x))))
                         new_data$y <- sort(data$x)
                         new_data
                         
                         ## Compute the line segment endpoints
                         new_data$stderr = sd(new_data$x, na.rm = TRUE) / sqrt(sum(!is.na(new_data$x)))
                         
                         n <- length(new_data$y)
                         x <- c(0, new_data$x, 1)
                         epsilon <- sqrt(log(2 / 0.05) / (2 * n))  #set alpha to 0.05
                         low <- pmax(x - epsilon, 0)
                         high <- pmin(x + epsilon, 1)
                         
                         y <- c(min(new_data$y), new_data$y, max(new_data$y))
                         ystart <- y - y*.05
                         yend <- y + y*.05
                         
                         #return a new data frame
                         data.frame(x = c(low, high), y = ystart, 
                                    yend = yend, xend = c(low,high))
                         
                       },
                       
                       required_aes = c("y")
)


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
#' stat_per_sum returns a ggplot2 graphic object that can 
#' display a percentile summary graph with 
#' confidence intervals.
#' 
#' @author Kathryn Cronquist
#' @author Thea De Jong
#' @author Ben Stano
#' 
#' @examples
#' ## Display percentile summary graph of mpg, with blue scatterplot and solid 
#' quantile lines, and dashed confidence intervals
#' ggplot(mtcars, aes(y = mpg)) + 
#' stat_per_sum(color = "blue") +
#' stat_quant() +
#' stat_conf_int(linetype = "dashed")
#' 
#' @export
stat_conf_int <- function(mapping = NULL, data = NULL, geom = "segment",
                          position = "identity", na.rm = FALSE, 
                          show.legend = NA, inherit.aes = TRUE, ...) {
  layer(
    stat = StatConfInt, 
    data = data, 
    mapping = mapping, 
    geom = geom, 
    position = position, 
    show.legend = show.legend, 
    inherit.aes = inherit.aes, 
    params = list(na.rm = na.rm, ...)
  )
}

