test_that("No argument", {
  object <- grid_item()
  expect_identical(object, div(style = NULL))
})

test_that("Unnamed arguments become div", {
  expect_identical(grid_item("a"), div("a", style = NULL))
})

test_that("Named arguments as ellipsis becomes attribs", {
  expect_identical(grid_item(class = "foo"), div(class = "foo"))
})

test_that("Arguments other than ellipsis", {
  object <- grid_item(
    row_start = 1,
    row_end = 2,
    row = "1 / 2",
    column_start = 1,
    column_end = 2,
    col = "1 / 2",
    area = "area",
    justify_self = "start",
    align_self = "end",
    z_index = 1,
    order = 1,
    style = "width: auto;"
  )
  expected <- div(style = "grid-row-start: 1; grid-row-end: 2; grid-row: 1 / 2; grid-column-start: 1; grid-column-end: 2; grid-column: 1 / 2; grid-area: area; justify-self: start; align-self: end; z-index: 1; order: 1; width: auto;")
  expect_identical(object, expected)

  # Without additional style
  object <- grid_item(row_start = 1, row_end = 2)
  expected <- div(style = "grid-row-start: 1; grid-row-end: 2;")
  expect_identical(object, expected)
})

test_that("Alias arguments have priorities", {
  expect_identical(
    grid_item(col = "1 / 2", column = "1 / 3"),
    div(style = "grid-column: 1 / 2;")
  )
})
