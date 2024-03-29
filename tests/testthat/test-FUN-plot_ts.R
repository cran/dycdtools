test_that('plot_ts outputs a plot object',{

  obs <- data.frame(Date = '2020-01-01',
                   Depth = 0:5,
                   TEMP = 29:24)

  sim <- matrix(c(28,28,28,27,25,24),
               nrow = 6,
               ncol = 1)

  expect_true(is.object(plot_ts(sim = sim,
                                obs = obs,
                                target.depth = 1,
                                sim.start = '2020-01-01',
                                sim.end = '2020-01-01',
                                plot.start = '2020-01-01',
                                plot.end = '2020-01-01',
                                ylabel = 'degrees',
                                min.depth = 0,
                                max.depth = 5,
                                by.value = 1)))

})


test_that('plot_ts accept right format of date',{

  obs <- data.frame(Date = '2020-01-01',
                   Depth = 0:5,
                   TEMP = 29:24)

  sim <- matrix(c(28,28,28,27,25,24),
               nrow = 6,
               ncol = 1)

  expect_error(is.object(plot_ts(sim = sim,
                                   obs = obs,
                                   sim.start = '01-01-2020',
                                   sim.end = '2020-01-01',
                                   plot.start = '2020-01-01',
                                   plot.end = '2020-01-01',
                                   ylabel = 'degrees',
                                   min.depth = 0,
                                   max.depth = 5,
                                   by.value = 1)))

})
