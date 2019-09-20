# tyleR

Convenience functions that I wrote for myself.

# Functions

## `meanci()`

Calculate n, mean and upper/lower confidence intervals for one or more variables, while grouping by one or more variables.

Example:

```
library(tyleR)

mtcars %>% 
    meanci(group_by_vars = c('cyl'), hp)

# A tibble: 3 x 5
    cyl     n  mean  ci.l  ci.u
  <dbl> <int> <dbl> <dbl> <dbl>
1     4    11  82.6  68.6  96.7
2     6     7 122.   99.8 145. 
3     8    14 209.  180.  239. 
```

# Install

```
devtools::install_github("tylerburleigh/tyleR")
```
