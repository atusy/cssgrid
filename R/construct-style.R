#' Construct a style attribute
#' @param ...
#'  Single strings for named arguments or named vectors for unnamed arguments
#' @noRd
construct_style <- function(...) {
  val <- c(...)
  use <- val != ""
  if (length(val[use]) == 0) return(NULL)

  var <- names(val)

  if (is.null(var) | any(var == "")) stop("Arguments must be named")

  paste0(collapse(
    paste0(var[use], ": ", unlist(val[use], use.names = FALSE)), sep = "; "
  ), ";")
}
