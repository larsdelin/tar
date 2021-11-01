#' @title Plot one-way analysis of variance
#'
#'@description
#'Graphs a box plot for results of the one-way ANOVA
#'
#'@param analysis takes a oneway(function) with desired data and attributes.
#'@param col sets color
#'@param ... passes other attributives to graph properties
#'
#'@return list
#'
#'@details creates a box plot which aids in the immediate comprehension of ANOVA
#'results in graph form.
#'
#'@export
#'
#'@examples
#'\dontrun{
#' # analysis of variance in multiple categorical groups
#' anova <- oneway(mtcars$mpg ~ mtcars$cyl, mtcars)
#' plot(anova)
#'
#'#' # another example without $ format
#' anova <- oneway(mpg ~ cyl, mtcars)
#' plot(anova)
#'  }

plot.oneway <- function(x, col="skyblue", ...){
  if(!inherits(x, "oneway")) stop("Must be class 'oneway'")
  boxplot(x$anova$terms, x$anova$model, ...)
}
