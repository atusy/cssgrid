A <- div("A", area = "A")
B <- div("B", area = "B")
C <- div("C", area = "C")

style <- "display: grid;"

test_that("Arguments display and flow can be partially matched", {
  expect_equal(
    grid_layout(display = "g", flow = "row"),
    div(style = "display: grid; grid-auto-flow: row;")
  )
})

test_that("Ellipsis", {
  # items
  expect_equal(grid_layout(A), div(A, style = style))
  expect_equal(grid_layout(A, B), div(A, B, style = style))

  # class
  expect_equal(grid_layout(class = "foo"), div(style = style, class = "foo"))
})

test_that("Specify arguments other than ellipsis and style", {
  object <- grid_layout(
    display = c("grid", "inline-grid"),
    grid = paste(
       '"title tiltle" 50px',
       '"sidebar content 1fr"',
      '/ 100px   1fr',
      sep = "\n"
    ),
    # OR "auto-flow 100px / 200px 200px 200px"
    template = c("50px 1fr / 100px 1fr"), # rows / cols
    # OR
    #  "title   title"   100px
    #  "sidebar content" 1fr
    # / 100px  1fr
    template_rows = "50px 1fr",
    template_columns = "100px 1fr",
    template_areas = c("title   title",
                       "sidebar content"),
    auto_flow = "row",
    auto_rows = "1px",
    auto_columns = "1px",
    row_gap = "1px",
    column_gap = "1px",
    gap = "1px 1px",
    justify_content = "start",
    align_content = "start",
    justify_items = "start",
    align_items = "start",
    style = NULL
  )

  expected <- div(style = 'display: grid; grid: "title tiltle" 50px\n"sidebar content 1fr"\n/ 100px   1fr; grid-template: 50px 1fr / 100px 1fr; grid-template-rows: 50px 1fr; grid-template-columns: 100px 1fr; grid-template-areas: \'title   title\' \'sidebar content\'; grid-auto-flow: row; grid-auto-rows: 1px; grid-auto-columns: 1px; justify-content: start; align-content: start; grid-row-gap: 1px; grid-column-gap: 1px; grid-gap: 1px 1px; justify-content: start; align-content: start; justify-items: start; align-items: start;')

  expect_identical(object, expected)
})

test_that("Aliases have priorities", {
  alias <- "1fr"
  original <- "1fr 2fr"
  expect_identical(
    grid_layout(
      rows = alias, template_rows = original,
      cols = alias, template_columns = original,
      areas = "area", template_areas = '"A B" "C D"',
      auto_cols = "1px", auto_columns = "2px"
    ),
    div(style = "display: grid; grid-template-rows: 1fr; grid-template-columns: 1fr; grid-template-areas: 'area'; grid-auto-columns: 1px;")
  )
})
