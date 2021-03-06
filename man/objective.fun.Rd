% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Fun_Objective-func.R
\name{objective.fun}
\alias{objective.fun}
\title{Measure the goodness of fit for DYCD model simulations.}
\usage{
objective.fun(
  sim,
  obs,
  fun = "RMSE",
  start.date = "2017-06-06",
  end.date = "2020-02-29",
  min.depth = 0,
  max.depth = 33,
  by.value = 0.5
)
}
\arguments{
\item{sim}{a matrix of bio-geochemical variable values with column of time and row of depth.}

\item{obs}{a data frame of observed value, with three columns: Date, depth, value.}

\item{fun}{objective function to be calculated. Selected one from "NSE", "RMSE", "MAE","RAE", and "Pearson".}

\item{start.date, end.date}{the beginning and ending simulation dates for the intended DYRESM-CAEDYM model run. The date format must be "\%Y-\%m-\%d".}

\item{min.depth, max.depth}{minimum and maximum depth to be compared between simulations and observations.}

\item{by.value}{the value of increment for depth.}
}
\value{
a vector of objective function values. The first is NSE and the second is RMSE.
}
\description{
Five objective functions can be used to measure goodness of fit: 1) Nash-Sutcliffe efficiency coefficient (NSE),
   2) Root Mean Square Error (RMSE), 3) Mean Absolute Error (MAE), 4) Relative Absolute Error (RAE),
   and 5) Pearson's r.
}
