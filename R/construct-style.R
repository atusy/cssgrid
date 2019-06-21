#' Construct a style attribute
#' @param ...
#'  Single strings for named arguments or named vectors for unnamed arguments
#' @noRd
construct_style <- function(...) {
  val <- c(...)
  var <- names(val)
  use <- val != ""

  paste0(collapse(
    paste0(var[use], ": ", unlist(val[use], use.names = FALSE)), sep = "; "
  ), ";")
}
