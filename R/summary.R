#' @title Summarize one-way analysis of variance
#'
#'@description
#'Summarizes results of the one-way anova with additional formatting.
#'
#'@param analysis takes a oneway(function) with desired data and attributes.
#'
#'@return a list of data for plot which is rendered
#'
#'@details creates a list which aids in the immediate comprehension of ANOVA results in text form.
#'
#'@export
#'
#'@examples
#'\dontrun{
#' # analysis of variance in multiple categorical groups
#' anova <- oneway(mtcars$mpg ~ mtcars$cyl, mtcars)
#' summarize(anova)
#'
#'#' # another example without $ format
#' anova <- oneway(mpg ~ cyl, mtcars)
#' summarize(anova)
#'  }

summary.oneway <- function(x, ...){
  if(!inherits(x, "oneway")) stop("x must  be class 'oneway'")
  print(anova(x$anova), ...)
}
