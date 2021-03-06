#' Interpolation of simulation for a series of user-defined depths.
#'
#' @description Convert simulated variable at irregular layer heights to a dataframe of the same variable at sequenced layer heights.
#'
#' @param layerHeights layer heights, extracted from DYCD outputs
#' @param var simulated variable values, extracted from DYCD outputs
#' @param min.depth,max.depth,by.value minimum and maximum depth for interpolation at the depth increment of by.value.
#'
#' @importFrom stats approx na.omit
#' @return a matrix of interpolated values of such variable.
#'
#' @examples
#' # extract simulated temperature values from DYRESM-CAEDYM simulation file
#'  var.values<-ext.output(dycd.output=system.file("extdata", "dysim.nc", package = "dycdtools"),
#'                        var.extract=c("TEMP"))
#'
#'  for(i in 1:length(var.values)){
#'   expres<-paste0(names(var.values)[i],"<-data.frame(var.values[[",i,"]])")
#'   eval(parse(text=expres))
#'  }
#'  # interpolate temperature for depths from 0 to 13 m at increment of 0.5 m
#'  temp.interpolated<-interpol(layerHeights = dyresmLAYER_HTS_Var,
#'                             var = dyresmTEMPTURE_Var,
#'                             min.dept = 0,max.dept = 13,by.value = 0.5)
#'
#' @export

interpol<-function(layerHeights,
                   var,
                   min.depth,
                   max.depth,
                   by.value){
  x<-apply(layerHeights,2,FUN = function(a) hgt.to.dpt(a[!is.na(a)]))
  # var is for the middle of each layer
  # x.mid<-lapply(x,FUN = function(a) c(diff(a)/2,a[length(a)]/2*-1)+a)
  y<-apply(var,2,FUN = function(a) a[!is.na(a)])

  var.interpolated<-matrix(NA,nrow=length(seq(min.depth,max.depth,by=by.value)),ncol=length(x))
  for(i in 1:length(x)){
    var.interpolated[,i]<-approx(x[[i]],y[[i]],xout = seq(min.depth,max.depth,by=by.value),rule = 2,method = "linear")[[2]]
  }

  return(var.interpolated)
}
