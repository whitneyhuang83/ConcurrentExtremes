# Concurrent Extremes

## Publication
Our paper is available on arXiv [https://arxiv.org/pdf/2006.08720.pdf].

## Dependencies

Please make sure you have these packages installed: **qrnn**, **texmex**, **ismev**, **fitdistrplus**, **evd**, **rmutil**, **extRemes**.

## Usage 

- R folder

The **FitCEV.R** contains the functions `CEVFit` to fit a CEV model [[1]](#1). The implementation of `CEVFIT` is largely based on the `mex` function on the **texmex** package [[3]](#3). 

The **FitMCQRNN.R** contains the function `FitMCQRNN` to fit a MCQRNN model [[2]](#2). The implementation of `FitMCQRNN` is largely based on the `mcqrnn.fit` function on the **qrnn** package. 


The **Example.pdf** provides an example of using CEV and MCQRNN to estimate conditional upper quantiles of daily wind speed distribution given that the concurrent daily precipitation being seasonal maximunm.    

- Data folder

An Example dataset to which CEV and MCQRNN can be applied. The folder currenly contains **NW_pr_w.RData**, which contains the daily output of wind speed and preciptation amount at a Pacific Northwest coastal region grid cell (NW) obtained from the CanRCM4 Large Ensemble [[4]](#4).

## References

<a id="1">[1]</a> 
Heffernan, J. E., & Tawn, J. A. (2004). A conditional approach for multivariate extreme values (with discussion). Journal of the Royal Statistical Society: Series B (Statistical Methodology), 66(3), 497-546.

<a id="2">[2]</a> 
Cannon, A. J. (2018). Non-crossing nonlinear regression quantiles by monotone composite quantile regression neural network, with application to rainfall extremes. Stochastic environmental research and risk assessment, 32(11), 3207-3225.

<a id="3">[3]</a> 
Southworth, H., Heffernan, J. E., Southworth, M. H., & Suggests, M. A. S. S. (2020). Package ‘texmex’.

<a id="4">[4]</a> 

Fyfe, J. C., Derksen, C., Mudryk, L., Flato, G. M., Santer, B. D., Swart, N. C., ... & Jiao, Y. (2017). Large near-term projected snowpack loss over the western United States. Nature communications, 8(1), 1-7.


