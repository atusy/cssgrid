#' Collapse character vectors into a string
#'
#' @param ... Vectors to be collapsed
#' @param sep A string as a separator
#'
#' @noRd
collapse <- function(..., sep = " ") {
  x <- c(...)
  if (is.null(x)) return(NULL)
  paste(x, collapse = sep)
}
