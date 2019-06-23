items <- tagList(div("a"), div("b"), div("c"))
expected <- div(
  items,
  style = "display: grid; grid-template-rows: 1fr 2fr auto;"
)
test_that("Simple usage", {
  expect_identical(grid_colwise(items, rows = "1fr 2fr auto"), expected)
  expect_identical(grid_colwise(items, rows = c("1fr", "2fr", "auto")), expected)
})

test_that("Missing rows is treated as auto", {
  expect_identical(grid_colwise(items, rows = c("1fr", "2fr")), expected)
})

test_that("Additional styles", {
  style = "border: solid black;"
  expected2 <- expected3 <- expected
  expected2$attribs$style <- paste(expected$attribs$style, style)
  expect_identical(
    grid_colwise(items, rows = c("1fr 2fr auto"), style = style), expected2
  )

  expected3$attribs$style <- paste(expected$attribs$style, "grid-row-gap: 10px;")
  expect_identical(
    grid_colwise(items, rows = c("1fr 2fr auto"), row_gap = "10px"), expected3
  )
  expect_identical(
    grid_colwise(items, rows = c("1fr 2fr"), row_gap = "10px"), expected3
  )
})
