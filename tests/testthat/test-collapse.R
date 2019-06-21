test_that("Collapse vectors into a string", {
  expect_identical(collapse(), NULL)
  expect_identical(collapse(NULL), NULL)
  expect_identical(collapse(NULL, 1), "1")
  expect_identical(collapse(1, 2), "1 2")
  expect_identical(collapse(1, 2, sep = ","), "1,2")
  expect_identical(collapse(c(1, 2)), "1 2")
  expect_identical(collapse(c(1, 2), 2), "1 2 2")
})
