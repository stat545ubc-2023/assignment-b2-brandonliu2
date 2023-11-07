
<!-- README.md is generated from README.Rmd. Please edit that file -->

# countAllMissing

<!-- badges: start -->
<!-- badges: end -->

The goal of Package countAllMissing is to count the number of missing
items in each column. Given a data frame and a column to group by, this
function creates a new data frame with one row per level of the grouping
column. The output contains the levels of the grouping column, and the
count of missing values for all columns in the input data except the
grouping column.

## Installation

You can install the development version of countAllMissing from
[GitHub](https://github.com/stat545ubc-2023/assignment-b2-brandonliu2)
with:

``` r
# install.packages("devtools")
devtools::install_github("stat545ubc-2023/assignment-b2-brandonliu2")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(countAllMissing)

data <- data.frame(
  group = c("A", "A", "B", "B"),
  value = c(1, NA, 3, NA)
)
count_all_missing_by_group(data, group_col = "group")
#> # A tibble: 1 × 3
#>   `"group"` group value
#>   <chr>     <int> <int>
#> 1 group         0     2

## basic example code
```
