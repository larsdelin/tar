#' @title One-way analysis of variance
#'
#'@description
#'Input the formula to test the differences between means within groups of the data with
#'ANOVA technique.
#'
#'@param formula takes a formula for a linear model to find determine the relationship
#'@param data dataset necessary for analysis
#'
#'@return a list of analysis output
#'
#'@details takes the necessary formula for analyzing categorical and numeric data columns.
#'
#'@export
#'
#'@examples
#'\dontrun{
#' # analysis of variance in multiple categorical groups
#' anova <- oneway(mtcars$mpg ~ mtcars$cyl, mtcars)
#'
#'#' # another example without $ format
#' anova <- oneway(mpg ~ cyl, mtcars)
#'  }

oneway <- function(formula, data) {

  # listwise deletion of missing values
  data_complete <- na.omit(data)

  # anova
  fit <- lm(formula, data_complete)

  stats <-  aggregate(formula,
                     data,
                     function(x) c(n = length(x), mean = mean(x), sd = sd(x)))


  result <- list(anova = fit, summarystats = stats)
  class(result) <- c("oneway", "list")
  return(result)

}
