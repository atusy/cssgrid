#' Construct an item to be contained by CSS grid layout
#'
#' @param row_start,row_end,row,column_start,column_end,column,area
#'  CSS properties of `gird-*`, whereas `grid-` is abbreviated, and hyphens are
#'  replaced by underscores. For example, the `row_start` argument is equivalent
#'  to the CSS's `grid-row-start` property. Specify a string as a value for the
#'  corresponding CSS property.
#' @param justify_self,align_self
#'  One of `""`, `"start"`, `"center"`, or `"end"` which can be partial matched.
#'  `""` does not specify the corresponding CSS property (`justify-self`, and
#'  `align-self`, respctively).
#' @param z_index,order
#'  A string to specify the corresponding CSS property (`z-index` and `order`,
#'  respectively)
#' @inheritParams grid_layout
#'
#' @export
grid_item <- function(
  ...,
  row_start = NULL,
  row_end = NULL,
  row = NULL,
  column_start = NULL,
  column_end = NULL,
  column = NULL,
  area = NULL,
  justify_self = c("", "start", "center", "end"),
  align_self = c("", "start", "center", "end"),
  z_index = NULL,
  order = NULL,
  style = NULL
) {
  justify_self <- match.arg(justify_self)
  align_self <- match.arg(align_self)
  div(
    ...,
    style = paste0(construct_style(
      "grid-row-start" = row_start,
      "grid-row-end" = row_end,
      "grid-row" = row,
      "grid-column-start" = column_start,
      "grid-column-end" = column_end,
      "grid-column" = col,
      "grid-area" = area,
      "justify-self" = justify_self,
      "align-sef" = align_self,
      "z-index" = z_index,
      order = order
    ), style)
  )
}
