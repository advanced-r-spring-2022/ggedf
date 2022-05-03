StatPerSum <- ggplot2::ggproto("StatPerSum", ggplot2::Stat,
                      
                      compute_group = function(data, scales) {
                        data <- data.frame(x = data$y)
                        new_data <- data.frame(x = apply(data, 2, function(x) ecdf(x) (sort(x))))
                        new_data$y <- sort(data$x)
                        new_data
                      },
                      
                      required_aes = c("y")
                      
)
#' @title Create Percentile Summary Graphs
#' 
#' @description Create scatterplot of ({\frac{i}{n}},{X_i}) with horizontal 
#' quantile lines.
#' 
#' @details The functions stat_per_sum and stat_quant create a custom stat for 
#' {ggplot2} to create a scatterplot of ({\frac{i}{n}},{X_i}) and an
#' accompanying stat for {ggplot2} that indicates the quantiles. Combined, these 
#' graphics create a percentile summary graph to show the distribution of a 
#' variable in a data set.
#' 
#' @param aes(y) The only parameter required of this function is a y parameter 
#' passed through the aes() function of the ggplot() call. 
#' @param ... stat_per_sum and stat_quant support the passing of additional 
#' parameters, allowing for customization of graphics seen in other stats and 
#' geoms. For more information of what additional arguments can be passed, look 
#' at the help files for ggplot() and any stats and geoms being used.
#' 
#' @return These functions in combination with a call to ggplot() return a 
#' ggplot2 graphic object that can display a percentile summary graph.
#' 
#' @author Kathryn Cronquist
#' @author Thea De Jong
#' @author Ben Stano
#' 
#' @examples
#' ## Display percentile summary graph of mpg, with blue scatterplot and dashed 
#' ## quantile lines
#' 
#' ggplot2::ggplot(mtcars, ggplot2::aes(y = mpg)) + 
#' stat_per_sum(color = "blue") +
#' stat_quant(linetype = "dashed")
#' 
#' @export
stat_per_sum <- function(mapping = NULL, data = NULL, geom = "point",
                         position = "identity", na.rm = FALSE, show.legend = NA, 
                         inherit.aes = TRUE, ...) {
  ggplot2::layer(
    stat = StatPerSum, data = data, mapping = mapping, geom = geom, 
    position = position, show.legend = show.legend, inherit.aes = inherit.aes,
    params = list(na.rm = na.rm, ...)
  )
}