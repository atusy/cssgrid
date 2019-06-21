test_that("style attributes", {
  expect_identical(construct_style(foo = "bar"), "foo: bar;")
  expect_identical(
    construct_style(foo = "bar", hoge = "fuga"), "foo: bar; hoge: fuga;"
  )
  expect_identical(construct_style(c(foo = "bar")), "foo: bar;")
  expect_identical(
    construct_style(c(foo = "bar", hoge = "fuga")), "foo: bar; hoge: fuga;"
  )
  expect_equal(
    construct_style(c(foo = "bar", hoge = "fuga"), fizz = "buzz"),
    "foo: bar; hoge: fuga; fizz: buzz;"
  )
})
