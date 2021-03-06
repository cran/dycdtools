% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Fun_TS-plot.R
\name{plot_ts}
\alias{plot_ts}
\title{Time series plot of simulated and observed values}
\usage{
plot_ts(
  sim = temp.interpolated,
  obs = obs.temp,
  target.depth = c(1, 6, 12, 30),
  sim.start = "2017-06-06",
  sim.end = "2020-02-29",
  plot.start = "2017-06-06",
  plot.end = "2020-02-29",
  min.depth = 0,
  max.depth = 33,
  by.value = 0.5,
  ylabel = "Temperature °C",
  plot.save = FALSE,
  file_name,
  height = 7,
  width = 11
)
}
\arguments{
\item{sim}{interpolated values of variable}

\item{obs}{observed values of variable}

\item{target.depth}{a vector of depth (unit:m) to be used to extract and plot variable values.}

\item{sim.start, sim.end}{the beginning and ending simulation dates for the intended DYRESM-CAEDYM model run. The date format must be "\%Y-\%m-\%d".}

\item{plot.start, plot.end}{the beginning and ending dates for the plotting purpose. The date format must be "\%Y-\%m-\%d".}

\item{min.depth, max.depth, by.value}{minimum and maximum depth for the profile plot at the depth increment of by.value.}

\item{ylabel}{the y axis title.}

\item{plot.save}{if TRUE, the plot is saved with the "height","width", and "ppi" parameters.}

\item{file_name}{the file path to save the generated ts plot.}

\item{height, width}{the height and width of the time series figure.}
}
\value{
a plot of sim and obs time series.
}
\description{
Time series plot of simulated and observed values
}
\examples{
 var.values<-ext.output(dycd.output=system.file("extdata", "dysim.nc", package = "dycdtools"),
                       var.extract=c("TEMP"))

 for(i in 1:length(var.values)){
   expres<-paste0(names(var.values)[i],"<-data.frame(var.values[[",i,"]])")
   eval(parse(text=expres))
  }

# interpolate temperature for depths from 0 to 13 m at increment of 0.5 m
  temp.interpolated<-interpol(layerHeights = dyresmLAYER_HTS_Var,
                             var = dyresmTEMPTURE_Var,
                             min.dept = 0,max.dept = 13,by.value = 0.5)

 data(obs_temp)
# time series plot of temperature sim and obs
 plot_ts(sim = temp.interpolated,
         obs = obs_temp,
         target.depth=c(1,6),
         sim.start="2017-06-06",
         sim.end="2017-06-15",
         plot.start="2017-06-06",
         plot.end="2017-06-15",
         ylabel="Temperature \u00B0C",
         min.depth=0,
         max.depth=13,
         by.value=0.5)


}
