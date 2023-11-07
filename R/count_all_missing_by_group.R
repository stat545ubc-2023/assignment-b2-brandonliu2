#' Count missing values for all columns by group
#' 
#' @description Given a data frame and a column to group by, this function creates a new data frame with one row per level of the grouping column. The output contains the levels of the grouping column, and the count of missing values for all columns in the input data except the grouping column.
#' 
#' @details This function uses `group_by()` and `summarize()` from the `dplyr` package to calculate the count of missing values for each group.
#' 
#' @param data A data frame or tibble.
#' @param group_col Column in the data to group by.
#' @param .groups (OPTIONAL) Controls the output data frame's grouping behavior. By default, it drops all levels of grouping ("drop"). Use "keep" to maintain grouping by the specified column. See the `summarize()` documentation in `dplyr` for additional options.
#' 
#' @return A data frame or tibble with the levels of the grouping column and the count of NAs within each level for all columns in the input data except the grouping column.
#' 
#' @export
count_all_missing_by_group <- function(data, group_col, .groups = "drop") { 
  
  if (!is.null(.groups)) { 
    if (!(.groups %in% c("drop_last", "drop", "keep", "rowwise"))) { 
         stop(".groups must be one of NULL, \"drop_last\", \"drop\", \"keep\", or \"rowwise\".")
    }
  }
  
  data |> 
    dplyr::group_by({{ group_col }}) |> 
    dplyr::summarize(across(everything(), ~sum(is.na(.x))), .groups = .groups)
}

#' @examples
#' data <- data.frame(
#'   group = c("A", "A", "B", "B"),
#'   value = c(1, NA, 3, NA)
#' )
#' count_all_missing_by_group(data, group_col = group)
