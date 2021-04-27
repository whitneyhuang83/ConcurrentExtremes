# Concurrent Extremes

## Publication
Our paper is available on arXiv [https://arxiv.org/pdf/2006.08720.pdf].

## Dependencies

Please make sure you have these packages installed: **qrnn**, **texmex**, **ismev**, **fitdistrplus**, **evd**, **rmutil**.

## Usage 

- R folder

The **FitCEV.R** contains the main functions to fit a CEV model. The `quinn_samp` function the specific implementation is largely based on the **texmex** package [[3]](#3). The `mex`
function estimates the .



The **NWexample.R** provides an example of using CEV and MCQRNN. 

- Data folder

Example datasets to which CEV and MCQRNN can be applied. The folder currenly contains ****, which is the 

## References

<a id="1">[1]</a> 
Heffernan, J. E., & Tawn, J. A. (2004). A conditional approach for multivariate extreme values (with discussion). Journal of the Royal Statistical Society: Series B (Statistical Methodology), 66(3), 497-546.

<a id="2">[2]</a> 
Cannon, A. J. (2018). Non-crossing nonlinear regression quantiles by monotone composite quantile regression neural network, with application to rainfall extremes. Stochastic environmental research and risk assessment, 32(11), 3207-3225.

<a id="3">[3]</a> 
Southworth, H., Heffernan, J. E., Southworth, M. H., & Suggests, M. A. S. S. (2020). Package ‘texmex’.

