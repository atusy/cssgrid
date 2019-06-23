test_that("NULL if no arguments", {
  expect_null(construct_style())
})

test_that("Error if there is unnamed arguments", {
  expect_error(construct_style("bar"))
  expect_error(construct_style(foo = "bar", "buzz"))
})

test_that('Skip property when value is ""', {
  expect_null(construct_style(foo = ""))
  expect_identical(construct_style(foo = "", fizz = "buzz"), "fizz: buzz;")
  expect_identical(construct_style(fizz = "buzz", foo = ""), "fizz: buzz;")
})

test_that("Style can be produced from strings, vectors, or mixed", {
  expect_equal(construct_style(foo = "bar"), "foo: bar;")
  expect_equal(construct_style(foo = "bar", fizz = "buzz"), "foo: bar; fizz: buzz;")
  expect_equal(construct_style(c(foo = "bar", fizz = "buzz")), "foo: bar; fizz: buzz;")
  expect_equal(
    construct_style(c(foo = "bar", fizz = "buzz"), hoge = "fuga"),
    "foo: bar; fizz: buzz; hoge: fuga;"
  )
})
