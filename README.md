
<!-- README.md is generated from README.Rmd. Please edit that file -->

# cssgrid

<!-- badges: start -->

[![Travis build
status](https://travis-ci.org/atusy/cssgrid.svg?branch=master)](https://travis-ci.org/atusy/cssgrid)
[![Codecov test
coverage](https://codecov.io/gh/atusy/cssgrid/branch/master/graph/badge.svg)](https://codecov.io/gh/atusy/cssgrid?branch=master)
<!-- badges: end -->

CSS Grid Layout for R Markdown and Shiny

## Installation

``` r
source("https://install-github.me/atusy/cssgrid")
```

## Example

``` r
library(cssgrid)
style <- "border: solid black;"
grid_layout(
  grid_item("A", area = "a", style = style),
  grid_item("B", area = "b", style = style),
  grid_item("C", area = "c", style = style),
  cols = c("1fr 2fr"), rows = c("1fr 1fr"), areas = c("a b", "a c"),
  style = style
)
```

<!--html_preserve-->

<div style="display: grid; grid-template-rows: 1fr 1fr; grid-template-columns: 1fr 2fr; grid-template-areas: &#39;a b&#39; &#39;a c&#39;;border: solid black;">

<div style="grid-column: function (x, as.factor = FALSE) 
{
    if (as.factor) {
        labs &lt;- colnames(x, do.NULL = FALSE, prefix = &quot;&quot;)
        res &lt;- factor(.Internal(col(dim(x))), labels = labs)
        dim(res) &lt;- dim(x)
        res
    }
    else .Internal(col(dim(x)))
}; grid-area: a;border: solid black;">

A

</div>

<div style="grid-column: function (x, as.factor = FALSE) 
{
    if (as.factor) {
        labs &lt;- colnames(x, do.NULL = FALSE, prefix = &quot;&quot;)
        res &lt;- factor(.Internal(col(dim(x))), labels = labs)
        dim(res) &lt;- dim(x)
        res
    }
    else .Internal(col(dim(x)))
}; grid-area: b;border: solid black;">

B

</div>

<div style="grid-column: function (x, as.factor = FALSE) 
{
    if (as.factor) {
        labs &lt;- colnames(x, do.NULL = FALSE, prefix = &quot;&quot;)
        res &lt;- factor(.Internal(col(dim(x))), labels = labs)
        dim(res) &lt;- dim(x)
        res
    }
    else .Internal(col(dim(x)))
}; grid-area: c;border: solid black;">

C

</div>

</div>

<!--/html_preserve-->
