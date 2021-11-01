#' @title Print one-way analysis of variance
#'
#'@description
#'Prints results of the one-way anova with additional formatting.
#'
#'@param formula takes a oneway(function) with desired data and attributes.
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
#' print(anova)
#'
#'#' # another example without $ format
#' anova <- oneway(mpg ~ cyl, mtcars)
#' print(anova)
#'  }

print.oneway <- function(x, ...){
  if(!inherits(x, "oneway")) stop("Must be class 'oneway'")
  cat("\nSummary Statistics\n",
      "====================================================\n", sep="")
  print(x$summarystats, ...)
  cat("\nAnova\n",
      "====================================================\n", sep="")
  print(summary.lm(x$anova), ...)
}
