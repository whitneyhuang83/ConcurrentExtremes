library(qrnn)
FitMCQRNN <- function(x, y, tau = seq(0.5, 0.9, by = 0.1),
                    n.hidden = 2, n.hidden2 = 2, x_Pred){
  n <- length(c(x))
  x = as.matrix(c(x), n, 1)
  y = as.matrix(c(y), n, 1)
  cases <- order(x)
  x <- x[cases,, drop = FALSE]
  y <- y[cases,, drop = FALSE]
  fit.mcqrnn <- mcqrnn.fit(x, y, tau = tau,
                           n.hidden = n.hidden,
                           n.hidden2 = n.hidden2,
                           n.trials = 1, iter.max = 500)
  xpred <- as.matrix(x_Pred, length(x_Pred), n)
  return(list(pred = mcqrnn.predict(xpred, fit.mcqrnn), x = xpred))
} 

FitQRNN <- function(x, y, tau = 0.9,
                    n.hidden = 2, x_Pred){
  n <- length(c(x))
  x = as.matrix(c(x), n, 1)
  y = as.matrix(c(y), n, 1)
  cases <- order(x)
  x <- x[cases,, drop = FALSE]
  y <- y[cases,, drop = FALSE]
  fit.qrnn <- qrnn.fit(x, y, tau = tau,
                       n.hidden = n.hidden,
                       n.trials = 1, iter.max = 500)
  xpred <- as.matrix(x_Pred, length(x_Pred), n)
  return(list(pred = qrnn.predict(xpred, fit.qrnn), x = xpred))
} 
