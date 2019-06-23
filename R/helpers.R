# Helper functions

#' Check if each element has expected class(es)
#'
#' Vectorized
#'
#' @param x A vector, typicall a list.
#' @param expected Expected class(es)
#' @param by
#'  `"any"` (default) checks if an element has any one of expected class(es) and
#'  `"all"` checks if an element has all of the expected class(es).
#'
#' @noRd
has_class <- function(x, expected, by = c("any", "all")) {
  .by <- match.fun(match.arg(by))
  vapply(x, function(x) .by(expected %in% class(x)), TRUE)
}

#' Check if each element has valid names
#'
#' Valid names are characters except `""` and `Na_character`, who will cause
#' error if trying to name with `c` or `list` (e.g., `c("" = 1)` and `c(NA = 2)`
#' return errors).
#'
#' @param x A vector
#'
#' @noRd
is_named <- function(x) {
  nm <- names(x)
  if (is.null(nm)) rep(FALSE, length(x)) else !(nm %in% c(NA_character_, ""))
}

#' Number of items contained by CSS Grid
#'
#' If [`tagList()`]` is given, it is not counted as 1 but by the number of its
#' elements.
#'
#' @noRd
n_item <- function(...) {
  ellipsis <- list(...)
  unnamed <- !is_named(ellipsis)
  is_tagList <- has_class(ellipsis, c("shiny.tag.list", "list"), by = "any")
  sum(unnamed & !is_tagList) + sum(lengths(ellipsis[unnamed & is_tagList]))
}
