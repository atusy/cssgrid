test_that("Construct grid-template-areas property", {
  ans <- structure("'a b' 'a c'", class = c("grid_areas", "character"))

  test <- lapply(
    list(
      c("a b", "a c"),
      matrix(c("a", "a", "b", "c"), nrow = 2L, ncol = 2L),
      data.frame(x1 = c("a", "a"), x2 = c("b", "c")),
      NULL
    ),
    construct_areas
  )

  n <- length(test)

  lapply(test[-n], expect_equal, ans)
  expect_equal(test[[n]], NULL)
})

test_that("Construction fails if list is given", {
  expect_error(construct_areas(list()))
})

test_that("Returns as is if input is grid_areas class object", {
  x <- structure("foo", class = "grid_areas")
  expect_identical(construct_areas(x), x)
})
