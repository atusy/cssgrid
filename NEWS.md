# cssgrid 0.1.0

- Added
  - `grid_layout()` that creates a CSS Grid Layout container for general purpose
  - `grid_item()` that creates items in a CSS Grid Layout container.
  - `grid_rowwise()` that creates a single rowwise layout with CSS Grid.
  - `grid_colwise()` that creates a single columnwise layout with CSS Grid.
  - `construct_areas()` that creates CSS values for `grid-template-areas`.
    This function is implicitly used by `grid_layout()`, but can also be used
    explicitly and specify the returned value to `areas` argument of `grid_layout()`.
- Achieved 100% code coverage
