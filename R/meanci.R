#' meanci
#'
#' Calculate n, mean and upper/lower confidence intervals for one or more variables,
#' while grouping by one or more variables
#'
#' @param dataset The dataset to use
#' @param group_by_vars The grouping variable(s) to use, given as a character vector
#' @param ... The variable(s) to calculate means and CIs for
#'
#' @examples
#'
#' # Calculate mean and CI for `disp`, grouping by `cyl`, using mtcars data
#' mtcars %>% meanci(group_by_vars = c('cyl'), hp)
#'
#' # Calculate mean and CI for `hp`, grouping by `cyl` and `gear`, using mtcars data
#' mtcars %>% meanci(group_by_vars = c('cyl', 'gear'), hp)
#'
#' @import dplyr
#' @import magrittr
#' @import Rmisc
#' @export

meanci <- function(dataset, group_by_vars, ...){
  dataset %>%
    group_by(!!! syms(group_by_vars)) %>%
    summarize_at(vars(...), list(n = ~n(),
                                 mean = ~mean(.),
                                 ci.l = ~CI(.)[3],
                                 ci.u = ~CI(.)[1])) %>%
    return()
}
