test_that("stat_per_sum is ggproto", {
  expect_true(ggplot2::is.ggproto(stat_per_sum()))
})

test_that("stat_quant is ggproto", {
  expect_true(ggplot2::is.ggproto(stat_quant()))
})

test_that("stat_cum_per_poly is ggproto", {
  expect_true(ggplot2::is.ggproto(stat_cum_per_poly()))
})
