#######################################################################################
# Date: 05/12/2010
# Author: Michelle Shardell, PhD
# This program is a function for sample size calculation for continuous outcome data
# with external pilot data using methods (Web Appendix Equation 2) described in:  
#
#  Shardell MD, El-Kamary SS. Calculating sample size for studies with expected 
#     all-or-none nonadherence and selection bias. Biometrics. 2009 Jun;65(2):635-9. 
######################################################################################

#test if ssanv installed
if("ssanv" %in% rownames(installed.packages()) == FALSE) {install.packages("ssanv")}

library(ssanv)


######################################################################################
# ss.noncomp.expilot - function to compute sample size for difference in means of 
#              continuous outcomes between 2 groups with all-or-none noncompliance and
#              selection bias using external pilot data.
######################################################################################

ss.noncomp.expilot <- function (delta = NULL, sigma.0p.sq = NULL, sigma.1p.sq = sigma.0p.sq, 
                                rho.cp = NULL, n0.p = NULL, n1.p = n0.p, ss.ratio=(n1.p/n0.p),  
                                sig.level = 0.05, power = 0.8, alternative = c("two.sided", 
                                                                               "one.sided"))
{
  
  alternative <- match.arg(alternative)
  tside <- switch(alternative, one.sided = 1, two.sided = 2)
  
  NOTE <- " n0 is number in *control* group\n\tn1 is number in *treatment* group"
  METHOD <- "Two-sample difference in means sample size with all-or-none non-compliance using external pilot data"
  if (is.null(delta) | is.null(sigma.0p.sq) | is.null(rho.cp) | is.null(n0.p)) {
    stop("give values for 'delta.p' and 'sigma.0p.sq' and 'rho.cp' and 'no.p'")
  }
  
  delta.star <- rho.cp * delta
  if (delta.star > 0) {
    if (tside == 1) 
      alternative <- paste(alternative, ", delta > ", 
                           "0", sep = "")
  }
  else if (delta.star < 0) {
    delta.star <- abs(delta.star)
    if (tside == 1) 
      alternative <- paste(alternative, ", delta < ", 
                           "0", sep = "")
  }
  else {
    stop("delta.star cannot equal 0")
  }
  
 
 
  #satterthwaite approximation 
  tau.p.sq <- (sigma.0p.sq/n0.p + sigma.1p.sq/n1.p)
  nu.p   <- ((tau.p.sq)^2)/(sigma.0p.sq^2/((n0.p - 1) * n0.p^2) + sigma.1p.sq^2/((n1.p - 
                                                                                    1) * n1.p^2))
  nu.p[nu.p < 1] <- 1
  
  
  ta <- qt(1 - sig.level/tside, nu.p)
  tb <- qt(power, nu.p)
  
  N0 <- (ta + tb)^2 * (sigma.0p.sq + sigma.1p.sq/ss.ratio) / delta.star^2 + 1
  
  
  output <- list(n0 = ceiling(N0), n1 = ceiling(ss.ratio * 
                                                  N0), delta = delta, rho.cp=rho.cp, 
                 delta.star = delta.star,
                 sigma.0p.sq = sigma.0p.sq, sigma.1p.sq = sigma.1p.sq, 
                 n0.p = n0.p, n1.p=n1.p, ss.ratio=ss.ratio,
                 sig.level = sig.level, 
                 power = power, alternative = alternative, note = NOTE, 
                 method = METHOD)
  structure(output, class = "power.htest")
}


