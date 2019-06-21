#' Generate CSS grid
#'
#' @param ... Items in the container
#' @param display
#'  Specifies the CSS's `display` property by `"display"`, `"inline-display"`.
#'  Partial matching is used.
#' @param rows,cols,areas,flow
#'  Aliases of `template_rows`, `template_columns`, and `template_areas`,
#'  respectively`
#' @param template_rows,template_columns
#'  A character vector to specify size of each rows and columns in the grid
#'  such as `"100px 1fr"` or `c("100px", "1fr")`. Default is `NULL`.
#' @param template_areas
#'  A vector, a matrix, or a data frame.
#'  If a vector, separate names of each areas in a row by space,
#'  and separate columns by elements such as `c("a b", "c d")`.
#'  If a matrix or a data frame, names and positions of each elements indicate
#'  the name of area and the position of area, respectively.
#'  Default is `NULL`.
#' @param template,auto_flow,auto_rows,auto_columns,row_gap,column_gap,gap,grid
#'  CSS properties of `gird-*`, whereas `grid-` is abbreviated, and hyphens
#'  are replaced by underscores. Specify string that muches the style of a
#'  certain CSS property. For example, the `template_rows` argument is
#'  equivalent to the CSS's `grid-template-rows` property. An exception is the
#'  `grid` argument which is equivalent to the CSS's `grid` property. The
#'  `auto_flow` argument can be specified by `""`, `"row"`, `"column"` or `"dense"`.
#'  Partial matching is used and `""` skip specifying `grid-flow`. For details,
#'  see documents of [CSS properties of CSS Grid Layout by Mozilla](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Grid_Layout#CSS_properties).
#'  Default values are `NULL` or `""`.
#' @param justify_content,align_content,justify_items,align_items
#'  Arguments equivalent to the CSS's
#'  [`justify-content`](https://developer.mozilla.org/en-US/docs/Web/CSS/justify-content),
#'  [`align-content`](https://developer.mozilla.org/en-US/docs/Web/CSS/align-content),
#'  [`justify-items`](https://developer.mozilla.org/en-US/docs/Web/CSS/justify-items),
#'  [`align_items`](https://developer.mozilla.org/en-US/docs/Web/CSS/align-items)
#'  properties, respectively.`
#'  Possible values are "", "start", "center", or "end". Partial matching is used,
#'  and "" skip specifying the corresponding properties.
#' @param style Additional values of the style attribute such as `color: red;`.
# @param itemize
#  Whether to automatically itemize `...` (Default: `FALSE``).
#  If `TRUE`, `...` are itemized by `div`.
#  Alternatively, a function can be specified as itemizer.
#' @param style_items
#'  A common style attribute for items when `itemize = TRUE`
#'
#' @details
#'  Default values of `NULL` or `""` indicate the corresponding CSS properties
#'  are not specified.
#'
#' @importFrom htmltools tagList
#' @export
grid_layout <- function(
  ...,
  display = c("grid", "inline-grid"),
  rows = template_rows, template_rows = NULL,
  cols = template_columns, template_columns = NULL,
  areas = template_areas, template_areas = NULL,
  template = NULL,
  flow = auto_flow, auto_flow = c("", "row", "column", "dense"),
  auto_rows =  NULL,
  auto_columns = NULL,
  row_gap = NULL,
  column_gap = NULL,
  gap = NULL,
  grid = NULL,
  justify_content = c("", "start", "center", "end"),
  align_content = c("", "start", "center", "end"),
  justify_items = c("", "start", "center", "end"),
  align_items = c("", "start", "center", "end"),
  style = NULL,
  # itemize = FALSE,
  style_items = NULL
) {
  display <- match.arg(display)
  flow <- match.arg(flow, auto_flow)
  justify_content <- match.arg(justify_content)
  align_content <- match.arg(align_content)
  justify_items <- match.arg(justify_items)
  align_items <- match.arg(align_items)
  force(c(rows, cols, areas, flow))

  # if (isTRUE(itemize)) itemize <- div
  # items <- if (is.function(itemize)) {
  #   tagList(lapply(list(...), itemize, style = style_items))
  # } else {
  #   tagList(...)
  # }

  tags$div(
    style = paste0(construct_style(
      display = display,
      "grid-template-rows" = collapse(rows),
      "grid-template-columns" = collapse(cols),
      "grid-template-areas" = construct_areas(areas),
      "grid-template" = template,
      "grid-auto-flow" = flow,
      "grid-auto-rows" = auto_rows,
      "grid-auto-columns" = auto_columns,
      "justify-content" = justify_content,
      "align-content" = align_content,
      "grid-row-gap" = row_gap,
      "grid-column-gap" = column_gap,
      "grid-gap" = gap,
      "grid" = grid,
      "justify-content" = justify_content,
      "align-content" = align_content,
      "justify-items" = justify_items,
      "align-items" = align_items
    ), style),
    ...
  )
}
