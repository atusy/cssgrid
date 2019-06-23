#' Construct grid-template-areas property
#'
#' @param x NULL, an atomic vector, a matrix, or a data frame
#' @param ... discarded
#'
#' @export
construct_areas <- function(x = NULL, ...) UseMethod("construct_areas")

#' A helper function for construct_areas
#' @noRd
collapse_areas <- function(x) collapse(paste0("'", x, "'"))

as_grid_areas <- function(x) structure(x, class = c("grid_areas", class(x)))

#' @rdname construct_areas
#' @export
construct_areas.grid_areas <- function(x = NULL, ...) x

#' @rdname construct_areas
#' @export
construct_areas.default <- function(x = NULL, ...) {
  if (is.null(x)) return(NULL)
  if (!(is.atomic(x) & is.vector(x))) {
    stop("x must be either NULL, an atomic vector, a matrix, or a data frame")
  }
  as_grid_areas(collapse_areas(x))
}

#' @rdname construct_areas
#' @export
construct_areas.data.frame <- function(x, ...) {
  as_grid_areas(collapse_areas(Reduce(paste, x)))
}

#' @rdname construct_areas
#' @export
construct_areas.matrix <- function(x, ...) {
  as_grid_areas(collapse_areas(apply(x, 1L, collapse)))
}
