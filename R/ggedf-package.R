#' Extending ggplot2: Empirical Distribution Function Plots
#'
#' This extension to the ggplot2 allows for the user to create alternatives to 
#' the step-function plot for the empirical distribution function, or EDF. Such
#' plots include cumulative percentage polygons and percentile summary graphs,
#' which help to visualize the summary statistics of the given distribution.
#'
#' @section Functions:
#'
#' The main functions are:
#' \describe{
#'   \item{\code{\link{stat_cum_per_poly}()}}{Plots a cumulative frequency
#'   distribution by connecting points ({X_i}, {\frac{i}{n}})}
#'   \item{\code{\link{stat_per_sum}()}}{Creates a scatterplot of points 
#'   ({\frac{i}{n}},{X_i}) as well as horizantel quantile lines, similar to a 
#'   boxplot}
#' }
#'
#'
#'
#' @importFrom ggplot2
#' @useDynLib ldsep, .registration = TRUE
#'
#' @docType package
#' @name ggedf-package
#' @aliases ggedf
#'
#' @author Kathryn Cronquist
#' @author Thea De Jong
#' @author Ben Stano

NULL

#> NULL