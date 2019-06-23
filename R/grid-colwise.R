#' @include grid-rowwise.R
#' @rdname grid_rowwise
#' @aliases grid_colwise
#' @export
grid_colwise <- function(..., rows = character(0L)) {
  n <- n_item(...) - sum(lengths(strsplit(rows, " +")))
  rows <- c(rows, rep("auto", n * (n > 0)))
  grid_layout(..., rows = rows)
}
