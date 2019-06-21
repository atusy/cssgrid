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

#' @rdname construct_areas
#' @export
construct_areas.default <- function(x = NULL, ...) {
  if (is.null(x)) return(NULL)
  if (!(is.atomic(x) & is.vector(x))) {
    stop("x must be either NULL, an atomic vector, a matrix, or a data frame")
  }
  collapse_areas(x)
}

#' @rdname construct_areas
#' @export
construct_areas.character <- function(x, ...) collapse_areas(x)

#' @rdname construct_areas
#' @export
construct_areas.data.frame <- function(x, ...) collapse_areas(Reduce(paste, x))

#' @rdname construct_areas
#' @export
construct_areas.matrix <- function(x, ...) collapse_areas(apply(x, 1L, collapse))
