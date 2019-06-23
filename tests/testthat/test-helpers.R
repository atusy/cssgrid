test_that("has_class", {
  x <- list(1, "a", structure(1, class = c("foo", "numeric")))
  expect_identical(has_class(x, "numeric", "any"), c(TRUE, FALSE, TRUE))
  expect_identical(has_class(x, c("foo", "numeric"), "all"), c(FALSE, FALSE, TRUE))
})

test_that("is_named", {
  x <- structure(1:3, .Names = c("a", NA_character_, ""))
  expect_identical(is_named(x), c(TRUE, FALSE, FALSE))
  y <- 1:3
  expect_identical(is_named(y), c(FALSE, FALSE, FALSE))
})

test_that("n_item", {
  expect_equal(n_item("a", "b"), 2L)
  expect_equal(n_item(list("a", "b")), 2L)
  expect_equal(n_item(tagList("a", "b")), 2L)
  expect_equal(n_item(list("a", "b"), "c"), 3L)
})
