test_df <- data.frame(
  foo = c(1, 2, 2, 4, 5, 6, 1, 7),
  bar = c(2, 3, 4, 5, 6, 6, 7, 2)
)

test_that("stat_per_sum is ggproto", {
  expect_true(ggplot2::is.ggproto(stat_per_sum()))
})

test_that("stat_quant is ggproto", {
  expect_true(ggplot2::is.ggproto(stat_quant()))
})

test_that("stat_cum_per_poly is ggproto", {
  expect_true(ggplot2::is.ggproto(stat_cum_per_poly()))
})

test_that("stat_conf_int is ggproto", {
  expect_true(ggplot2::is.ggproto(stat_conf_int()))
})

test_that("stat_cum_per_poly has correct labels", {
  p <- ggplot2::ggplot(test_df) + stat_cum_per_poly(ggplot2::aes(x = foo))
  expect_equal(p$labels$x, "foo")
})

test_that("stat_quant has correct labels", {
  p <- ggplot2::ggplot(test_df) + stat_per_sum(ggplot2::aes(y = bar)) + stat_quant()
  expect_equal(p$labels$y, "bar")
})

test_that("stat_conf_int has correct labels", {
  p <- ggplot2::ggplot(test_df) + stat_per_sum(ggplot2::aes(y = bar)) + stat_conf_int()
  expect_equal(p$labels$y, "bar")
})