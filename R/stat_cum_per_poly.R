StatCPP <- ggplot2::ggproto("StatPercentile", ggplot2::Stat,
                   
                   compute_group = function(data, scales) {
                     if (!is.numeric(data$x)) {
                       stop("x aesthetic must be a numeric vector")
                     }
                     if (length(data$x) == 1) {
                       stop("x aesthetic must be a numeric vector")
                     }
                     
                     data <- data.frame(y = data$x)
                     new_data <- data.frame(y = apply(data, 2, function(x) ecdf(x)(sort(x))))
                     new_data$x <- sort(data$y)
                     new_data
                   },
                   
                   required_aes = c("x")
                   
)
#' @title Create Cumulative Percentage Polygon Graphs
#' 
#' @description Create graphic where data is displayed as a line plot 
#' connecting the points (\eqn{X_i}, \eqn{\frac{i}{n}}).
#' 
#' @details This function creates a custom stat for {ggplot2} that can create 
#' lines graphs showing the cumulative density polygon for a set of data. The 
#' resulting graphic displays what percentage of the data is cumulatively 
#' containing at a particular value. Such graphics give insight into the 
#' distribution and shape of a data set.
#' 
#' @param aes(x) The only parameter required of this function is an x parameter 
#' passed through the aes() function. This parameter may be passed directly to 
#' stat_cum_per_poly or to a previous ggplot() call.
#' @param ... stat_cum_per_poly supports the passing of additional parameters, 
#' allowing for customization of graphics seens in other stats and geoms. For 
#' more information of what additional arguments can be passed, look at the 
#' help files for ggplot() and any stats and geoms being used.
#' 
#' @return This function in combination with a call to ggplot() returns a 
#' ggplot2 graphic object that can display a cumulative percentage polygon.
#' 
#' @author Kathryn Cronquist
#' @author Thea De Jong
#' @author Ben Stano
#' 
#' @examples
#' ## Display CPP for hwy of mpg, with a red dashed line
#' ggplot2::ggplot(data = ggplot2::mpg, ggplot2::aes(x = hwy)) +
#' stat_cum_per_poly(color = "red", linetype = "dashed")
#' 
#' @export
stat_cum_per_poly <- function(mapping = NULL, data = NULL, geom = "line",
                       position = "identity", na.rm = FALSE, show.legend = NA, 
                       inherit.aes = TRUE, ...) {
  ggplot2::layer(
    stat = StatCPP, data = data, mapping = mapping, geom = geom, 
    position = position, show.legend = show.legend, inherit.aes = inherit.aes,
    params = list(na.rm = na.rm, ...)
  )
}