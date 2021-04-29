library(texmex)
library(evd)
library(rmutil)
library(ismev)

# dat: A (nxp) numeric matrix or data.frame that contains the data
# which: The variable indexed by the column number on which to condition
# mqu: Marginal quantiles 
# dqu: Dependence quantile
# x_pred: A vector in which the conditional quantiles will be calculated 
# p: The quantile levels of interest
# type: The type of sample quantile algorithm. This is an integer between 1 and 9

CEVFit <- function(dat, which = 2, mqu = c(0.75, 0.6),
                   dqu = 0.6, constrain = F, x_pred,
                   p, type = 8){
  fit <- mex(dat, which = which, mqu = mqu,
             dqu = dqu, constrain = constrain)
  gpd2 <- fit$margins$models$Column2$par
  gpd2[1] = exp(gpd2[1])
  thres2 <- fit$margins$models$Column2$threshold
  x <- x_pred
  p2 <- mqu[2] + (1 - mqu[2]) * evd::pgpd(x, thres2, gpd2[1], gpd2[2])
  xx <- qlaplace(p2)
  z <- fit$dependence$Z
  n <- length(x)
  yy <- array(dim = c(n, length(z)))
  depPars = fit$dependence$coefficients[1:2]
  for (j in 1:n){
    yy[j,] = depPars[1] * xx[j] + xx[j]^(depPars[2]) * z
  }
  py <- apply(yy, 1, function(x) plaplace(quantile(x, p, type = type)))
  rate1 <- fit$margins$models$Column1$rate
  gpd1 = fit$margins$models$Column1$par
  gpd1[1] = exp(gpd1[1])
  thres1 <- fit$margins$models$Column1$threshold
  y <- array(dim = c(5, length(x_pred)))
  for (i in 1:5){
    for (j in 1:length(x_pred)){
      if (py[i, j] > 1 - rate1) {
        y[i, j] = evd::qgpd((py[i, j] - 1 + rate1) / rate1, thres1, gpd1[1], gpd1[2])
      } else {
        y[i, j] = quantile(dat[, 1], py[i, j], type = type)
      }
    }
  }
  return(list(y = y, x = x))
}