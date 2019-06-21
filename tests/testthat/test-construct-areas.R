test_that("Construct grid-template-areas property", {
  ans <- "'a b' 'a c'"

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
