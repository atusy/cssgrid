items <- tagList(div("a"), div("b"), div("c"))
expected <- div(
  items,
  style = "display: grid; grid-template-columns: 1fr 2fr auto;"
)
test_that("Simple usage", {
  expect_identical(grid_rowwise(items, cols = "1fr 2fr auto"), expected)
  expect_identical(grid_rowwise(items, cols = c("1fr", "2fr", "auto")), expected)
})

test_that("Missing cols is treated as auto", {
  expect_identical(grid_rowwise(items, cols = c("1fr", "2fr")), expected)
})

test_that("Additional styles", {
  style = "border: solid black;"
  expected2 <- expected3 <- expected
  expected2$attribs$style <- paste(expected$attribs$style, style)
  expect_identical(
    grid_rowwise(items, cols = c("1fr 2fr auto"), style = style), expected2
  )

  expected3$attribs$style <- paste(expected$attribs$style, "grid-column-gap: 10px;")
  expect_identical(
    grid_rowwise(items, cols = c("1fr 2fr auto"), column_gap = "10px"), expected3
  )
  expect_identical(
    grid_rowwise(items, cols = c("1fr 2fr"), column_gap = "10px"), expected3
  )
})
