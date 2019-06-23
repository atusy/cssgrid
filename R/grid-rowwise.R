#' Gird layout in single row or column
#'
#' @param ...
#'   Items in CSS Grid Layout and arguments passed to [`grid_layout`].
#' @param rows,cols
#'   Sizes of rows and columns in a character vector.
#'   If the given number of sizes are less than the number of items,
#'   then `"auto"` is used for items missing sizes.
#'
#' @name grid_rowwise
#' @export
grid_rowwise <- function(..., cols = character(0L)) {
  n <- n_item(...) - sum(lengths(strsplit(cols, " +")))
  cols <- c(cols, rep("auto", n * (n > 0)))
  grid_layout(..., cols = cols)
}
